unit fNewGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, LMDCustomComponent,
  LMDWndProcComponent, LMDFormShadow, AdvOfficePager,
  AdvPanel, Buttons, AdvOfficePagerStylers, XPMan;

const
  NEW_GROUP    = 1;
  MANAGE_GROUP = 2;         

type
  TfmNewGroup = class(TForm)
    AdvPanel1: TAdvPanel;
    pageControl1: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    AdvOfficePager12: TAdvOfficePage;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Bevel2: TBevel;
    lblCreateUser: TLabel;
    lblEditUser: TLabel;
    lblValidateUser: TLabel;
    bvBottom: TBevel;
    edGroupName: TEdit;
    edDesc: TEdit;
    edStatus: TEdit;
    edCreateUser: TEdit;
    edEditUser: TEdit;
    edValidateUser: TEdit;
    gbAccess: TGroupBox;
    tvAccesses: TTreeView;
    LMDFormShadow1: TLMDFormShadow;
    pgcStyler: TAdvOfficePagerOfficeStyler;
    bnValidate: TBitBtn;
    bnCreate: TBitBtn;
    bnCancel: TBitBtn;
    XPManifest1: TXPManifest;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tvAccessesDblClick(Sender: TObject);
    procedure edGroupNameChange(Sender: TObject);
    procedure edDescChange(Sender: TObject);
    procedure bnCreateClick(Sender: TObject);
    procedure bnValidateClick(Sender: TObject);
    procedure tvAccessesKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FCanValidate: Boolean;
    FintOldGrpStatus: Integer;
    FboTaskValidate: Boolean;
    FboTaskEdit: Boolean;
    FboTaskSetAccess: Boolean;
    procedure UpdateView;
    procedure ResetTag;
    procedure ExecEditGroup;
    procedure DefineMenuAccessList;
    procedure VisibleControls(const Value: Boolean);
    procedure NewGroupSetUp;
    procedure ManageGroupSetUp;
    function CreateGroup: Integer;
    function SetCreateGroupAccess: string;
    procedure FreeTreeNodeData;
    procedure SetCanValidate(const Value: Boolean);
  public
    { Public declarations }
    property CanValidate: Boolean read FCanValidate write SetCanValidate;
  end;

var
  fmNewGroup: TfmNewGroup;

implementation

uses fUMCConst, fConst, fUtils, fRules, fUserMain;

{$R *.dfm}

procedure TfmNewGroup.FormShow(Sender: TObject);
var
  strCreateUser, strEditUser, strValidateUser, strMachine: string;
  btActive, btEnabled, btStatus: Byte;
begin
  edGroupName.OnChange := nil;
  edDesc.OnChange := nil;
  if not assigned(tvAccesses.OnDblClick)  then
    tvAccesses.OnDblClick := tvAccessesDblClick;
  if not assigned(tvAccesses.OnKeyPress) then
    tvAccesses.OnKeyPress := tvAccessesKeyPress;
  PageControl1.ActivePageIndex := 0;
  DefineMenuAccessList;
  edDesc.Enabled := True;
  ResetTag;
  if Tag=NEW_GROUP then
    NewGroupSetUp      { User Group }
  else if Tag=MANAGE_GROUP then
    ManageGroupSetUp;   { Manage Group }
  FboTaskValidate := False;
  FboTaskEdit := False;
  FboTaskSetAccess := False;
  edGroupName.OnChange := edGroupNameChange;
  edDesc.OnChange := edDescChange;
end;

procedure TfmNewGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeTreeNodeData;
end;

