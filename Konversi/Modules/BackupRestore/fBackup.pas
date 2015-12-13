unit fBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvOfficeButtons, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomGroupBox,
  LMDGroupBox, ExtCtrls, AdvPanel,
  AbZipper, AbBase,
  AbBrowse, AbZBrows, StdCtrls, Buttons, ADODB;

type
  TfrmBackup = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    LMDGroupBox1: TLMDGroupBox;
    cbDBUser: TAdvOfficeCheckBox;
    cbDBTrx: TAdvOfficeCheckBox;
    Zipper: TAbZipper;
    memLogBackup: TMemo;
    btnBackup: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnBackupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FstrZipFileUserBackup,
    FstrZipFileTrxBackup,
    FstrDBUserFileName,
    FstrDBTrxFileName: string;
    FDBType:Integer;
    FToday:TDateTime;
    function BackupSQLDB(strBackupFolder, strShareBackup, strZipFileName, strConString:string): Boolean;
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

uses fGlobalVar, fGlobalVarDM, futils;

{$R *.dfm}


procedure TfrmBackup.btnBackupClick(Sender: TObject);
var
	boContinueUser,
  boContinueTrx:Boolean;
  strConnUser, strConnTrx:string;
  strDBUser,
  strDBTrx:string;
  strBackupFolder,
  strShareBackup : string;
