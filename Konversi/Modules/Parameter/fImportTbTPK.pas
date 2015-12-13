unit fImportTbTPK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, ADODB, AdvPanel, 
  
  AdvProgressBar, LMDCustomComponent,
  LMDWndProcComponent, LMDFormShadow;

type
  TfrmImportDBTPK = class(TForm)
    Timer1: TTimer;
    AdvPanel1: TAdvPanel;
    ProgressLabel: TLabel;
    ProgressBar11: TProgressBar;
    ProgressBar1: TAdvProgressBar;
    LMDFormShadow1: TLMDFormShadow;
    TPKQuery: TADOQuery;
    MainDBQuery: TADOQuery;
    TPKConn: TADOConnection;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
    FTotalRecord : Integer;
    FUserName,
    FUserGroup      : String;
    procedure DeleteAllRecords(strTable: String);
    procedure DoImport;
    procedure WriteToLog(Content: String);
    procedure ImportTPKTable(FldName, TbName:string);
    function CountAllRecord: Integer;

  public
    { Public declarations }
    procedure InitDBTPK;
    function IsDataExist:Boolean;
    property UserName: String Read FUserName Write FUserName;
    property UserGroup: String Read FUserGroup Write FUserGroup;
  end;

var
  frmImportDBTPK: TfrmImportDBTPK;

implementation

Uses fGlobalVarDM, fGlobalVar, fConst;

{$R *.dfm}


function TfrmImportDBTPK.CountAllRecord: Integer;
var
	i:Integer;
begin
  Result := -1;
  TPKQuery.Close;
  for i:=0 to High(DBTPK_REF_TABLE) do
  begin
    if i=0 then
    	TPKQuery.SQL.Text := 'SELECT COUNT(*) AS ItemCount FROM ' + DBTPK_REF_TABLE[i]
    else
    	TPKQuery.SQL.Add('UNION ALL SELECT COUNT(*) AS ItemCount FROM ' + DBTPK_REF_TABLE[i]);
  end;

  TPKQuery.Open;
  FTotalRecord := 0;
  While not TPKQuery.Eof do
  begin
    FTotalRecord := FTotalRecord + TPKQuery.FieldByName('ItemCount').AsInteger;
    TPKQuery.Next;
  end;
  TPKQuery.Close;

  //if FTotalRecord = 0 then
  //  Exit;

  ProgressBar1.Max := FTotalRecord;
  ProgressBar1.Position := 0;
  Result := FTotalRecord;
end;