procedure TfmNewGroup.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (ModalResult<>mrAbort) and (((TAG=NEW_GROUP) and (edGroupName.Tag=tgChanged)) or ((TAG=MANAGE_GROUP) and
    (FboTaskEdit) or (FboTaskValidate) or (FboTaskSetAccess))) then
    if MessageDlg(rsConfirmCloseWindow, mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      CanClose := True
    else
      CanClose := False;
end;

procedure TfmNewGroup.tvAccessesDblClick(Sender: TObject);
begin
  if tvAccesses.Selected<>nil then
  begin
    // If Cross then
    if tvAccesses.Selected.StateIndex=7 then
      // Give Access
    begin
      tvAccesses.Selected.StateIndex := 8;
      FboTaskSetAccess := True;
      if Tag=MANAGE_GROUP then
      begin
         UpdateView;
      end;
    end
    // if checked then
    else if tvAccesses.Selected.StateIndex=8 then
      // do not give access
    begin
      tvAccesses.Selected.StateIndex:=7;
      FboTaskSetAccess := True;
      if Tag=MANAGE_GROUP then
      begin
         UpdateView;
      end;
    end;
  end;
end;

procedure TfmNewGroup.edGroupNameChange(Sender: TObject);
begin
  if Trim(edGroupName.Text)='' then
    bnCreate.Enabled := False
  else begin
    bnCreate.Enabled := True;
    edGroupName.Tag := tgChanged;
  end;
end;

procedure TfmNewGroup.edDescChange(Sender: TObject);
begin
  if (Tag=MANAGE_GROUP) and (edGroupName.Text<>'') then
  begin
    FboTaskEdit := True;
    UpdateView;
  end;
end;

function TfmNewGroup.CreateGroup: Integer;
var
  intI: Integer;
begin
  Result := VR_FAILED;
  if not CheckString(edGroupName.Text) then
  begin
    PageControl1.ActivePageIndex := 0;
    edGroupName.SetFocus;
    MessageDlg(rsGroupNameInvalid, mtInformation, [mbOK], 0);
  end
  else begin
    intI := ruleCreateGroup(edGroupName.Text, edDesc.Text, frmMainUser.UserName);
    case intI of
      VR_FAILED:
        begin
          MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtInformation, [mbOk], 0);
        end;
      VR_GROUP_EXISTS:
        begin
          MessageDlg(Format(rsGroupExists, [edGroupName.Text]), mtInformation, [mBOK], 0);
        end;
      VR_OK:
        begin
          edGroupName.Tag := tgReset;
          ruleSaveLog(frmMainUser.UserName, MDL_UMC, 'Buat grup baru : ' + edGroupName.Text);
          Result := VR_OK;
        end;
      else begin
        MessageDlg(Format(rsErrUnknownResult, [intI]) + ' ' + rsDataNotSaved,
          mtInformation, [mBOK], 0);
      end;
    end;
  end;
end;

procedure TfmNewGroup.DefineMenuAccessList;
var
  tempNode: TTreeNode;
  slAccId: TStringList;
begin
  //slAccID := TStringList.Create;
  //try
    //if ruleGetAccessID(slAccID)=VR_OK  then
    //begin
      tempNode := tvAccesses.Items.GetFirstNode;

      while tempNode<>nil do
      begin
        if tempnode.stateIndex<>-1 then
        begin
          tempNode.StateIndex := 7;
          //tempNode.Data := StrPCopy(StrAlloc(Length(slAccID[0])+1), slAccID[0]);
          //slAccID.Delete(0);
        end;
        tempNode := tempNode.GetNext;
      end;
    //end
    //else
    //begin
    //  MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
    //end;
  //finally
  //  slAccId.Free;
  //end;
  if not tvAccesses.TopItem.Expanded then
    tvAccesses.FullExpand;
end;

procedure TfmNewGroup.FreeTreeNodeData;
var
  tempNode: TTreeNode;
begin
  tempNode := tvAccesses.Items.GetFirstNode;
  while tempNode<>nil do begin
    if tempNode.Data<>nil then begin
      StrDispose(tempNode.Data);
    end;
    tempNode := tempNode.GetNext;
  end;
end;

procedure TfmNewGroup.ManageGroupSetUp;
var
  slAccess: TStringList;
  tempNode: TTreeNode;
  btI, btStatus: Byte;
  strCreateUser, strEditUser, strValidateUser, strTemp: string;
  intAccID: Integer;
