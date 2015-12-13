unit uSetting;


interface


uses
  SysUtils, Forms, Dialogs, Controls, dxCore;


function CallSysParam(ApplicationHandle:THandle; Param:PChar):Integer; export; stdcall;
function CallRegionParam(ApplicationHandle:THandle; Param:PChar):Integer; export;stdcall;
function CallBranchParam(ApplicationHandle:THandle; Param:PChar):Integer; export;stdcall;
function CallSubBranchParam(ApplicationHandle:THandle; Param:PChar):Integer; export;stdcall;
function CallImportDBTPK(ApplicationHandle:THandle; Param:PChar):Integer; export;stdcall;
function CallSOD(ApplicationHandle:THandle; Param:PChar):Integer; export;stdcall;

var
  ProfileRegistryKey    : string;
  OldApplicationHandle  : THandle;
  UserName, GroupName : string;
  FParam:String;


implementation

uses fGlobalVar, fGlobalVarDM, futils, fUserLib, fKonfigurasi, fIRegionAdd,
  fIRegionMain, fIBranchAdd, fIBranchMain, fISubBranchAdd, fISubBranchMain,
  fImportTbTPK, fSOD;



function CallSysParam(ApplicationHandle:THandle; Param:PChar):Integer;
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
      Application.CreateForm(TfrmKonfigurasi, frmKonfigurasi);
      try
        frmKonfigurasi.ShowModal;
        Result := 0;
      finally
      	FreeAndNil(frmKonfigurasi);
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

function CallRegionParam(ApplicationHandle:THandle; Param:PChar):Integer; export;
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
      Application.CreateForm(TfrmRegionMain, frmRegionMain);
      Application.CreateForm(TfrmRegionAdd, frmRegionAdd);
      try
        frmRegionMain.ShowModal;
        Result := 0;
      finally
      	FreeAndNil(frmRegionAdd);
        FreeAndNil(frmRegionMain);
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

function CallBranchParam(ApplicationHandle:THandle; Param:PChar):Integer; export;
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
      Application.CreateForm(TfrmiBranchMain, frmiBranchMain);
      Application.CreateForm(TfrmiBranchAdd, frmiBranchAdd);
      try
        frmiBranchMain.ShowModal;
        Result := 0;
      finally
      	FreeAndNil(frmiBranchAdd);
        FreeAndNil(frmiBranchMain);
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

function CallSubBranchParam(ApplicationHandle:THandle; Param:PChar):Integer; export;
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
      Application.CreateForm(TfrmISubBranchMain, frmISubBranchMain);
      Application.CreateForm(TfrmISubBranchAdd, frmISubBranchAdd);
      try
        frmISubBranchMain.ShowModal;
        Result := 0;
      finally
      	FreeAndNil(frmISubBranchAdd);
        FreeAndNil(frmISubBranchMain);
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

function CallImportDBTPK(ApplicationHandle:THandle; Param:PChar):Integer; export;
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
      //GlobalVarForm.InitDBTPK;
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      Application.CreateForm(TfrmImportDBTPK, frmImportDBTPK);
      try
        if frmImportDBTPK.IsDataExist then
        	frmImportDBTPK.ShowModal;
        Result := 0;
      finally
      	FreeAndNil(frmImportDBTPK);
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

function CallSOD(ApplicationHandle:THandle; Param:PChar):Integer;
begin
  Result := -1;
  OldApplicationHandle:=Application.Handle;
  Application.Handle:=ApplicationHandle;
  try
    ShortDateFormat := SDF_ENGLISH_US;
    DateSeparator   := '/';

    //FParam := Param;
    ProfileRegistryKey:=GetItem(StrPas(Param),';',0);
    UserName := GetItem(StrPas(Param),';',1);
    GroupName := GetItem(StrPas(Param),';',2);
    FParam := ProfileRegistryKey + ';' + UserName + ';' + GroupName;
    try
      Application.CreateForm(TGlobalVarForm,GlobalVarForm);
      Application.CreateForm(TGlobalVarDM,GlobalVarDM);

      GlobalVarForm.ProfileRegistryKey:=ProfileRegistryKey;
      GlobalVarForm.InitConfig;
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      Application.CreateForm(TfrmSOD, frmSOD);
      try
        frmSOD.ShowModal;
        Result := 0;
      finally
      	//StrDispose(FParam);
        FreeAndNil(frmUserLib);
      	FreeAndNil(frmSOD);
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

initialization
  dxInitialize;

finalization
	dxFinalize;

end.
