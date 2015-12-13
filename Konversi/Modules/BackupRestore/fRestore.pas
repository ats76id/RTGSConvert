unit fRestore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvOfficeButtons, AbBase, AbBrowse, AbZBrows,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox, 
  ExtCtrls, AdvPanel, AbUnzper, Buttons, DB, ADODB;

type
  TfrmRestore = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    LMDGroupBox1: TLMDGroupBox;
    memLogBackup: TMemo;
    cbDBUser: TAdvOfficeCheckBox;
    cbDBTrx: TAdvOfficeCheckBox;
    comboDBUser: TComboBox;
    comboDBTrx: TComboBox;
    AbUnZipper1: TAbUnZipper;
    btnRestore: TBitBtn;
    btnCancel: TBitBtn;
    RestoreQuery: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btnRestoreClick(Sender: TObject);
  private
    FDBType:Integer;
    procedure FillBackupFromDisk;
    function RestoreSLQDB(strZipFile, strBackupFolder, strShareBackup, strConn:string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRestore: TfrmRestore;

implementation

uses fGlobalVar, fGlobalVarDM, futils;

{$R *.dfm}

function FileToStr(FileName : string):string;
var
  f : file;   // untyped file
  s : string; // string for reading a file
begin
  AssignFile(f, FileName);
  FileMode := fmOpenRead;
  reset(f, 1);
  SetLength(s, FileSize(f));
  BlockRead(f, s[1], length(s));
  CloseFile(f);
  result := s;
end;

procedure TfrmRestore.FillBackupFromDisk;
var
  FileSearch  : TSearchRec;
  strFileCrit   : String;
  i,intExist    : Integer;
begin
	comboDBUser.Clear;
	strFileCrit := Format('BackupUser-%s.ZIP',['*']);

  if FDBType = 1 then
  	intExist := FindFirst(IncludeTrailingPathDelimiter(GlobalVarForm.DBBackupFolder) + strFileCrit, faAnyFile, FileSearch)
  else
		intExist := FindFirst(IncludeTrailingPathDelimiter(GlobalVarForm.DBSharedBackupFolder) + strFileCrit, faAnyFile, FileSearch);

  While intExist=0 do
  begin
    comboDBUser.AddItem(FileSearch.Name, TObject(0));
    intExist:=FindNext(FileSearch);
  end;

  if comboDBUser.Items.Count > 0 then
  	comboDBUser.ItemIndex := comboDBUser.Items.Count - 1;


	comboDBTrx.Clear;
	strFileCrit := Format('BackupTrx-%s.ZIP',['*']);

  if FDBType = 1 then
		intExist := FindFirst(IncludeTrailingPathDelimiter(GlobalVarForm.DBBackupFolder) + strFileCrit, faAnyFile, FileSearch)
  else
  	intExist := FindFirst(IncludeTrailingPathDelimiter(GlobalVarForm.DBSharedBackupFolder) + strFileCrit, faAnyFile, FileSearch);

  While intExist=0 do
  begin
    comboDBTrx.AddItem(FileSearch.Name, TObject(0));
    intExist:=FindNext(FileSearch);
  end;

  if comboDBTrx.Items.Count > 0 then
  	comboDBTrx.ItemIndex := comboDBTrx.Items.Count - 1;
end;

procedure TfrmRestore.FormShow(Sender: TObject);
begin
  FDBType := GlobalVarForm.DBType;
	FillBackupFromDisk;
end;

procedure TfrmRestore.btnRestoreClick(Sender: TObject);
var
	strConnUser,
  strConnTrx,
  strBackupUserName,
  strBackupTrxName : string;
  strUserFileRestore,
  strTrxFileRestore:string;
  strBackupFolder :string;
  strShareBackup:string;
  intDBType:Integer;
  i:Integer;
begin
	try
    intDBType := GlobalVarForm.DBType;
    strConnUser := GlobalVarDM.MainADOConn.ConnectionString;
    strConnTrx := GlobalVarDM.DailyADOConn.ConnectionString;
    strUserFileRestore := ExpandFile(GetNextString(strConnUser,'Data Source=',';'));
    strTrxFileRestore := ExpandFile(GetNextString(strConnTrx,'Data Source=',';'));

    strBackupFolder := IncludeTrailingPathDelimiter(GlobalVarForm.DBBackupFolder);
    strShareBackup := IncludeTrailingPathDelimiter(GlobalVarForm.DBSharedBackupFolder);

    try
      GlobalVarForm.DeInitDB;

      if cbDBUser.Checked then
      begin
        memLogBackup.Lines.Add('Restore database user....');
        if comboDBUser.ItemIndex < 0 then
        begin
          memLogBackup.Lines.Add('Backup tidak terpilih. proses dibatalkan....');
        end
        else begin
          if FDBType = 1 then
          	strBackupUserName := strBackupFolder + comboDBUser.Text
          else
          	strBackupUserName := strShareBackup + comboDBUser.Text;

          if FileExists(strBackupUserName) then
          begin
            memLogBackup.Lines.Add('Merestore file ' + comboDBUser.Text + '....');
            if FDBType = 1 then
            begin
              if FileExists(ChangeFileExt(strUserFileRestore,'.ldb')) then
              begin
                memLogBackup.Lines.Add('Database User sedang digunakan. Restore dibatalkan...');
              end
              else begin
                AbUnZipper1.FileName := strBackupUserName;
                AbUnZipper1.BaseDirectory := ExtractFilePath(strBackupUserName);
                AbUnzipper1.ExtractFiles('*.*');
                AbUnzipper1.CloseArchive;

                DeleteFile(strUserFileRestore);
                CopyFile(PChar(ExtractFilePath(strBackupUserName) + ExtractFileName(strUserFileRestore)), PChar(strUserFileRestore), False);
                DeleteFile(ExtractFilePath(strBackupUserName) + ExtractFileName(strUserFileRestore));
              end;
            end
            else begin
              RestoreSLQDB(strBackupUserName, strBackupFolder, strShareBackup, strConnUser);
              (*
              AbUnZipper1.FileName := strBackupUserName;
              AbUnZipper1.BaseDirectory := ExtractFilePath(strBackupUserName);
              AbUnzipper1.ExtractFiles('*.*');
              AbUnzipper1.CloseArchive;

              RestoreQuery.ConnectionString := StringReplace(strConnUser, strUserFileRestore, 'MASTER', [rfIgnoreCase]);
              RestoreQuery.CommandTimeout := 600;
              RestoreQuery.SQL.text := 'EXEC sp_who';
              RestoreQuery.Open;
              i := 0;
              while not RestoreQuery.Eof do
              begin
                if (lowerCase(RestoreQuery.FindField('dbname').AsString) = lowercase(strUserFileRestore)) then begin
                  inc(i);
                  if i>1 then
                    raise Exception.Create('DB '+ strUserFileRestore +' sedang digunakan');
                end;
                RestoreQuery.Next;
              end;

              if (not FileExists(strShareBackup + strUserFileRestore + '.dat')) or
                 (FileToStr(strShareBackup + strUserFileRestore + '.dat')='') then begin
                sleep(100);
              end;
              RestoreQuery.Close;
              RestoreQuery.SQL.Text := 'exec usp_killprocess ' + QuotedStr(strUserFileRestore);
              RestoreQuery.ExecSQL;

              RestoreQuery.SQL.Text := 'USE MASTER RESTORE database '+ strUserFileRestore +' FROM DISK = ' + QuotedStr(strShareBackup + strUserFileRestore + '.dat') + ' WiTH REPLACE';
              // Untuk menghindari kesalahan No Result Set pada saat script diatas dijalankan yg sebenarnya bukan kesalahan script diatas
              // (karena sebenarnya query yang dilakukan dengan perintah Open memerlukan result),
              // Maka ditambahkan script agar ada result sebagai balikan
              RestoreQuery.SQL.Text := RestoreQuery.SQL.Text + ' SELECT ''Restore'' ';
              {*}
              try
                RestoreQuery.Open;
              except on e:exception do
                {* Remark By Ats, 2012-02-06
                if Pos('result set', LowerCase(e.Message)) = 0 then
                *}
                  Raise Exception.Create(E.Message);
              end;
              DeleteFile(strShareBackup + strUserFileRestore + '.dat');
              *)
            end;
          	memLogBackup.Lines.Add('Restore database User berhasil.');
          end
          else
            memLogBackup.Lines.Add('File backup user tidak ditemukan. Proses dibatalkan...');
        end;
      end;

      if cbDBTrx.Checked then
      begin
        memLogBackup.Lines.Add('Restore database transaksi....');
        if comboDBTrx.ItemIndex < 0 then
        begin
          memLogBackup.Lines.Add('Backup tidak terpilih. proses dibatalkan....');
        end
        else begin
          if FDBType = 1 then
          	strBackupTrxName := strBackupFolder + comboDBTrx.Text
          else
          	strBackupTrxName := strShareBackup + comboDBTrx.Text;

          if FileExists(strBackupTrxName) then
          begin
            memLogBackup.Lines.Add('Merestore file ' + comboDBTrx.Text + '....');
            if FDBType = 1 then
            begin
              if FileExists(ChangeFileExt(strTrxFileRestore,'.ldb')) then
              begin
                memLogBackup.Lines.Add('Database transaksi sedang digunakan. Restore dibatalkan...');
              end
              else begin
                AbUnZipper1.FileName := strBackupTrxName;
                AbUnZipper1.BaseDirectory := ExtractFilePath(strBackupTrxName);
                AbUnzipper1.ExtractFiles('*.*');
                AbUnzipper1.CloseArchive;

                DeleteFile(strTrxFileRestore);
                CopyFile(PChar(ExtractFilePath(strBackupTrxName) + ExtractFileName(strTrxFileRestore)), PChar(strTrxFileRestore), False);
                DeleteFile(ExtractFilePath(strBackupTrxName) + ExtractFileName(strTrxFileRestore));
              end;
            end
            else begin
            	RestoreSLQDB(strBackupTrxName, strBackupFolder, strShareBackup, strConnTrx);
            end;
            memLogBackup.Lines.Add('Restore database transaksi berhasil.');
          end
          else
            memLogBackup.Lines.Add('File backup transaksi tidak ditemukan. Proses dibatalkan...');
        end;
      end;

      MessageDlg('Restore Selesai.'#13#10'Aplikasi akan ditutup otomatis'#13#10'Silahkan jalankan ulang aplikasi', mtInformation, [mbOK], 0);
      ModalResult := mrOk;
    finally
      GlobalVarForm.InitDB;
    end;
  except
		On E:Exception do
    begin
    	MessageDlg('Erro Restore : ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

function TfrmRestore.RestoreSLQDB(strZipFile, strBackupFolder, strShareBackup, strConn:string):Boolean;
var
  strDBName:string;
  i:Integer;
begin
  Result := False;
	try
    strDBName := GetNextString(strConn,'Initial Catalog=',';');
    DeleteFile(strShareBackup + strDBName + '.dat');

    AbUnZipper1.FileName := strZipFile;
    AbUnZipper1.BaseDirectory := ExtractFilePath(strZipFile);
    AbUnzipper1.ExtractFiles('*.*');
    AbUnzipper1.CloseArchive;


    RestoreQuery.ConnectionString := StringReplace(strConn, strDBName, 'MASTER', [rfIgnoreCase]);
    RestoreQuery.CommandTimeout := 600;
    RestoreQuery.SQL.text := 'EXEC sp_who';
    RestoreQuery.Open;
    i := 0;
    while not RestoreQuery.Eof do
    begin
      if (lowerCase(RestoreQuery.FindField('dbname').AsString) = lowercase(strDBName)) then begin
        inc(i);
        if i>1 then
        begin
          MessageDlg('DB '+ strDBName +' sedang digunakan',  mtError, [mbOK], 0);
          Exit;
        end;
      end;
      RestoreQuery.Next;
    end;

    if (not FileExists(strShareBackup + strDBName + '.dat')) or
       (FileToStr(strShareBackup + strDBName + '.dat')='') then begin
      sleep(100);
    end;

    RestoreQuery.Close;
    RestoreQuery.SQL.Text := 'exec usp_killprocess ' + QuotedStr(strDBName);
    RestoreQuery.ExecSQL;

    RestoreQuery.SQL.Text := 'USE MASTER RESTORE database '+ strDBName +' FROM DISK = ' + QuotedStr(strBackupFolder + strDBName + '.dat') + ' WiTH REPLACE';
    // Untuk menghindari kesalahan No Result Set pada saat script diatas dijalankan yg sebenarnya bukan kesalahan script diatas
    // (karena sebenarnya query yang dilakukan dengan perintah Open memerlukan result),
    // Maka ditambahkan script agar ada result sebagai balikan
    RestoreQuery.SQL.Text := RestoreQuery.SQL.Text + ' SELECT ''Restore'' ';
    {*}
    try
      RestoreQuery.Open;
    except on e:exception do
      {* Remark By Ats, 2012-02-06
      if Pos('result set', LowerCase(e.Message)) = 0 then
      *}
        Raise Exception.Create(E.Message);
    end;
    DeleteFile(strShareBackup + strDBName + '.dat');
    Result := True;
  Except
    On E:Exception do
    begin
			MessageDlg('Error Restore DB: ' + E.Message,  mtError, [mbOK], 0);
    end;
  end;
end;

end.
