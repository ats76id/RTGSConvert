unit fclrhist;

interface

uses
  SysUtils, Forms, ComObj, ActiveX, ADODb, Variants;

function CallClearHistory(ApplicationHandle:THandle; strParam:PChar):integer; export;

function SaveLog(s:string):integer;

var
  ProfileRegistryKey    : string;
  OldApplicationHandle  : THandle;
  UsernameString: string;
  UsergroupString: string;

  boMessage : boolean;
  boDeleteAllHistory: Boolean;
  theLog : OleVariant;

implementation

uses
  Controls, Dialogs, futils, IniFiles, HCMngr, DB, DBTables, FileCtrl,
  fConfirmDelete, fGlobalVar, fGlobalVarDM;

function SaveLog(s:string):integer;
begin
  if not(VarIsEmpty(theLog) or VarIsNull(theLog)) then begin
    theLog.Write(UsernameString,s);
  end;
end;

function CallClearHistory(ApplicationHandle:THandle; strParam:PChar):integer;
var
  myQuery:TADOQuery;
  dtToday:TDateTime;
  boProcess:Boolean;
begin
  Result := -1;
  OldApplicationHandle:=Application.Handle;
  Application.Handle:=ApplicationHandle;
  try
    ProfileRegistryKey:=GetItem(StrPas(strParam),';',0);
    UsernameString:=GetItem(StrPas(strParam),';',1);
    UsergroupString:=GetItem(StrPas(strParam),';',2);
    try
      Application.CreateForm(TGlobalVarForm,GlobalVarForm);
      Application.CreateForm(TGlobalVarDM,GlobalVarDM);

      GlobalVarForm.ProfileRegistryKey:=ProfileRegistryKey;
      GlobalVarForm.InitConfig;
      InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Result:=-1;
      CoInitialize(nil);
      theLog := CreateOleObject('log32.TLogFile');
      Application.CreateForm(TfmConfirmDelete,fmConfirmDelete);
      try
        ForceDirectories(GlobalVarForm.LogPath+'Log');
        theLog.Filename:=GlobalVarForm.LogPath+'Log\SSKE'+FormatDateTime('YYYYMMDD',Now)+'.log';
        boMessage:=GetItem(StrPas(strParam),';',3)='1';
        boDeleteAllHistory:=GetItem(StrPas(strParam),';',4)='1';;
        myQuery:=TADOQuery.Create(Application);
        try
          myQuery.Connection:=GlobalVarDM.DailyADOConn;
          if boMessage then
          begin
            if MessageDlg('Hapus data history import?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
            begin
              Result:=0;
              exit;
            end;

            myQuery.SQL.Clear;
            myQuery.SQL.Add('SELECT TOP 1 * FROM system');
            myQuery.Open;
            dtToday:=myQuery.FieldByName('sys_today').AsDateTime;
            myQuery.Close;

            fmConfirmDelete.lblDate.Caption:=FormatDateTime('DD/MM/YYYY',dtToday);
            fmConfirmDelete.edDate.Text:='';

            if fmConfirmDelete.ShowModal=mrOK then
            begin
              myQuery.Close;
              myQuery.SQL.Clear;
              myQuery.SQL.Add('SELECT * FROM historycredit WHERE hc_date=(SELECT sys_today FROM system)');
              myQuery.Open;

              if myQuery.RecordCount<>0 then
              begin
                if MessageDlg('Sudah ada transaksi per tanggal '''+FormatDateTime('DD/MM/YYYY',dtToday)+''', transaksi selain tanggal tersebut akan dihapus, lanjutkan proses?',
                  mtConfirmation,[mbYes,mbNo],0)=mrNo then
                begin
                  myQuery.Close;
                  Result:=0;
                  Exit;
                end;
              end;
              boProcess:=True;
            end
            else
            begin
              myQuery.Close;
              Result:=0;
              Exit;
            end;
          end
          else
          begin
            boProcess:=True;
          end;
          if boProcess then
          begin
            myQuery.Close;
            myQuery.SQL.Clear;
            if boDeleteAllHistory then
            begin
              myQuery.SQL.Add('DELETE FROM historycredit');
              myQuery.ExecSQL;
              SaveLog('DELETE HISTORY : Seluruh history.');
            end
            else
            begin
              myQuery.SQL.Add('DELETE FROM historycredit WHERE hc_date<(SELECT sys_today FROM system)');
              myQuery.ExecSQL;
              SaveLog('DELETE HISTORY : Sebelum tanggal '+FormatDateTime('DD/MM/YYYY',dtToday));
            end;
            Result:=0;
          end;
        finally
          myQuery.Close;
          myQuery.Free;
        end;
      finally
        try
          theLog.Close;
          theLog:=Unassigned;
        except
        end;
        fmConfirmDelete.Free;
      end;
      {---Customized functions---}
    finally
      DeInitLog;
      if GlobalVarDM <> nil then
        GlobalVarDM.Free;
      if GlobalVarForm <> nil then
        GlobalVarForm.Free;
    end;
  finally
    Application.Handle:=OldApplicationHandle;
  end;
end;

end.