begin
	try
    FDBType := GlobalVarForm.DBType;

    boContinueUser := cbDBUser.Checked;
    boContinueTrx := cbDBTrx.Checked;

    if (boContinueUser=False) and (boContinueTrx=False) then
    begin
      Application.MessageBox('Pilih database yang akan dibackup.', PChar(Self.Caption), MB_OK +
        MB_ICONWARNING);

      Exit;
    end;

    if FDBType = 1 then
    begin
    	FstrZipFileUserBackup := IncludeTrailingPathDelimiter(GlobalVarForm.DBBackupFolder) + Format('BackupUser-%s.ZIP', [FormatDateTime('YYYYMMDD', GlobalVarForm.SystemToday)]);
    	FstrZipFileTrxBackup := IncludeTrailingPathDelimiter(GlobalVarForm.DBBackupFolder) + Format('BackupTrx-%s.ZIP', [FormatDateTime('YYYYMMDD', GlobalVarForm.SystemToday)]);
    end
    else begin
    	FstrZipFileUserBackup := IncludeTrailingPathDelimiter(GlobalVarForm.DBSharedBackupFolder) + Format('BackupUser-%s.ZIP', [FormatDateTime('YYYYMMDD', GlobalVarForm.SystemToday)]);
    	FstrZipFileTrxBackup := IncludeTrailingPathDelimiter(GlobalVarForm.DBSharedBackupFolder) + Format('BackupTrx-%s.ZIP', [FormatDateTime('YYYYMMDD', GlobalVarForm.SystemToday)]);
    end;

    strConnUser := GlobalVarDM.MainADOConn.ConnectionString;
    strConnTrx  := GlobalVarDM.DailyADOConn.ConnectionString;
    strBackupFolder := GlobalVarForm.DBBackupFolder;
    strShareBackup  := GlobalVarForm.DBSharedBackupFolder;

    GlobalVarForm.DeInitDB;

    if (boContinueUser) and (FileExists(FstrZipFileUserBackup)) then
    begin
      if (MessageDlg('Database user sudah pernah dibackup. Apakah akan dibackup ulang ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        boContinueUser := False;
    end;

    if (boContinueTrx) and (FileExists(FstrZipFileTrxBackup)) then
    begin
      if (MessageDlg('Database transaksi sudah pernah dibackup. Apakah akan dibackup ulang ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        boContinueTrx := False;
    end;

    if boContinueUser then
    begin
    	memLogBackup.Lines.Add('');
      memLogBackup.Lines.Add('Backup database user...');
      if FDBType = 1 then
      begin
        FstrDBUserFileName := ExpandFile(GetNextString(strConnUser,'Data Source=',';'));
        if FileExists(ChangeFileExt(FstrDBUserFileName,'.ldb')) then
        begin
          memLogBackup.Lines.Add('Database User sedang digunakan. Backup dibatalkan...');
        end
        else begin
          try
            if FileExists(FstrZipFileUserBackup) then
          		DeleteFile(FstrZipFileUserBackup);

            Zipper.OpenArchive(FstrZipFileUserBackup);
            memLogBackup.Lines.Add('Compact databse user...');
            compactDB(strConnUser);
            Zipper.AddFiles(FstrDBUserFileName, 1);
            Zipper.Save;
          finally
            Zipper.CloseArchive;
          end;
        end;
      end
      else begin
        if BackupSQLDB(strBackupFolder, strShareBackup,
                    ExtractFileName(FstrZipFileUserBackup),
                    strConnUser) then
    			memLogBackup.Lines.Add('Backup database user sukses.');
      	(*
        try
          try
            Qcompact:= TADOQuery.Create(nil);
            QCompact.CommandTimeout := 180;
            QCompact.ConnectionString := strConnUser;
            strDBUser := GetNextString(strConnUser,'Initial Catalog=',';');
            FstrDBUserFileName := IncludeTrailingPathDelimiter(strBackupFolder) + strDBUser + '.dat';

            DeleteFile(IncludeTrailingPathDelimiter(strShareBackup) + strDBUser + '.dat');

            if Qcompact.Active then
              QCompact.Close;
            QCompact.SQL.Text := 'use master BACKUP database '+
                                 strDBUser +
                                 ' to DISK = ' +
                                 QuotedStr(FstrDBUserFileName);
            QCompact.ExecSQL;

            if FileExists(FstrZipFileUserBackup) then
              DeleteFile(FstrZipFileUserBackup);
            Zipper.OpenArchive(FstrZipFileUserBackup);
            Zipper.AddFiles(ExtractFilePath(FstrZipFileUserBackup) + strDBUser + '.dat', 1);
            Zipper.Save;

            DeleteFile(IncludeTrailingPathDelimiter(strShareBackup) + strDBUser + '.dat');
            memLogBackup.Lines.Add('Backup database user sukses.');
          finally
            Zipper.CloseArchive;
          	QCompact.Free;
          end;
        except
          On E:Exception do
          begin
            QCompact.Free;
            MessageDlg('Error Backup: ' + E.Message,  mtError, [mbOK], 0);
          end;
        end;
        *)
      end;

    end;

    if boContinueTrx then
    begin
    	memLogBackup.Lines.Add('');
      memLogBackup.Lines.Add('Backup database transaksi...');
      if FDBType = 1 then
      begin
        FstrDBUserFileName := ExpandFile(GetNextString(strConnTrx,'Data Source=',';'));
        if FileExists(ChangeFileExt(FstrDBUserFileName,'.ldb')) then
        begin
          memLogBackup.Lines.Add('Database transaksi sedang digunakan. Backup dibatalkan...');
        end
        else begin
          try
            Zipper.OpenArchive(FstrZipFileTrxBackup);
            memLogBackup.Lines.Add('Compact databse transaksi...');
            compactDB(strConnTrx);
            Zipper.AddFiles(FstrDBUserFileName, 1);
            Zipper.Save;
          finally
            Zipper.CloseArchive;
          end;
        end;
      end
      else begin
        if BackupSQLDB(strBackupFolder, strShareBackup,
                    ExtractFileName(FstrZipFileTrxBackup),
                    strConnTrx) then
      		memLogBackup.Lines.Add('Backup database transaksi sukses.');
      end;
    end;

  finally
  	GlobalVarForm.InitDB;
  end;
end;

procedure TfrmBackup.FormShow(Sender: TObject);
begin
	memLogBackup.Clear;
  cbDBUser.SetFocus;
  FToday := GlobalVarForm.SystemToday;
end;

function TfrmBackup.BackupSQLDB(strBackupFolder, strShareBackup, strZipFileName, strConString:string):Boolean;
var
	Qcompact:TADOQuery;
  strDBUser:string;
  strZipFile:string;
  strDBUserFileName:String;
begin
  Result := False;
  try
    try
      Qcompact:= TADOQuery.Create(nil);
      QCompact.CommandTimeout := 180;
      QCompact.ConnectionString := strConString;
      strDBUser := GetNextString(strConString,'Initial Catalog=',';');
      strDBUserFileName := IncludeTrailingPathDelimiter(strBackupFolder) + strDBUser + '.dat';
      strZipFile := IncludeTrailingPathDelimiter(strShareBackup) + ExtractFileName(strZipFileName);

      DeleteFile(IncludeTrailingPathDelimiter(strShareBackup) + strDBUser + '.dat');

      if Qcompact.Active then
        QCompact.Close;
      QCompact.SQL.Text := 'use master BACKUP database '+
                           strDBUser +
                           ' to DISK = ' +
                           QuotedStr(strDBUserFileName);
      QCompact.ExecSQL;

      if FileExists(strZipFile) then
        DeleteFile(strZipFile);
      Zipper.OpenArchive(strZipFile);
      Zipper.AddFiles(IncludeTrailingPathDelimiter(strShareBackup) + strDBUser + '.dat', 1);
      Zipper.Save;

      DeleteFile(IncludeTrailingPathDelimiter(strShareBackup) + strDBUser + '.dat');

			Result := True;
    finally
      Zipper.CloseArchive;
      QCompact.Free;
    end;
  except
    On E:Exception do
    begin
      MessageDlg('Error Backup DB: ' + E.Message,  mtError, [mbOK], 0);
    	memLogBackup.Lines.Add('Error Backup DB: ' + E.Message);
    end;
  end;

end;

end.
