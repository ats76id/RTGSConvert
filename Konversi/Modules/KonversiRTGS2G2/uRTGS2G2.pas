unit uRTGS2G2;

interface

uses
  Sysutils, Forms;

function CallConvRTGS2G2(ApplicationHandle: THandle; Param:PChar):Integer; export;
function CallConvParam(ApplicationHandle: THandle; Param:PChar):Integer; export;

function CallRptPerProsesFile(ApplicationHandle: THandle; Param:PChar):Integer; export;
function CallRptKonversiSKN(ApplicationHandle: THandle; Param:PChar):Integer; export;
function CallRptKonversiREMM(ApplicationHandle: THandle; Param:PChar):Integer; export;
function CallCariData(ApplicationHandle: THandle; Param:PChar):Integer; export;

var
  strApplicationPath,
  ProfileRegistryKey: string;
  OldApplicationHandle: THandle;
  UserName,
  GroupName:string;

implementation

uses fGlobalVar, fGlobalVarDM, futils, fMainDM,
  fUserLib, fMainRTGS2G2, fParamRTGS, fAddTC, fLaporanPerProses,
  fLaporanKonversiDetail, fCari;

function CallConvRTGS2G2(ApplicationHandle: THandle; Param:PChar):Integer; export;
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
			strApplicationPath:= IncludeTrailingPathDelimiter(GlobalVarForm.SystemApplicationPath);
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      if GlobalVarDM.CheckRegister(strApplicationPath, GlobalVarForm.BankCode, GlobalVarForm.BankActiveBranch, True) then
      begin
        Application.CreateForm(TMainDM, MainDM);
        Application.CreateForm(TfrmMain, frmMain);
        try
          frmMain.AutoMode := False;
          frmMain.UserName := GetItem(StrPas(Param),';',1);
          frmMain.ShowModal;
          Result := 0;
        finally
          FreeAndNil(frmMain);
          FreeAndNil(MainDM);
        end;
      end;
      {---Customized functions---}
    finally
    	FreeAndNil(frmUserLib);
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

function CallConvParam(ApplicationHandle: THandle; Param:PChar):Integer; export;
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
			strApplicationPath:= IncludeTrailingPathDelimiter(GlobalVarForm.SystemApplicationPath);
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      if GlobalVarDM.CheckRegister(strApplicationPath, GlobalVarForm.BankCode, GlobalVarForm.BankActiveBranch, True) then
      begin
        Application.CreateForm(TMainDM, MainDM);
        Application.CreateForm(TfrmParamRTGSConvert, frmParamRTGSConvert);
        Application.CreateForm(TfrmAddTC, frmAddTC);
        try
          frmParamRTGSConvert.ShowModal;
          Result := 0;
        finally
          FreeAndNil(frmAddTC);
          FreeAndNil(frmParamRTGSConvert);
        end;
      end;
      {---Customized functions---}
    finally
    	FreeAndNil(frmUserLib);
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

function CallRptPerProsesFile(ApplicationHandle: THandle; Param:PChar):Integer; export;
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
			strApplicationPath:= IncludeTrailingPathDelimiter(GlobalVarForm.SystemApplicationPath);
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      Application.CreateForm(TMainDM, MainDM);
      Application.CreateForm(TfrmLaporanPerProses, frmLaporanPerProses);
      try
        frmLaporanPerProses.ShowModal;
        Result := 0;
      finally
        FreeAndNil(frmLaporanPerProses);
      end;
      {---Customized functions---}
    finally
    	FreeAndNil(frmUserLib);
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

function CallRptKonversiSKN(ApplicationHandle: THandle; Param:PChar):Integer; export;
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
			strApplicationPath:= IncludeTrailingPathDelimiter(GlobalVarForm.SystemApplicationPath);
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      Application.CreateForm(TMainDM, MainDM);
      Application.CreateForm(TfrmLaporanKonversiDetail, frmLaporanKonversiDetail);
      try
        frmLaporanKonversiDetail.ReportType := 1;
        frmLaporanKonversiDetail.ShowModal;
        Result := 0;
      finally
        FreeAndNil(frmLaporanKonversiDetail);
      end;
      {---Customized functions---}
    finally
    	FreeAndNil(frmUserLib);
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

function CallRptKonversiREMM(ApplicationHandle: THandle; Param:PChar):Integer; export;
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
			strApplicationPath:= IncludeTrailingPathDelimiter(GlobalVarForm.SystemApplicationPath);
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      Application.CreateForm(TMainDM, MainDM);
      Application.CreateForm(TfrmLaporanKonversiDetail, frmLaporanKonversiDetail);
      try
        frmLaporanKonversiDetail.ReportType := 2;
        frmLaporanKonversiDetail.ShowModal;
        Result := 0;
      finally
        FreeAndNil(frmLaporanKonversiDetail);
      end;
      {---Customized functions---}
    finally
    	FreeAndNil(frmUserLib);
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

function CallCariData(ApplicationHandle: THandle; Param:PChar):Integer; export;
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
			strApplicationPath:= IncludeTrailingPathDelimiter(GlobalVarForm.SystemApplicationPath);
      //InitLog(GlobalVarForm.LogPath + '\CPC' + FormatDateTime('YYYYMMDD',Now)+'.log');

      {---Customized functions---}
      Application.CreateForm(TfrmUserLib, frmUserLib);
      Application.CreateForm(TfrmCari, frmCari);
      try
        frmCari.ShowModal;
        Result := 0;
      finally
        FreeAndNil(frmCari);
      end;
      {---Customized functions---}
    finally
    	FreeAndNil(frmUserLib);
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