begin
  Caption := rsTxtManageGroup;
  //Icon := imgManage.Picture.Icon;
  //lblAccess.Caption := Format(rsTxtAccRight, [edGroupName.Text]);
  bnCreate.Caption := rsButtonSave;
  bnCreate.Hint := rsButtonSave + ' ' + rsTxtGroup;
  VisibleControls(True);
  edGroupName.Enabled := False;
  edStatus.Enabled := False;
  bnCreate.Enabled := False;
  slAccess := TStringList.Create;
  try
    if ruleGetGroupData(edGroupName.Text, btStatus, strCreateUser, strEditUser,
      strValidateUser)=VR_OK then
    begin
      bnValidate.Visible := True;
      FintOldGrpStatus := btStatus;
      case btStatus of
        ST_NEW:
          begin
            edStatus.Text := rsStatusNew; { + ' ' + rsTxtGroup; }
            bnValidate.Enabled := ((LowerCase(frmMainUser.UserName)<>LowerCase(strCreateUser))
              and FCanValidate);
            edDesc.Enabled := LowerCase(frmMainUser.UserName)=LowerCase(strCreateUser);
            tvAccesses.ReadOnly := edDesc.Enabled;
            if (LowerCase(frmMainUser.UserName)<>LowerCase(strCreateUser)) then
            begin
              tvAccesses.OnDblClick := nil;
              tvAccesses.OnKeyPress := nil;
            end;
          end;
        ST_EDITED:
          begin
            edStatus.Text := rsStatusEditing;
            bnValidate.Enabled := ((LowerCase(frmMainUser.UserName)<>LowerCase(strEditUser))
              and FCanValidate);
          end;
        ST_AUTHORIZED:
          begin
            edStatus.Text := rsStatusAuthorized;
            bnValidate.Enabled := False;
          end;
      end;
      edCreateUser.Text := strCreateUser;
      edEditUser.Text := strEditUser;
      edValidateUser.Text := strValidateUser;
      if ruleGetGrpAccess(edGroupName.Text, slAccess)=VR_OK then
      begin
        tempNode := tvAccesses.Items.GetFirstNode;
        while tempNode<>nil do
        begin
          if tempnode.StateIndex<>-1 then
          begin
            try
              if slAccess.IndexOf(IntToStr(tempNode.ImageIndex))=-1 then
              begin
                tempNode.StateIndex := 7;
              end
              else begin
                tempNode.StateIndex := 8;
              end;
            except
              tempNode.StateIndex := 7;
            end;
          end;
          tempNode := tempNode.GetNext;
{          if tempNode.StateIndex<>-1 then
          begin
            try
              strTemp := IntToStr(tempNode.Parent.Index+1) + SEP +
                IntToStr(tempNode.Index+1);
              btI := 0;
              while btI<slAccess.Count do
              begin
                if strTemp=slAccess[btI] then
                begin
                  tempNode.StateIndex := 8;
                  slAccess.Delete(0);
                  break;
                end;
                inc(btI);
              end;
            except
              tempNode.StateIndex := 7;
            end;
          end;
          tempNode := tempNode.GetNext;}
        end;
      end;
      if edDesc.Enabled then begin
        PageControl1.ActivePageIndex := 0;
        edDesc.SetFocus;
      end;
    end
    else begin
      MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
    end;
  finally
    slAccess.Free;
  end;
end;

procedure TfmNewGroup.NewGroupSetUp;
begin
  Caption := rsTxtNewGroup;
  //Icon := imgNew.Picture.Icon;
  //lblAccess.Caption := rsACT_CHG_ACCESS_SET;
  bnCreate.Caption := rsButtonCreate;
  bnCreate.Hint := rsButtonCreate + ' ' + rsTxtGroup;
  bnCreate.Enabled := False;
  edGroupName.Enabled := True;
  edStatus.Text := rsStatusNew; {  + ' ' + rsTxtGroup; }
  edGroupName.Clear;
  edDesc.Clear;
  VisibleControls(False);
  PageControl1.ActivePageIndex := 0;
  edGroupName.SetFocus;
end;

procedure TfmNewGroup.ResetTag;
begin
  edGroupName.Tag := tgReset;
  edDesc.Tag := tgReset;
  tvAccesses.Tag := tgReset;
end;

procedure TfmNewGroup.SetCanValidate(const Value: Boolean);
begin
  FCanValidate := Value;
end;

function TfmNewGroup.SetCreateGroupAccess: string;
var
  tempNode: TTreeNode;
  intI: Integer;
  tempStr, strNo: string;
begin
  Result := '';
  tempNode := tvAccesses.Items.GetFirstNode;//   TopItem;
  while tempNode<>nil do
  begin
    if tempNode.StateIndex=8 then
    begin   { Can Access Menu }
      tempStr := IntToStr(tempNode.ImageIndex);
      //strNo := IntToStr(tempNode.AbsoluteIndex - tempNode.Parent.Index);
      //strNo := IntToStr(tempNode.);
      intI := ruleSetGroupCanAccessMenu(edGroupName.Text, tempStr);
      case intI of
        VR_FAILED:
          begin
            MessageDlg(rsSetAccessListFailed, mtError, [mBOK], 0);
            Exit;
          end;
        VR_OK:
          begin
            Result := Result + tempStr + ' ';
          end;
        else begin
          MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
          Exit;
        end;
      end;
    end;
    tempNode := tempNode.GetNext;
  end;
  FboTaskSetAccess := False;
end;

procedure TfmNewGroup.UpdateView;
begin
  if FintOldGrpStatus<>ST_NEW then
  begin
    edStatus.Text := rsStatusEditing;
    edEditUser.Text := frmMainUser.UserName;
  end;
  bnValidate.Enabled := False;
  bnCreate.Enabled := True;