procedure TfrmImportDBTPK.DeleteAllRecords(strTable: String);
begin
  ProgressLabel.Caption := 'Memeriksa tabel ' + strTable + '...';
  ProgressLabel.Refresh;
  Application.ProcessMessages;
  MainDBQuery.Close;
  MainDBQuery.SQL.Text := 'SELECT * FROM sysobjects WHERE name=''' + strTable + '''';
  MainDBQuery.Open;
  if MainDBQuery.RecordCount = 1 then
  begin
    ProgressLabel.Caption := 'Menghapus isi tabel ' + strTable + '...';
    ProgressLabel.Refresh;
    Application.ProcessMessages;
    MainDBQuery.Close;
    MainDBQuery.SQL.Text := 'DELETE FROM ' + strTable;
    MainDBQuery.ExecSQL;
  end
  else
  begin
    raise Exception.Create('Tabel '''+strTable+''' tidak ditemukan pada database master.');
  end;
end;

procedure TfrmImportDBTPK.WriteToLog(Content: String);
begin
	GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Content);
  //SaveLog('[Impor Tabel TPK] ' + Content, FUserName);
end;

procedure TfrmImportDBTPK.DoImport;
var
	i:Integer;
  totalRecord:Integer;
begin
	(*
  totalRecord := CountAllRecord;

  if totalRecord = -1 then
  begin
  	Application.MessageBox('Gagal mengambil total record. Proses dihentikan', PChar(Application.Title),  MB_OK +
    MB_ICONWARNING + MB_TOPMOST);
    Exit;
  end
  else if totalRecord = 0 then
  begin
  	Application.MessageBox('Tidak ada data untuk diimport.', PChar(Application.Title),  MB_OK +
    MB_ICONWARNING + MB_TOPMOST);
    Exit;
  end;
  *)

  for i:=0 to High(DBTPK_REF_TABLE) do
  begin
	  Application.ProcessMessages;
  	ImportTPKTable(DBTPK_FIELD_REF_TABLE[i], DBTPK_REF_TABLE[i]);
  	WriteToLog('Berhasil impor tabel ' + DBTPK_REF_TABLE[i]);
  end;

  //MappingREF_BANK;
  //WriteToLog('Berhasil mapping table');

  ProgressLabel.Caption := 'Selesai';
  ProgressLabel.Refresh;
  ProgressBar1.Position := 0;
  ProgressBar1.Refresh;

  Application.MessageBox('Import tabel TPK berhasil.', PChar(Application.Title), MB_OK +
    MB_ICONINFORMATION + MB_TOPMOST);

end;

procedure TfrmImportDBTPK.ImportTPKTable(FldName, TbName:string);
var
  tpkDS, tempDS:TADOQuery;
  SLFld:TStringList;
  i:integer;
begin
  tpkDS := TADOQuery.Create(nil);
  tempDS:=TADOQuery.Create(nil);
  try
    with tpkDS do
    begin
      if Active then Close;
      Connection := TPKConn;
      SQL.Clear;
      SQL.Add('SELECT ' + FldName + ' FROM ' + TbName);

      If (GlobalVarForm.PartialSyncOPSData) AND (Pos('OPS_', TbName)>0) then
      begin
        SQL.Add('WHERE TANGGAL=(SELECT CAST([VALUE] AS DATE) FROM REF_PARAMETER WHERE PARAMETER=''TransactionDate'' AND GROUPS=''System'') ');
      end;
      Open;
    end;


    DeleteAllRecords(TbName);

    ProgressLabel.Caption := 'Import tabel ' + TbName + '...';
    ProgressLabel.Refresh;
    Application.ProcessMessages;

    with tempDS do
    begin
      Connection:=GlobalVarDM.DailyADOConn;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + TbName + '(' + FldName + ') ');
      SQL.Add('VALUES (:' + StringReplace(FldName, ',', ',:', [rfReplaceAll, rfIgnoreCase]) + ')');

      tpkDS.First;
      while not tpkDS.Eof do
      begin
        for i:= 0 to Parameters.Count - 1 do
        begin
          if (tpkDS.Fields[i] is TBCDField) then
          begin
            try
              Parameters.Items[i].DataType := ftCurrency;
              Parameters.Items[i].Value := tpkDS.Fields[i].Value;
            except
              On E:Exception do
              begin
                if Pos('OVERFLOW',UpperCase(E.Message))>0 then
                begin
                  Parameters.Items[i].Value := StrToCurr('922337203685477') + (StrToCurr('50')/100);
                end
                else begin
                  Application.MessageBox(PChar(E.Message), PChar(Application.Title), MB_OK +
                    MB_ICONSTOP + MB_TOPMOST);
                  WriteToLog(Format('Sync.Tabel %s gagal: %s', [TbName,E.Message]));
                end;
              end;
            end;
          end
          else begin
          	Parameters.Items[i].DataType := tpkDS.Fields[i].DataType;
          	Parameters.Items[i].Value := tpkDS.Fields[i].Value;
          end;
        end;
        ExecSQL;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        ProgressBar1.Refresh;
        tpkDS.Next;
      end;
    end;
  finally
    tempDS.Free;
    tpkDS.Free;
  end;
end;

procedure TfrmImportDBTPK.FormShow(Sender: TObject);
begin
	frmImportDBTPK.InitDBTPK;
  Timer1.Enabled := True;
end;

procedure TfrmImportDBTPK.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Screen.Cursor := crHourGlass;
  try
    DoImport;
  finally
    Screen.Cursor := crDefault;
    Close;
  end
end;

procedure TfrmImportDBTPK.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MainDBQuery.Close;
  TPKQuery.Close;
end;


//abis import harus generate file text 1 table per 1 file
procedure TfrmImportDBTPK.FormCreate(Sender: TObject);
begin
  InitDBTPK;

	with TPKQuery do
  begin
    if Active then
    	Close;
    Connection := TPKConn; //GlobalVarDM.DBTPKADOConn;
  end;

  with MainDBQuery do
  begin
    if Active then
    	Close;
    Connection := GlobalVarDM.DailyADOConn;
  end;
end;

procedure TfrmImportDBTPK.InitDBTPK;
begin
  try
  	TPKConn.Connected := False;
  	TPKConn.ConnectionString := GlobalVarForm.TPKConnectionString;
  	TPKConn.Connected := True;
  Except
  	On E:Exception do
    begin
    	Application.MessageBox(PChar('Error Init SPK Database: ' + E.Message), PChar(Application.Title), MB_OK +
    	MB_ICONERROR + MB_TOPMOST);
    end;
  end;
end;

function TfrmImportDBTPK.IsDataExist: Boolean;
var
  totalRecord:Integer;
begin
  totalRecord := CountAllRecord;

  if totalRecord = -1 then
  begin
  	Application.MessageBox('Gagal mengambil total record. Proses dihentikan', PChar(Application.Title),  MB_OK +
    MB_ICONWARNING + MB_TOPMOST);
  end
  else if totalRecord = 0 then
  begin
  	Application.MessageBox('Tidak ada data untuk diimport.', PChar(Application.Title),  MB_OK +
    MB_ICONWARNING + MB_TOPMOST);
  end;

  Result := totalRecord > 0;
end;

procedure TfrmImportDBTPK.FormDestroy(Sender: TObject);
begin
  if MainDBQuery.Active then
  	MainDBQuery.Close;
  if TPKQuery.Active then
  	TPKQuery.Close;
end;

end.

