unit fSOD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, 
  LMDCustomComponent, LMDWndProcComponent, LMDFormShadow,
  AdvDateTimePicker, ExtCtrls, AdvPanel, JvGradientCaption,
  DB, ADODB, LMDBaseEdit, LMDCustomMemo, LMDMemo;

type
  TfrmSOD = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dtTglKliring: TAdvDateTimePicker;
    JvGradientCaption1: TJvGradientCaption;
    qryTemp: TADOQuery;
    meLog: TLMDMemo;
    btnSOD: TBitBtn;
    btnGeneralSave: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
    procedure btnGeneralSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure MoveDataToHistory;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSOD: TfrmSOD;

implementation

uses fGlobalVar, fGlobalVarDM, futils, fConst, uSetting;

{$R *.dfm}

procedure TfrmSOD.FormShow(Sender: TObject);
begin
	dtTglKliring.Date := GlobalVarForm.SystemToday;

	if GlobalVarForm.SystemStatus = SYS_STATUS_OPENED then
  begin
    dtTglKliring.Enabled := False;
  	Self.Caption := 'Akhir Hari';
    btnSOD.Caption := 'Akhir Hari';
    btnSOD.Tag := 0;
  end
  else begin
    dtTglKliring.Enabled := True;
  	Self.Caption := 'Awal Hari';
    btnSOD.Caption := 'Awal Hari';
    btnSOD.Tag := 1;
  end;
end;

procedure TfrmSOD.BitBtn2Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmSOD.btnGeneralEditClick(Sender: TObject);
var
	strMessage:string;
  strDataSource, strDailyDBName:string;
  strConn:string;