end;

procedure TfmNewGroup.VisibleControls(const Value: Boolean);
begin
  bvBottom.Visible := Value;
  lblCreateUser.Visible := Value;
  lblEditUser.Visible := Value;
  lblValidateUser.Visible := Value;
  edCreateUser.Visible := Value;
  edEditUser.Visible := Value;
  edValidateUser.Visible := Value;
  bnValidate.Visible := Value;
end;

procedure TfmNewGroup.ExecEditGroup;
var
  intI: Integer;
begin
  intI := ruleSetEditGroup(edGroupName.Text, frmMainUser.UserName);
  case intI of
    VR_FAILED:
      begin
        MessageDlg(rsSetAccessListFailed, mtError, [mBOK], 0);
      end;
    VR_OK:
      begin
        ruleSaveLog(frmMainUser.UserName, MDL_UMC, 'Edit grup : ' + edGroupName.Text);
      end;
    else begin
      MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
    end;
  end;
end;

procedure TfmNewGroup.bnCreateClick(Sender: TObject);
var
  intI: Integer;
  strActivity: string;
begin
  strActivity := '';
  case Tag of
    NEW_GROUP:
      begin
        if MessageDlg(rsConfirmSaveChanges, mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        begin
          if CreateGroup=VR_OK then begin
            strActivity := SetCreateGroupAccess;
            ruleSaveLog(frmMainUser.UserName, MDL_UMC, 'Grup Baru : ' +
              Format(rsLogSetsMenuAccessList, [strActivity, edGroupName.Text]));
            MessageDlg(rsInfoDataSaved, mtInformation, [mBOK], 0);
            ModalResult := mrOK;
          end;
        end;
      end;
    MANAGE_GROUP:
      begin
        if MessageDlg(rsConfirmSaveChanges, mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        begin
          if FboTaskValidate then
          begin
            intI := ruleValidateGroup(edGroupName.Text, frmMainUser.UserName);
            case intI of
              VR_OK:
                begin
                  FintOldGrpStatus := ST_AUTHORIZED;
                  FboTaskValidate := False;
                  ruleSaveLog(frmMainUser.UserName, MDL_UMC, 'Validasi Grup : ' + edGroupName.Text);
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

          if FboTaskEdit then
          begin
            if FintOldGrpStatus=ST_NEW then
              intI := ruleUpdateGroupData(edGroupName.Text, edDesc.Text, frmMainUser.UserName, ST_NEW)
            else if (FintOldGrpStatus=ST_EDITED) or (FintOldGrpStatus=ST_AUTHORIZED) then
              intI := ruleUpdateGroupData(edGroupName.Text, edDesc.Text, frmMainUser.UserName, ST_EDITED);
            case intI of
              VR_FAILED:
                begin
                  MessageDlg(rsSetAccessListFailed, mtError, [mBOK], 0);
                  Exit;
                end;
              VR_OK:
                begin
                  FboTaskEdit := False;
                  ruleSaveLog(frmMainUser.UserName, MDL_UMC, Format(rsLogChangesGroupDesc, [edGroupName.Text, edDesc.Text]));
                end;
              else begin
                MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
                Exit;
              end;
            end;
          end;

          if FboTaskSetAccess then
          begin
            intI := ruleRemoveAllAccess(edGroupName.Text);
            case intI of
              VR_FAILED:
                begin
                  MessageDlg(rsSetAccessListFailed, mtError, [mBOK], 0);
                  Exit;
                end;
              VR_OK:
                begin
                  strActivity := SetCreateGroupAccess;
                  if (FintOldGrpStatus=ST_EDITED) or (FintOldGrpStatus=ST_AUTHORIZED) then
                    ExecEditGroup
                  else
                    ruleSaveLog(frmMainUser.UserName, MDL_UMC,
                      Format(rsLogSetsMenuAccessList, [strActivity, edGroupName.Text]));
                end;
              else begin
                MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
                Exit;
              end;
            end;
          end;
          MessageDlg(rsInfoDataSaved, mtInformation, [mBOK], 0);
          ModalResult := mrOK;
        end;
      end;
  end;
end;

procedure TfmNewGroup.bnValidateClick(Sender: TObject);
begin
  edStatus.Text := rsStatusAuthorized;
  edValidateUser.Text := frmMainUser.UserName;
  FboTaskValidate := True;
  bnValidate.Enabled := False;
  bnCreate.Enabled := True;
end;

procedure TfmNewGroup.tvAccessesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#32 then
    tvAccessesDblClick(Sender);
end;

end.
