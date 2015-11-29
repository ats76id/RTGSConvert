unit fManageUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, LMDCustomComponent, LMDWndProcComponent,
  LMDFormShadow, AdvPanel, Buttons, XPMan;

type
  TfmManageUser = class(TForm)
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    lblStatus: TLabel;
    edGroup: TLabel;
    Bevel3: TBevel;
    Label3: TLabel;
    Bevel4: TBevel;
    edName: TEdit;
    edFullName: TEdit;
    edCreateUser: TEdit;
    edEditUser: TEdit;
    edValidateUser: TEdit;
    edStatus: TEdit;
    cbGroup: TComboBox;
    edActive: TEdit;
    LMDFormShadow1: TLMDFormShadow;
    bnValidate: TBitBtn;
    bnLock: TBitBtn;
    bnUnlock: TBitBtn;
    bnResetPassword: TBitBtn;
    bnSave: TBitBtn;
    bnCancel: TBitBtn;
    XPManifest1: TXPManifest;
    procedure FormShow(Sender: TObject);
    procedure bnValidateClick(Sender: TObject);
    procedure bnUnlockClick(Sender: TObject);
    procedure edFullNameChange(Sender: TObject);
    procedure bnSaveClick(Sender: TObject);
    procedure cbGroupChange(Sender: TObject);
    procedure bnLockClick(Sender: TObject);
    procedure bnResetPasswordClick(Sender: TObject);
    procedure bnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FboTaskEdit: Boolean;
    FboTaskValidate: Boolean;
    //FboTaskEnable: Boolean;
    //FboTaskDisable: Boolean;
    FboResetPassword: Boolean;
    FboTaskLock: Boolean;
    FboTaskUnLock: Boolean;
    FboTaskAddRemove: Boolean;
    FboCanEnable: Boolean;
    FboCanUnLock: Boolean;
    FboCanDisable: Boolean;
    FboCanValidate: Boolean;
    FboCanResetPassword: Boolean;
    FintOldUserStatus: Integer;
    procedure UpdateView;
    procedure SetEnableCreate;
    procedure DoEdit(const UserName: string);
    procedure DoValidate(const UserName: string);
    procedure DoUnLock(const UserName: string);
    procedure DoLock(const UserName: string);
    procedure DoResetPassword(const UserName: string);
    procedure FillGroupList(const strGroup: string; intGrpStatus: Integer);
  public
    { Public declarations }
    property CanValidate: Boolean read FboCanValidate write FboCanValidate;
    property CanEnable: Boolean read FboCanEnable write FboCanEnable;
    property CanDisable: Boolean read FboCanDisable write FboCanDisable;
    property CanUnLock: Boolean read FboCanUnLock write FboCanUnLock;
    property CanResetPassword: Boolean read FboCanResetPassword write FboCanResetPassword;
  end;

var
  fmManageUser: TfmManageUser;

implementation

uses fUMCConst, fRules, fConst, fUserLib, fUserMain, fGlobalVar;

{$R *.dfm}


procedure TfmManageUser.DoEdit(const UserName: string);
var
  intI: Integer;
  strQry: string;
