program CIA2;

uses
  SysUtils,
  Forms,
  Dialogs,
  Controls,
  fMain in 'fMain.pas' {frmMain},
  Unit1 in 'Unit1.pas' {frmDownload222},
  fChangeLog in 'fChangeLog.pas' {frmChangeLog},
  fConst in 'shared\fConst.pas',
  fUMCResStr in 'shared\fUMCResStr.pas',
  reg_main in 'reg_main.pas' {regMain},
  fLogon in 'fLogon.pas' {frmLogin},
  fChangePassword in 'fChangePassword.pas' {frmChangePassword},
  fUserMain in 'fUserMain.pas' {frmMainUser},
  fManageGroup in 'fManageGroup.pas' {fmManageGroup},
  fManageUser in 'fManageUser.pas' {fmManageUser},
  fNewGroup in 'fNewGroup.pas' {fmNewGroup},
  fNewUser in 'fNewUser.pas' {fmNewUser},
  fOptions in 'fOptions.pas' {fmOptions},
  fRules in 'fRules.pas',
  fLogActivities in 'fLogActivities.pas' {frmAppLog},
  fCRC16 in 'shared\fCRC16.pas',
  fGlobalVar in 'shared\fGlobalVar.pas' {GlobalVarForm},
  fGlobalVarDM in 'shared\fGlobalVarDM.pas' {GlobalVarDM: TDataModule},
  futils in 'shared\futils.pas',
  uni_RegCommon in 'shared\uni_RegCommon.pas',
  fUserLib in 'shared\fUserLib.pas' {frmUserLib},
  fAboutNew in 'fAboutNew.pas' {AboutBox},
  fLocked in 'fLocked.pas' {frmLocked},
  fTanggalSistem in 'fTanggalSistem.pas' {frmDateActive};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'CIA - Clearing Interface Application';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TGlobalVarForm, GlobalVarForm);
  Application.CreateForm(TGlobalVarDM, GlobalVarDM);
  Application.CreateForm(TregMain, regMain);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmChangePassword, frmChangePassword);
  Application.CreateForm(TfrmUserLib, frmUserLib);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmLocked, frmLocked);
  Application.CreateForm(TfrmDateActive, frmDateActive);
  frmMain.ConfigFile := ExtractFilePath(Application.ExeName) + 'Config.xml';
  GlobalVarForm.ProfileRegistryKey := frmMain.ConfigFile;
  GlobalVarForm.InitConfig;
  //Application.CreateForm(TdmData, dmData);

  Application.Run;
  (*
  GetRegistrationInformation(ReleaseCodeString, SerialNumber);
  AContinue:= False;
  AContinue:=IsReleaseCodeValid(ReleaseCodeString, SerialNumber);
  if not AContinue then
  begin
    AContinue:= regMain.ShowModal=mrOK;
  end;
  if AContinue then
  begin
  	Application.Run;
  end
  else
  begin
    MessageDlg('Invalid release code. Cannot continue.', mtError, [mbOK], 0);
  end;
  *)
end.
