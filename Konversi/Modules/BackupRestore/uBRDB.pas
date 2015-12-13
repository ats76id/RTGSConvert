unit uBRDB;


interface


uses
  SysUtils, Forms, Dialogs, Controls;


function CallBackupDB(ApplicationHandle:THandle; Param:PChar):Integer; export; stdcall;
function CallRestoreDB(ApplicationHandle:THandle; Param:PChar):Integer; export;stdcall;
var
  ProfileRegistryKey    : string;
  OldApplicationHandle  : THandle;
  UserName, GroupName : string;


implementation

uses fGlobalVar, fGlobalVarDM, futils, fUserLib, fBackup, fRestore;



function CallBackupDB(ApplicationHandle:THandle; Param:PChar):Integer;
begin
  Result := -1;
  OldApplicationHandle:=Application.Handle;
  Application.Handle:=ApplicationHandle;
  try
    ShortDateFormat := SDF_ENGLISH_US;
    DateSeparator   := '/';

    ProfileRegistryKey:=GetItem(StrPas(Param),';',0);
    UserName := GetItem(StrPas(Param),';',1);
    GroupName := GetItem(StrPas(Param),';',2);
    try
    	Application.CreateForm(TGlobalVarForm,GlobalVarForm);
      Application.CreateForm(TGlobalVarDM,GlobalVarDM);

      GlobalVarForm.ProfileRegistryKey:=ProfileRegistryKey;
      GlobalVarForm.InitConfig;
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      Application.CreateForm(TfrmBackup, frmBackup);
      try
        frmBackup.ShowModal;
        Result := 0;
      finally
      	FreeAndNil(frmBackup);
        FreeAndNil(frmUserLib);
      end;

      {---Customized functions---}
    finally
      //DeInitLog;
      if GlobalVarDM <> nil then
        GlobalVarDM.Free;
      if GlobalVarForm <> nil then
        GlobalVarForm.Free;
    end;
  finally
    Application.Handle:=OldApplicationHandle;
  end;
end;

function CallRestoreDB(ApplicationHandle:THandle; Param:PChar):Integer;
begin
  Result := -1;
  OldApplicationHandle:=Application.Handle;
  Application.Handle:=ApplicationHandle;
  try
    ShortDateFormat := SDF_ENGLISH_US;
    DateSeparator   := '/';

    ProfileRegistryKey:=GetItem(StrPas(Param),';',0);
    UserName := GetItem(StrPas(Param),';',1);
    GroupName := GetItem(StrPas(Param),';',2);
    try
      Application.CreateForm(TGlobalVarForm,GlobalVarForm);
      Application.CreateForm(TGlobalVarDM,GlobalVarDM);

      GlobalVarForm.ProfileRegistryKey:=ProfileRegistryKey;
      GlobalVarForm.InitConfig;
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      Application.CreateForm(TfrmRestore, frmRestore);
      try
        frmRestore.ShowModal;
        Result := 0;
      finally
      	FreeAndNil(frmRestore);
        FreeAndNil(frmUserLib);
      end;

      {---Customized functions---}
    finally
      //DeInitLog;
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