begin
  strQry := 'Update ' + DB_TABLE_USER + ' set ';

  if FboTaskEdit then
  begin
    strQry := strQry + 'user_full_name=''' + frmUserLib.encUser(Trim(edFullName.Text)) + '''' +
      ', group_name=''' + frmUserLib.encGroup(Trim(cbGroup.Text)) + '''';
  end;

  //if FintFOldUserStatus<>ST_NEW then
  strQry := strQry + ', user_status=' + IntToStr(ST_EDITED) +
    ', user_edited_by=''' + frmUserLib.encUser(UserName) + '''';

  strQry := strQry + ' Where user_name=''' + frmUserLib.encUser(Trim(edName.Text)) + '''';

  intI := ruleUpdateUserData(strQry);
  case intI of
    VR_OK:
      begin
        if FboTaskEdit then
        begin
          FboTaskEdit := False;
          ruleSaveLog(UserName, MDL_UMC, 'Edit user : ' + edName.Text);
        end;
      end;
    VR_FAILED:
      begin
        MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
      end;
    else begin
      MessageDlg(Format(rsErrUnknownResult, [intI]) + ' ' + rsDataNotSaved,
        mtInformation, [mBOK], 0);
    end;
  end;
end;

procedure TfmManageUser.DoUnLock(const UserName: string);
var
  strQry: string;
  intI: Integer;
begin
  strQry := 'Update ' + DB_TABLE_USER + ' set user_active=' + IntToStr(F_DISABLED) +
    ', user_status=' + IntToStr(ST_UNLOCKED) + ', user_bad_login=0, user_edited_by=''' + frmUserLib.encUser(UserName) +
    ''' Where user_name=''' + frmUserLib.encUser(Trim(edName.Text)) + '''';
  intI := ruleUpdateUserData(strQry);
  case intI of
    VR_OK:
      begin
        if FboTaskUnLock then
        begin
          FboTaskUnLock := False;
          ruleSaveLog(UserName, MDL_UMC, 'Unlock user : ' + edName.Text);
        end;
      end;
    VR_FAILED:
      begin
        MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
      end;
    else begin
      MessageDlg(Format(rsErrUnknownResult, [intI]) + ' ' + rsDataNotSaved,
        mtInformation, [mBOK], 0);
    end;
  end;
end;

procedure TfmManageUser.DoValidate(const UserName: string);
var
  intI: Integer;
  strQry: string;
begin
  FboTaskValidate := False;
  strQry := 'Update ' + DB_TABLE_USER + ' set user_status=' + IntToStr(ST_AUTHORIZED) +
    ', user_validated_by=''' +  frmUserLib.encUser(Trim(UserName)) + ''' Where user_name=''' + frmUserLib.encUser(Trim(edName.Text)) + '''';
  intI := ruleUpdateUserData(strQry);
  FintOldUserStatus := ST_AUTHORIZED;
  case intI of
    VR_OK:
      begin
        ruleSaveLog(UserName, MDL_UMC, 'Validasi user : ' + edName.Text,);
      end;
    VR_FAILED:
      begin
        MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
        Exit;
      end;
    else begin
      MessageDlg(Format(rsErrUnknownResult, [intI]) + ' ' + rsDataNotSaved,
        mtInformation, [mBOK], 0);
      Exit;
    end;
  end;
end;

procedure TfmManageUser.FillGroupList(const strGroup: string; intGrpStatus: Integer);
var
  tempList: TStringList;
  intIndex: Integer;
begin
  tempList := TStringList.Create;
  cbGroup.Items.Clear;
  try
    if ruleGetListGroupValidated(tempList)=VR_OK then
    begin
      cbGroup.Items.AddStrings(tempList);
      intIndex := cbGroup.Items.IndexOf(strGroup);
      if intGrpStatus<>ST_AUTHORIZED then
      begin
        intIndex := cbGroup.Items.Add(strGroup + '  (Grup belum validasi)');
        cbGroup.ItemIndex := intIndex;
      end
      else begin
        if intIndex<>-1 then
          cbGroup.ItemIndex := intIndex
        else
          cbGroup.ItemIndex := 0;
      end;
    end
    else begin
      MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
    end;
  finally
    tempList.Free;
  end;
end;

procedure TfmManageUser.FormShow(Sender: TObject);
var
  strCreateUser, strEditUser, strValidateUser, strGrpName: string;
  boActive: Boolean;
  btEnabled, btUserStatus: Byte;
  intGroupStatus, intBadLogin: Integer;
begin
  //FAddRemovedGrpList := TStringList.Create;
  //lvGroups.Columns.Items[0].Caption := rsTxtGroup;
  //PageControl.ActivePageIndex := 0;
  cbGroup.Tag := 0;
  if ruleGetUserData(edName.Text, boActive, btUserStatus, strCreateUser,
    strEditUser, strValidateuser, strGrpName, intGroupStatus, intBadLogin)=VR_OK then
  begin
    edCreateUser.Text := strCreateUser;
    edEditUser.Text := strEditUser;
    edValidateUser.Text := strValidateUser;
    FintOldUserStatus := btUserStatus;
    case btUserStatus of
      ST_NEW:
        begin
          edStatus.Text := rsStatusNew + ' - ' + rsTxtNeedValidate;
          bnValidate.Enabled := ((LowerCase(strCreateUser)<>LowerCase(frmMainUser.UserName))
            and FboCanValidate);
        end;
      ST_EDITED:
        begin
          edStatus.Text := rsStatusEditing;
          bnValidate.Enabled := ((LowerCase(strEditUser)<>LowerCase(frmMainUser.UserName))
            and FboCanValidate);
        end;
      ST_AUTHORIZED:
        begin
          edStatus.Text := rsStatusAuthorized;
          bnValidate.Enabled := False;
        end;
     ST_BLOCKED:
        begin
          edStatus.Text := rsStatusBlocked;
          bnValidate.Enabled := False;
        end;
     ST_UNLOCKED:
        begin
          edStatus.Text := rsStatusUnLocked;
          bnValidate.Enabled := ((LowerCase(strEditUser)<>LowerCase(frmMainUser.UserName))
            and FboCanValidate);;
        end;
    end;
    case boActive of
      False: edActive.Text := rsNo;
      True : edActive.Text := rsYes; // + ' - ' + Format(rsTxtActiveIn, [strMachine]);
    end;
    //bnEnable.Enabled  := False;
    //bnDisable.Enabled := False;
    bnUnLock.Enabled  := False;
    bnLock.Enabled := False;
    if btUserStatus <> ST_NEW then
    begin
      {* by Atma : added "or (btUserStatus = ST_BLOCKED)" at bnUnlock.enabled *} 
      bnUnLock.Enabled  := FboCanUnLock and ((boActive=TRUE) or (intBadLogin>=3) or (btUserStatus = ST_BLOCKED)) and (edName.Text<>frmMainUser.UserName);
      bnLock.Enabled := FboCanUnLock and (boActive=False) and (btUserStatus<>ST_BLOCKED) and (edName.Text<>frmMainUser.UserName);
      edFullName.Enabled := boActive=FALSE and (LowerCase(frmMainUser.UserName)<>LowerCase(edName.Text));
      cbGroup.Enabled := boActive=FALSE and (LowerCase(frmMainUser.UserName)<>LowerCase(edName.Text));
      bnResetPassword.Enabled := FboCanResetPassword and (LowerCase(frmMainUser.UserName)<>LowerCase(edName.Text));
    end
    else begin
      //bnEnable.Enabled  := FboCanEnable and (btEnabled=F_DISABLED) and
      //  (boActive=FALSE) and (LowerCase(frmMainUser.UserName)=LowerCase(strCreateUser));
      //bnDisable.Enabled := FboCanDisable and (btEnabled=F_ENABLED) and
      //  (boActive=FALSE) and (LowerCase(frmMainUser.UserName)=LowerCase(strCreateUser));
      bnUnLock.Enabled := FboCanUnLock and (boActive=TRUE) and
        (edName.Text<>frmMainUser.UserName) and (LowerCase(frmMainUser.UserName)=LowerCase(strCreateUser));

      bnLock.Enabled := FboCanUnLock and (boActive=False) and
        (edName.Text<>frmMainUser.UserName) and (LowerCase(frmMainUser.UserName)=LowerCase(strCreateUser));
      edFullName.Enabled := (boActive=FALSE) and (LowerCase(frmMainUser.UserName)=LowerCase(strCreateUser));
      cbGroup.Enabled := (boActive=FALSE) and (LowerCase(frmMainUser.UserName)=LowerCase(strCreateUser));// and(LowerCase(frmMainUser.UserName)=LowerCase(strCreateUser));
      bnResetPassword.Enabled := False;
    end;
  end
  else begin
    bnSave.Enabled := False;
    MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
  end;
  FillGroupList(strGrpName, intGroupStatus);
  FboTaskEdit := False;
  FboTaskValidate := False;
  //FboTaskEnable := False;
  //FboTaskDisable := False;
  FboTaskUnLock := False;
  FboTaskLock := False;
  FboResetPassword := False;
  bnSave.Enabled := False;
  if edFullName.Enabled then
    edFullName.SetFocus;
end;

procedure TfmManageUser.SetEnableCreate;
begin
  bnSave.Enabled := (edFullName.Tag=1) or (cbGroup.Tag=1);
end;

procedure TfmManageUser.UpdateView;
begin
  if FintOldUserStatus<>ST_NEW then
  begin
    edStatus.Text   := rsStatusEditing;
    edEditUser.Text := frmMainUser.UserName;
  end;
  bnValidate.Enabled := False;
  SetEnableCreate;
end;

procedure TfmManageUser.bnValidateClick(Sender: TObject);
begin
  FboTaskValidate := True;
  edStatus.Text := rsStatusAuthorized;
  edValidateUser.Text := frmMainUser.UserName;
  bnValidate.Enabled := False;
  bnSave.Enabled := True;
end;

procedure TfmManageUser.bnUnlockClick(Sender: TObject);
begin
  FboTaskLock := False;
  FboTaskUnLock := True;
  edActive.Text := rsNo;
  edStatus.Text   := rsStatusUnLocked;
  edEditUser.Text := frmMainUser.UserName;
  bnUnLock.Enabled := False;
  bnLock.Enabled := True;
  bnValidate.Enabled := False;
  bnSave.Enabled := True;
end;

procedure TfmManageUser.edFullNameChange(Sender: TObject);
begin
  if Trim((Sender as TEdit).Text)='' then
    (Sender as TEdit).Tag := 0
  else
    (Sender as TEdit).Tag := 1;
  FboTaskEdit := True;
  UpdateView;
end;

procedure TfmManageUser.bnSaveClick(Sender: TObject);
begin
  if MessageDlg(rsConfirmSaveChanges, mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
    bnSave.Enabled := False;
    if FboTaskValidate then
      DoValidate(frmMainUser.UserName);
    if FboTaskEdit then
      DoEdit(frmMainUser.UserName);
    if FboTaskUnLock then
      DoUnLock(frmMainUser.UserName);
    if FboTaskLock then
      DoLock(frmMainUser.UserName);
    if FboResetPassword then
      DoResetPassword(frmMainUser.UserName);
    MessageDlg(rsInfoDataSaved, mtInformation, [mBOK], 0);
    modalResult := mrOk;
  end;
end;

procedure TfmManageUser.cbGroupChange(Sender: TObject);
begin
  cbGroup.Tag := 1;
  FboTaskEdit := True;
  UpdateView;
end;

procedure TfmManageUser.bnLockClick(Sender: TObject);
begin
  FboTaskUnlock      := False;
  FboTaskLock        := True;
  //edActive.Text      := rsYes;
  edStatus.Text      := rsStatusBlocked;
  edEditUser.Text    := frmMainUser.UserName;
  bnLock.Enabled     := False;
  bnUnLock.Enabled   := True;
  bnValidate.Enabled := False;
  bnSave.Enabled     := True;
end;

procedure TfmManageUser.DoLock(const UserName: string);
var
  strQry: string;
  intI: Integer;
begin
  strQry := 'Update ' + DB_TABLE_USER + ' set user_status=' + IntToStr(ST_BLOCKED) +
    ', user_edited_By=''' + frmUserLib.encUser(UserName) +
    ''' where user_name=''' + frmUserLib.encUser(Trim(edName.Text)) + '''';
  intI := ruleUpdateUserData(strQry);
  case intI of
    VR_OK:
      begin
        if FboTaskLock then
        begin
          FboTaskLock := False;
          ruleSaveLog(UserName, MDL_UMC, 'Lock user : ' + edName.Text);
        end;
      end;
    VR_FAILED:
      begin
        MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
      end;
    else begin
      MessageDlg(Format(rsErrUnknownResult, [intI]) + ' ' + rsDataNotSaved,
        mtInformation, [mBOK], 0);
    end;
  end;
end;

procedure TfmManageUser.bnResetPasswordClick(Sender: TObject);
begin
  FboResetPassword     := True;
  //edStatus.Text      := rsStatusEditing;
  //edEditUser.Text    := frmMainUser.UserName;
  bnResetPassword.Enabled := False;
  bnValidate.Enabled := False;
  bnSave.Enabled     := True;
end;

procedure TfmManageUser.DoResetPassword(const UserName: string);
var
  strQry: string;
  intI: Integer;
begin
  //strQry := 'Update ' + apokDBUser + '.dbo.users set us_password=''' + EncByKey('password', Trim(edName.Text)) +
  //  ''', us_password_date = '''+FormatDateTime('mm/dd/yyyy', Date-apokPasswordExpire-1)+''' where us_name=''' + encUser(Trim(edName.Text)) + '''';
  strQry := 'Update ' + DB_TABLE_USER + ' set user_password=''' + frmUserLib.EncByKey('password', Trim(edName.Text)) + '''';
  if GlobalVarForm.DBType = 1 then
  	strQry := strQry  + ', user_password_date = #'+FormatDateTime('mm/dd/yyyy', StrToDate('01/01/1980')) + '# '
	else
  	strQry := strQry  + ', user_password_date = '+ QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate('01/01/1980')));
  strQry := strQry + ' where user_name=''' + frmUserLib.encUser(Trim(edName.Text)) + '''';

  intI := ruleUpdateUserData(strQry);
  case intI of
    VR_OK:
      begin
         ruleSaveLog(UserName, MDL_UMC, 'Reset password user : ' + edName.Text);
      end;
    VR_FAILED:
      begin
        MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
      end;
    else begin
      MessageDlg(Format(rsErrUnknownResult, [intI]) + ' ' + rsDataNotSaved,
        mtInformation, [mBOK], 0);
    end;
  end;
end;

procedure TfmManageUser.bnCancelClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

end.