begin
	strDataSource := GlobalVarForm.DBDataSource;
  strDailyDBName := GlobalVarForm.DBDailyDBName;

  if btnSOD.Tag = 1 then
  	strMessage := Format('Yakin akan membuka sistem tanggal ''%s'' ?', [FormatDateTime('dd/mm/yyyy', dtTglKliring.Date)])
  else
		strMessage := Format('Yakin akan menutup sistem tanggal ''%s'' ?', [FormatDateTime('dd/mm/yyyy', dtTglKliring.Date)]);

  if (MessageDlg(strMessage, mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
  	Exit;

  GlobalVarForm.SystemStatus := btnSOD.Tag;
  if btnSOD.Tag = 1 then
	begin
  	GlobalVarForm.SystemToday := dtTglKliring.Date;
    GlobalVarDM.DoWriteLogDaily(UserName, MDL_SE, Format('SOD Tanggal %s', [FormatDateTime('dd/mm/yyyy', GlobalVarForm.SystemToday)]));

    if (MessageDlg('Apakah akan meng-import tabel dimensi SPK ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
    	//Self.Hide;
      ExecDLL(Application.Handle, 'libDIM.dll', 'CallImportDBTPK', FParam); //DLL Setting di rename jadi libDIM.dll;
    	//frmMain.actImportTPKExecute(Sender);
    end;

		MessageDlg(Format('System berhasil dibuka tanggal ''%s'' ', [FormatDateTime('dd/mm/yyyy', dtTglKliring.Date)]), mtInformation, [mbOK], 0);
  end
  else begin
    GlobalVarDM.DoWriteLogDaily(UserName, MDL_SE, Format('EOD Tanggal %s', [FormatDateTime('dd/mm/yyyy', GlobalVarForm.SystemToday)]));
  	//Pindahkan data ke history
    strConn := GlobalVarDM.DailyADOConn.ConnectionString;
		MoveDataToHistory;
    if GlobalVarForm.DBType = 1 then
    begin
    	meLog.Lines.Add('Compact database...');
  		GlobalVarForm.DeInitDB;
    	compactDB(strConn);
    	GlobalVarForm.InitDB;
    end;
		meLog.Lines.Add('Done.');
  	MessageDlg('System berhasil ditutup', mtInformation, [mbOK], 0);
  end;

  ModalResult := mrOK;
end;

procedure TfrmSOD.btnGeneralSaveClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmSOD.FormCreate(Sender: TObject);
begin
	if qryTemp.Active then
  	qryTemp.Close;
  qryTemp.Connection := GlobalVarDM.DailyADOConn;

  Self.Height := 145;
end;

procedure TfrmSOD.MoveDataToHistory;
begin
  try
    Self.Height := 290;
    Application.ProcessMessages;

    with qryTemp do
    begin
      meLog.AddLine('Mulai.');
      meLog.AddLine('Membackup data ke history...');
      //Copy detil ke history
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + DB_TABLE_HISTORYDEBIT);
      SQL.Add('SELECT * FROM ' + DB_TABLE_OUTDOCUMENTS);
      ExecSQL;

      if Active then
        Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + DB_TABLE_HISTORYCREDIT);
      SQL.Add('SELECT * FROM ' + DB_TABLE_OUTCREDITNOTES);
      ExecSQL;

      if Active then
        Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + DB_TABLE_HISTORY_INCREDITNOTES);
      SQL.Add('SELECT * FROM ' + DB_TABLE_INCREDITNOTES);
      ExecSQL;

      //copy error detil ke history
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + DB_TABLE_OUTDOCUMENTS_ERROR_HISTORY);
      SQL.Add('SELECT * FROM ' + DB_TABLE_OUTDOCUMENTS_ERROR);
      ExecSQL;

      if Active then
        Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + DB_TABLE_OUTDOCUMENTS_CR_ERROR_HISTORY);
      SQL.Add('SELECT * FROM ' + DB_TABLE_OUTDOCUMENTS_CR_ERROR);
      ExecSQL;

      //Copy Master k history
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + DB_TABLE_OUTBATCH_HISTORY);
      SQL.Add('SELECT * FROM ' + DB_TABLE_OUTBATCH);
      ExecSQL;

      //Copy error master ke history
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + DB_TABLE_OUTBATCH_ERROR_HISTORY);
      SQL.Add('SELECT * FROM ' + DB_TABLE_OUTBATCH_ERROR);
      ExecSQL;


      meLog.AddLine('Mengosongkan tabel...');
      //Kosongkan table detail
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('Truncate table ' + DB_TABLE_OUTDOCUMENTS);
      ExecSQL;

      if Active then
        Close;
      SQL.Clear;
      SQL.Add('Truncate table ' + DB_TABLE_OUTCREDITNOTES);
      ExecSQL;

      if Active then
        Close;
      SQL.Clear;
      SQL.Add('Truncate table ' + DB_TABLE_INCREDITNOTES);
      ExecSQL;

      //Kosongkan table error detail
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('Truncate table ' + DB_TABLE_OUTDOCUMENTS_ERROR);
      ExecSQL;

      if Active then
        Close;
      SQL.Clear;
      SQL.Add('Truncate table ' + DB_TABLE_OUTDOCUMENTS_CR_ERROR);
      ExecSQL;

      //Kosongkan table master
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('Truncate table ' + DB_TABLE_OUTBATCH);
      ExecSQL;

      //Kosongkan table error master
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('Truncate table ' + DB_TABLE_OUTBATCH_ERROR);
      ExecSQL;

      //Kosongkan table history download
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('Truncate table ' + DB_TABLE_HISTORYDEBIT_DOWNLOAD);
      ExecSQL;

      if Active then
        Close;
      SQL.Clear;
      SQL.Add('Truncate table ' + DB_TABLE_HISTORYCREDIT_DOWNLOAD);
      ExecSQL;

      meLog.AddLine('Selesai.');
      (*
      if Active then
        Close;
      SQL.Add('ALTER TABLE ' + DB_TABLE_HISTORYDEBIT_DOWNLOAD + ' ALTER COLUMN dh_id AutoIncrement(1,1));
      ExecSQL;
      *)
    end;
  finally
    Self.Height := 145;
    Application.ProcessMessages;
  end;
end;

end.
