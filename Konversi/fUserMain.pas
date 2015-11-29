unit fUserMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, ExtCtrls, ComCtrls, ToolWin, fRules,
  StdCtrls, ADODB, AdvMenus, AdvPanel, XPMan;

type
  TfrmMainUser = class(TForm)
    AdvPanel1: TAdvPanel;
    Splitter1: TSplitter;
    Label1: TLabel;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    sbMain: TStatusBar;
    tvMain: TTreeView;
    lvMain: TListView;
    ActionList1: TActionList;
    acManageUser: TAction;
    acRemoveUser: TAction;
    acNewUser: TAction;
    acExit: TAction;
    acNewGroup: TAction;
    acManageGroup: TAction;
    acRemoveGroup: TAction;
    acOptions: TAction;
    acBack: TAction;
    acRefresh: TAction;
    acUserList: TAction;
    acGroupList: TAction;
    acUserRights: TAction;
    acGroupRights: TAction;
    acUserAudit: TAction;
    ImageList1: TImageList;
    AdvPopupMenu1: TAdvPopupMenu;
    pmActions: TAdvPopupMenu;
    Buatuserbaru1: TMenuItem;
    ManageUser1: TMenuItem;
    HapusUser1: TMenuItem;
    N1: TMenuItem;
    Buatgrupbaru1: TMenuItem;
    PengaturanGrup1: TMenuItem;
    HapusGrup1: TMenuItem;
    N2: TMenuItem;
    acOptions1: TMenuItem;
    N3: TMenuItem;
    Keluar1: TMenuItem;
    pmTree: TAdvPopupMenu;
    pmReports: TAdvPopupMenu;
    DaftarUser1: TMenuItem;
    HakAksesUser2: TMenuItem;
    N4: TMenuItem;
    HakAksesUser1: TMenuItem;
    HakAksesGrup1: TMenuItem;
    N5: TMenuItem;
    AuditTrail1: TMenuItem;
    pmList: TAdvPopupMenu;
    XPManifest1: TXPManifest;
    procedure acExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acOptionsExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acNewGroupExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure tvMainChange(Sender: TObject; Node: TTreeNode);
    procedure tvMainExpanded(Sender: TObject; Node: TTreeNode);
    procedure acBackExecute(Sender: TObject);
    procedure pmTreePopup(Sender: TObject);
    procedure lvMainChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvMainDblClick(Sender: TObject);
    procedure lvMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvMainKeyPress(Sender: TObject; var Key: Char);
    procedure lvMainSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure acRemoveUserExecute(Sender: TObject);
    procedure acRemoveGroupExecute(Sender: TObject);
    procedure pmListPopup(Sender: TObject);
    procedure acManageUserExecute(Sender: TObject);
    procedure acNewUserExecute(Sender: TObject);
    procedure acManageGroupExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sbMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure acUserListExecute(Sender: TObject);
    procedure acGroupListExecute(Sender: TObject);
    procedure acUserRightsExecute(Sender: TObject);
    procedure acGroupRightsExecute(Sender: TObject);
    procedure acUserAuditExecute(Sender: TObject);
  private
    { Private declarations }
    FMyRights: TArrInt;
    //SetOfRights: setofbyte;
    FbtLastLevelIndex: Byte;     { Jumlah (tvMain.Selected.Level + tvMain.Selected.Index) }
    FitemSelected: TListItem;
    FitemIdx: Integer;
    FUserName: string;
    procedure FillAccessRight;
    function CekMyRights(intValue: Integer): Boolean;
    procedure SetRights(Level, Index: Integer);
    procedure InitAllFormsFirst;
    procedure Hint(Sender: TObject);
    procedure ShowHint(var HintStr: string; var CanShow: Boolean;
      var HintInfo: THintInfo);

  public
    { Public declarations }
    property UserName: string read FUserName write FUserName;
  end;

var
  frmMainUser: TfrmMainUser;

implementation

uses fUMCConst, fConst, fOptions, fNewGroup, fUtils, fManageUser, fNewUser;
(*
function CallUMCUserList(Handle: THandle; AdoConnection: TADOConnection;
  sstrOperator: string): Integer; external 'umcreports.dll';
function CallUMCGroupList(Handle: THandle; AdoConnection: TADOConnection;
  sstrOperator: string): Integer; external 'umcreports.dll';
function CallUMCUserAudit(Handle: THandle; AdoConnection: TADOConnection;
  sstrOperator: string): Integer; external 'umcreports.dll';
{function CallUMCUserAccessRight(Handle: THandle; AdoConnection: TADOConnection;
  sstrOperator, sstrUserID: string): Integer; external 'umcreports.dll';}
function CallUMCGroupAccessRight(Handle: THandle; AdoConnection: TADOConnection;
  sstrOperator, sstrUserID: string): Integer; external 'umcreports.dll';
*)

{$R *.dfm}

procedure TfrmMainUser.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainUser.FormCreate(Sender: TObject);
begin
  Application.OnShowHint := ShowHint;
  Application.OnHint := Hint;
end;

procedure TfrmMainUser.FormShow(Sender: TObject);
begin
  FbtLastLevelIndex := 3;
  if ruleUserAccessList(FUserName, 5, FMyRights)=VR_FAILED then
  begin
    //SetOfRights := [];
    MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
  end;
  InitAllFormsFirst;
  sbMain.Panels[2].Text := FUserName;
  tvMain.Items[0].Text := rsTxtSIKUserGroup;
  tvMain.Items[0].Item[0].Text := rsTxtUser;
  tvMain.Items[0].Item[1].Text := rsTxtGroup;
  tvMain.Selected := tvMain.TopItem;
  //acRefresh.Execute;
end;

procedure TfrmMainUser.Hint(Sender: TObject);
begin
 // sbMain.Panels[0].Text := Application.Hint;
end;

procedure TfrmMainUser.ShowHint(var HintStr: string; var CanShow: Boolean;
  var HintInfo: THintInfo);
begin
{  if HintInfo.HintControl = ToolButton20 then begin
    acRefresh.Hint := '|' + Format(rsRefreshHint, [tvMain.Selected.Text]);
    HintStr := Format(rsRefreshHint, [tvMain.Selected.Text]);
  end;}
end;

procedure TfrmMainUser.acOptionsExecute(Sender: TObject);
begin
  fmOptions.ShowModal;
end;

procedure TfrmMainUser.InitAllFormsFirst;
begin
  acBack.Enabled         := False;
  acOptions.Enabled      := cekMyRights(UMC_OPTIONS);// in SetOfRights;
  fmNewGroup.CanValidate := cekMyRights(UMC_VALIDATEGROUP); //in SetOfRights;
{  acUserAudit.Enabled    := UMC_AUDIT in SetOfRights;

  FillAccessRight;}
  with fmManageUser do
  begin
    CanValidate := CekMyRights(UMC_VALIDATEUSER);
    CanUnLock   := CekMyRights(UMC_UNLOCKUSER);
    CanResetPassword := CekMyRights(UMC_RESET_PASSWORD);
  end;

  with fmOptions do
  begin
    lblDescPass.Caption := rsDescOptionsPass;
    lblDescUser.Caption := rsDescOptionsUser;
  end;
end;

procedure TfrmMainUser.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg(rsConfirmCloseUMC, mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    CanClose := True
  else
    CanClose := False;
end;

procedure TfrmMainUser.acNewGroupExecute(Sender: TObject);
begin
  fmNewGroup.Tag := NEW_GROUP;
  if fmNewGroup.ShowModal=mrOK then
    acRefresh.Execute;
end;

procedure TfrmMainUser.acRefreshExecute(Sender: TObject);
begin
  tvMainChange(Self, tvMain.Selected);
end;

procedure TfrmMainUser.tvMainChange(Sender: TObject; Node: TTreeNode);
var
  tempColumn: TListColumn;
  tempItem: TListItem;
  tempList: TStringList;
  intI: Integer;
  boI: Boolean;
begin
  lvMain.Items.BeginUpdate;
  try
    lvMain.Items.Clear;
    if Node.Level=0 then
    begin
      if FbtLastLevelIndex<>(Node.Level + Node.Index) then
      begin
        lvMain.Columns.Clear;
        FbtLastLevelIndex := Node.Level + Node.Index;
        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := rsTxtSIKUserGroup;
        tempColumn.Width := 200;
      end;
      tempItem := lvMain.Items.Add;
      tempItem.Caption := rsTxtUser;
      tempItem.ImageIndex := 1;
      tempItem := lvMain.Items.Add;
      tempItem.Caption := rsTxtGroup;
      tempItem.ImageIndex := 0;
    end
    else if Node.Index=0 then           // User List
    begin
      if FbtLastLevelIndex<>1 then
      begin  { Users ==> Level=1; Index=0 }
        lvMain.Columns.Clear;
        FbtLastLevelIndex := Node.Level + Node.Index;

        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := rsTxtName;
        tempColumn.Width := 100;

        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := rsTxtGroup;
        tempColumn.Width := 80;

        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := rsTxtFullName;
        tempColumn.Width := 140;

  {      tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := rsTxtEmpNo;
        tempColumn.Width := 80;}

        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := 'Status';
        tempColumn.Width := 90;
        (* Status login diterminal lain
        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := rsTxtActive;
        tempColumn.Width := 80;
        *)
        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := 'Tanggal Kadaluarsa';
        tempColumn.Width := 135;
      end;
      tempList := TStringList.Create;
      try
        if ruleListUser(tempList)=VR_OK then
        begin
          try
            while tempList.Count>0 do
            begin
              tempItem := lvMain.Items.Add;
              tempItem.Caption := GetItem(tempList[0], sep, 0);     // User Name
              tempItem.SubItems.Add(GetItem(tempList[0], sep, 4));  // Group Name
              tempItem.SubItems.Add(GetItem(tempList[0], sep, 1));  // User Full Namee
              //tempItem.SubItems.Add(GetItem(tempList[0], sep, 2));
              try

                intI := StrToInt(GetItem(tempList[0], sep, 2));
                if intI>=0 then
                  tempItem.SubItems.Add(USERSTATUS[intI])
                else
                  tempItem.SubItems.Add('Unknown');

                (* Status login diterminal lain
                boI := StrToBool(GetItem(tempList[0], sep, 3));
                case boI of
                  True  : tempItem.SubItems.Add(rsYes);
                  False : tempItem.SubItems.Add(rsNo);
                end;
                *)
                tempItem.SubItems.Add(GetItem(templist[0], sep, 5)); // Password Expired
                tempItem.ImageIndex := 1;
  {              boI := StrToBool(GetItem(tempList[0], sep, 3));
                case boI of
                  True  : tempItem.ImageIndex := 6;
                  False : tempItem.ImageIndex := 19;
                  else
                    tempItem.ImageIndex := 6;
                end;

                intI := StrToInt(GetItem(tempList[0], sep, 5));
                case intI of
                  F_ENABLED  : tempItem.SubItems.Add(rsYes);
                  F_DISABLED : tempItem.SubItems.Add(rsNo);
                end;}
              except
                tempItem.SubItems.Add('Unknown');
                tempItem.ImageIndex := 19;
                tempItem.SubItems.Add(rsNo);
              end;
              tempList.Delete(0);
            end;
          finally
          end;
        end
        else begin
          MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
        end;
      finally
        tempList.Free;
      end;
    end
    else if Node.Index=1 then
    begin       { Groups ==> Level=1; Index=1 }     // Group List
      if FbtLastLevelIndex<>2 then
      begin
        lvMain.Columns.Clear;
        FbtLastLevelIndex := Node.Level + Node.Index;
        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := rsTxtGroupName;
        tempColumn.Width := 120;
        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := rsTxtDesc;
        tempColumn.Width := 180;
        tempColumn := lvMain.Columns.Add;
        tempColumn.Caption := 'Status';
        tempColumn.Width := 100;
      end;
      tempList := TStringList.Create;
      try
        if ruleListGroup(tempList)=VR_OK then
        begin
          try
            while tempList.Count>0 do
            begin
              tempItem := lvMain.Items.Add;
              tempItem.Caption := GetItem(tempList[0], SEP, 0);
              tempItem.SubItems.Add(GetItem(tempList[0], SEP, 1));
              try
                intI := StrToInt(GetItem(tempList[0], SEP, 2));
                if intI>=0 then
                  tempItem.SubItems.Add(USERSTATUS[intI])
                else
                  tempItem.SubItems.Add('Unknown');
              except
                tempItem.SubItems.Add('Unknown');
              end;
              tempItem.ImageIndex := 0;
              tempList.Delete(0);
            end;
          finally
          end;
        end
        else
        begin
          MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
        end;
      finally
        tempList.Free;
      end;
    end;
  finally
    lvMain.Items.EndUpdate;
  end;
end;

procedure TfrmMainUser.tvMainExpanded(Sender: TObject; Node: TTreeNode);
begin
  if tvMain.TopItem.Expanded then
    acBack.Enabled := True
  else
    acBack.Enabled := False;
end;

procedure TfrmMainUser.acBackExecute(Sender: TObject);
begin
  if tvMain.TopItem.Expanded then
  begin
    tvMain.FullCollapse;
    tvMainChange(Self, tvMain.Selected);
  end;
end;

procedure TfrmMainUser.pmTreePopup(Sender: TObject);
var
  tempMenu:TMenuItem;
begin
  pmTree.Items.Clear;
  if tvMain.Selected<>nil then
  begin
    if (tvMain.Selected.Level + tvMain.Selected.Index)=1 then
    begin
      tempMenu := TMenuItem.Create(pmTree);
      tempMenu.Action := acNewUser;
      pmTree.Items.Add(tempMenu);

      tempMenu := NewLine;
      pmTree.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmTree);
      tempMenu.Action := acRefresh;
      pmTree.Items.Add(tempMenu);
    end
    else if (tvMain.Selected.Level + tvMain.Selected.Index)=2 then
    begin
      tempMenu := TMenuItem.Create(pmTree);
      tempMenu.Action := acNewGroup;
      pmTree.Items.Add(tempMenu);

      tempMenu := NewLine;
      pmTree.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmTree);
      tempMenu.Action := acRefresh;
      pmTree.Items.Add(tempMenu);
    end;
  end;
end;

procedure TfrmMainUser.lvMainChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  sbMain.Panels[1].Text := Format(rsTxtObjects, [lvMain.Items.Count]);
  try
    if tvMain.Selected<>nil then
      if (tvMain.Selected.Level=0) and (lvMain.Selected<>nil) then
        SetRights(0, lvMain.Selected.Index)
      else if (tvMain.Selected.Level=0) and (lvMain.Selected=nil) then
        SetRights(0, -1)
      else
        SetRights(tvMain.Selected.Level, tvMain.Selected.Index);
  except
    on E: Exception do
      MessageDlg(E.message, mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmMainUser.lvMainDblClick(Sender: TObject);
begin
  if FitemSelected<>nil then
  begin
    if (tvMain.Selected.Level + tvMain.Selected.Index)=0 then
    begin
      if FitemSelected.Index=0 then
        tvMain.Selected := tvMain.Items[1]
      else if FitemSelected.Index=1 then
        tvMain.Selected := tvMain.Items[2];
    end
    else
     if ((tvMain.Selected.Level + tvMain.Selected.Index)=1) and (cekMyRights(UMC_MANAGEUSER)) then
      begin
       acManageUser.Execute;
      end
      else if ((tvMain.Selected.Level + tvMain.Selected.Index)=2) and
        CekMyRights((UMC_MANAGEGROUP)) then
      begin
        acManageGroup.Execute;
      end;
  end;
end;

procedure TfrmMainUser.FillAccessRight;
const
  UMCRights: array[1..17] of string =
             ( rsUMC_NEWUSER, rsUMC_MANAGEUSER, rsUMC_VALIDATEUSER,
               rsUMC_ENABLEUSER, rsUMC_DISABLEUSER, rsUMC_UNLOCKUSER,
               rsUMC_REMOVEUSER, rsUMC_SETPASSWORD, rsUMC_NEWGROUP,
               rsUMC_MANAGEGROUP, rsUMC_VALIDATEGROUP, rsUMC_REMOVEGROUP,
               rsUMC_OPTIONS, rsUMC_USERANDGROUPLIST, rsUMC_AUDIT,
               rsUMC_USERACCESSRIGHT, rsUMC_GROUPACCESSRIGHT);
{  DMCRights: array[1..17] of string =
             ( rsDMC_NEWBANKCODE, rsDMC_EDITBANKCODE, rsDMC_VALIDATEBANKCODE,
               rsDMC_REMOVEBANKCODE, rsDMC_NEWBRANCHCODE, rsDMC_EDITBRANCHCODE,
               rsDMC_VALIDATEBRANCHCODE, rsDMC_REMOVEBRANCHCODE, rsDMC_NEWBANKGROUP,
               rsDMC_EDITBANKGROUP, rsDMC_VALIDATEBANKGROUP, rsDMC_REMOVEBANKGROUP,
               rsDMC_GENERATECDKEY, rsDMC_SETMASTERKEY, rsDMC_CONFIRMMASTERKEY,
               rsDMC_OPTIONS, rsDMC_IMPORT );
  IVCRights: array[1..2] of string =
             ( rsIVC_VERIFY, rsIVC_OPTIONS );
  DICRights: array[1..3] of string =
             ( rsDIC_IMPORTDATE, rsDIC_OPTIONS, rsDIC_REMOVEIMPORT );
  CCCRights: array[1..3] of string =
             ( rsCCC_CREATEARCHIVECD, rsCCC_CREATEDISTCD, rsCCC_OPTIONS );
  ASCRights: array[1..4] of string =
             ( rsASC_SEARCH, rsASC_PRINT, rsASC_VIEW, rsASC_OPTIONS );
  SRCRights: array[1..7] of string =
             ( rsSRC_SUMMARY, rsSRC_DETAIL, rsSRC_ARCHIVEPROD,
               rsSRC_DISTPROD, rsSRC_SUMMPROCESS, rsSRC_AUDITTRAIL,
               rsSRC_IMPORTPROCESSLIST );}
var
  GrpAccNode: TTreeNode;
  btI, btNext: Byte;
begin
 { with fmNewGroup.tvAccesses.Items do
  begin
    Clear;
    GrpAccNode := Add(nil, rsMDL_UMC);
      GrpAccNode.StateIndex := 1;
    for btI:=1 to High(UMCRights) do
      AddChild(GrpAccNode, IntToSTr(btI) + '. ' + UMCRights[btI]);
    btNext := High(UMCRights);

    GrpAccNode := Add(nil, rsMDL_DMC);
      GrpAccNode.StateIndex := 1;
    for btI:=1 to High(DMCRights) do
      AddChild(GrpAccNode, IntToSTr(btI + btNext) + '. ' + DMCRights[btI]);
    btNext := btNext + High(DMCRights);

    GrpAccNode := Add(nil, rsMDL_IVC);
      GrpAccNode.StateIndex := 1;
    for btI:=1 to High(IVCRights) do
      AddChild(GrpAccNode, IntToSTr(btI + btNext) + '. ' + IVCRights[btI]);
    btNext := btNext + High(IVCRights);

    GrpAccNode := Add(nil, rsMDL_DIC);
      GrpAccNode.StateIndex := 1;
    for btI:=1 to High(DICRights) do
      AddChild(GrpAccNode, IntToSTr(btI + btNext) + '. ' + DICRights[btI]);
    btNext := btNext + High(DICRights);

    GrpAccNode := Add(nil, rsMDL_CCC);
      GrpAccNode.StateIndex := 1;
    for btI := 1 to High(CCCRights) do
      AddChild(GrpAccNode, IntToSTr(btI + btNext) + '. ' + CCCRights[btI]);
    btNext := btNext + High(CCCRights);

    GrpAccNode := Add(nil, rsMDL_ASC);
      GrpAccNode.StateIndex := 1;
    for btI := 1 to High(ASCRights) do
      AddChild(GrpAccNode, IntToSTr(btI + btNext) + '. ' + ASCRights[btI]);
    btNext := btNext + High(ASCRights);

    GrpAccNode := Add(nil, rsMDL_SRC);
      GrpAccNode.StateIndex := 1;
    for btI := 1 to High(SRCRights) do
      AddChild(GrpAccNode, IntToSTr(btI + btNext) + '. ' + SRCRights[btI]);
    btNext := btNext + High(SRCRights);

    GrpAccNode := Add(nil, rsMDL_PCC);
      GrpAccNode.StateIndex := 1;
    btI := 1;
    AddChild(GrpAccNode, IntToSTr(btI + btNext) + '. ' + rsPCC_OPTIONS);

    GrpAccNode := GetFirstNode;
    while GrpAccNode<>nil do
    begin
       if GrpAccNode.StateIndex=-1 then
        GrpAccNode.StateIndex := 7
      else if GrpAccNode.StateIndex=1 then
        GrpAccNode.StateIndex := -1;
      GrpAccNode := GrpAccNode.GetNext;
    end;
  end;}
end;

procedure TfrmMainUser.SetRights(Level, Index: Integer);
begin
  acNewUser.Enabled := ((Level=0) or (Level=1)) and (index=0)
    and (cekMyRights(UMC_NEWUSER));
  acManageUser.Enabled := (Level=1) and (Index=0) and
    (cekMyRights(UMC_MANAGEUSER)) and (lvMain.Selected<>Nil);
  acRemoveUser.Enabled := (Level=1) and (Index=0) and
    (cekMyRights(UMC_REMOVEUSER)) and (lvMain.Selected<>Nil);
  acNewGroup.Enabled := ((Level=0) or (Level=1)) and (Index=1) and
    (cekMyRights(UMC_NEWGROUP));
  acManageGroup.Enabled := (Level=1) and (Index=1) and
    (cekMyRights(UMC_MANAGEGROUP)) and (lvMain.Selected<>Nil);
  acRemoveGroup.Enabled := (Level=1) and (Index=1) and
    (cekMyRights(UMC_REMOVEGROUP)) and (lvMain.Selected<>Nil);

  acUserList.Enabled  := ((Level=0) or (Level=1)) and (Index=0);
  acGroupList.Enabled := ((Level=0) or (Level=1)) and (Index=1);
{  acUserAccessRights.Enabled := (Level=1) and (Index=0) and
    (lvMain.Selected<>nil);}
  acGroupRights.Enabled := (Level=1) and (Index=1) and
    (lvMain.Selected<>nil);
{  acGrpMbrList.Enabled  := (Level=1) and (Index=1) and
    (UMC_GROUPMEMBERLIST in SetOfRights);}
end;

procedure TfrmMainUser.lvMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DELETE then
  begin
    if (tvMain.Selected.Level=1) and (lvMain.Selected<>nil) then
    begin
      if (tvMain.Selected.Index=0) and (acRemoveUser.Enabled)then
        acRemoveUserExecute(Self)
      else if (tvMain.Selected.Index=1) and (acRemoveGroup.Enabled) then
        acRemoveGroupExecute(Self);
    end;
  end;
end;

procedure TfrmMainUser.lvMainKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    lvMainDblClick(Sender);
end;

procedure TfrmMainUser.lvMainSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Selected then
  begin
    FitemSelected := Item;
    FitemIdx := Item.Index;
  end
  else
    FitemSelected := nil;
end;

procedure TfrmMainUser.acRemoveUserExecute(Sender: TObject);
var
  intI: Integer;
  strUserRemove, strUserEdit: string;
  boActive: Boolean;
begin
  strUserRemove := lvMain.Selected.Caption;
  if MessageDlg(Format(rsConfirmRemove, [rsTxtUser, strUserRemove]),
    mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    begin
    if LowerCase(FUserName)<>LowerCase(lvMain.Selected.Caption) then
    begin
      if lvMain.Selected.SubItems.Strings[2]<>rsStatusDeleteFlag then
      begin
        intI := ruleFlagRemoveUser(strUserRemove, FUserName);
        case intI of
          VR_OK:
            begin
              ruleSaveLog(FUserName, MDL_UMC, 'Flag hapus user : ' + strUserRemove);
              frmMainUser.acRefresh.Execute;
              MessageDlg(Format(rsFlagRemoved, [rsTxtUser, strUserRemove]),
                mtInformation, [mbOK], 0);
            end;
          VR_FAILED:
            begin
              MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
            end;
          else begin
            MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
          end;
        end;
      end
      else begin
        if ruleGetUserDataForDelete(strUserRemove, boActive, strUserEdit)=VR_OK then
        begin
          if strUSerEdit=FUserName then
          begin
             MessageDlg('User ''' + FUserName + ''' sebelumnya telah melakukan flag hapus pada user ''' +
               strUserRemove + '''.' + #13#10 +
              'Untuk menghapus secara permanent harus dilakukan penghapusan sekali lagi oleh user lain yang berwenang.',
               mtInformation, [mBOK], 0);
          end
          else begin
            intI := ruleRemoveUser(strUserRemove);
            case intI of
              VR_OK:
                begin
                  ruleSaveLog(FUserName, MDL_UMC, 'Hapus user : ' + strUserRemove);
                  frmMainUser.acRefresh.Execute;
                  MessageDlg(Format(rsRemoved, [rsTxtUser, strUserRemove]),
                    mtInformation, [mbOK], 0);
                end;
              VR_FAILED:
                begin
                  MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
                end;
              else
                MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
            end;
          end;
        end;
      end;
    end
    else begin
      MessageDlg(Format(rsCannotRemoveSelf, [FUserName]), mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmMainUser.acRemoveGroupExecute(Sender: TObject);
var
  intI: Integer;
  strGroupRemove: string;
  boMemberOf: Boolean;
  btStatus: Byte;
  strCreateUser, strEditUser, strValidateUser: string;
begin
  strGroupRemove := lvMain.Selected.Caption;
  if MessageDlg(Format(rsConfirmRemove, [rsTxtGroup, strGroupRemove]),
    mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
    //if status grup is flag delete
    if lvMain.Selected.SubItems.Strings[1]=rsStatusDeleteFlag then
    begin
      // Cek user yang terakhir melakukan delete.
      if ruleGetGroupData(strGroupRemove, btStatus, strCreateUser, strEditUser,
        strValidateUser)=VR_OK then
      begin
        if strEditUSer=FUserName then
        begin
          MessageDlg('User ''' + FUserName + ''' sebelumnya telah melakukan flag hapus pada grup ''' +
            strGroupRemove + '''.' + #13#10 +
            'Untuk menghapus secara permanent harus dilakukan penghapusan sekali lagi oleh user lain yang berwenang.',
            mtInformation, [mBOK], 0);
        end
        else begin
          boMemberOf := False;
          intI := ruleIsUserMemberOfGroup(FUserName, strGroupRemove, boMemberOf);
          case intI of
            VR_OK:
              begin
                if not boMemberOf then
                begin
                  intI := ruleRemoveGroup(strGroupRemove);
                  case intI of
                    VR_OK:
                      begin
                        ruleSaveLog(FUserName, MDL_UMC, 'Hapus grup : ' + strGroupRemove);
                        frmMainUser.acRefresh.Execute;
                        MessageDlg(Format(rsRemoved, [rsTxtGroup, strGroupRemove]),
                          mtInformation, [mbOK], 0);
                      end;
                    VR_GROUP_EXISTS:
                      begin
                        MessageDlg(rsUsersExistInGroup, mtInformation, [mbOK], 0);
                      end;
                    VR_FAILED:
                      begin
                        MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
                      end;
                    else begin
                      MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
                    end;
                  end;
                end
                else begin
                  MessageDlg(rsUsersExistInGroup, mtInformation, [mbOK], 0);
                end;
              end;
            VR_FAILED:
              begin
                MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
              end
            else begin
              MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
            end;
          end;
        end;
      end;
    end
    else begin
      // if group staatus is not flag delete
      boMemberOf := False;
      intI := ruleIsUserMemberOfGroup(FUserName, strGroupRemove, boMemberOf);
      case intI of
        VR_OK:
          begin
            if not boMemberOf then
            begin
              intI := ruleFlagDeleteGroup(strGroupRemove, FUserName);
              case intI of
                VR_OK:
                  begin
                    ruleSaveLog(FUserName, MDL_UMC, 'Flag hapus grup : ' + strGroupRemove);
                    frmMainUser.acRefresh.Execute;
                    MessageDlg(Format(rsRemoved, [rsTxtGroup, strGroupRemove]),
                      mtInformation, [mbOK], 0);
                  end;
                VR_GROUP_EXISTS:
                  begin
                    MessageDlg(rsUsersExistInGroup, mtInformation, [mbOK], 0);
                  end;
                VR_FAILED:
                  begin
                    MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
                  end;
                else begin
                  MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
                end;
              end;
            end
            else begin
              MessageDlg(rsUsersExistInGroup, mtInformation, [mbOK], 0);
            end;
          end;
        VR_FAILED:
          begin
            MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
          end
        else begin
          MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
        end;
      end;
    end;
  end;
end;

procedure TfrmMainUser.pmListPopup(Sender: TObject);
var
  tempMenu: TMenuItem;
  Node: TTreeNode;
begin
  pmList.Items.Clear;
  Node := tvMain.Selected;

  if (Node.Level + Node.Index)=0 then
  begin
    if lvMain.Selected<>nil then
    begin
      if FItemIdx=0 then begin
        tempMenu := TMenuItem.Create(pmList);
        tempMenu.Action := acNewUser;
        pmList.Items.Add(tempMenu);

        tempMenu := NewLine;
        pmList.Items.Add(tempMenu);

        tempMenu := TMenuItem.Create(pmList);
        tempMenu.Action := acUserList;
        pmList.Items.Add(tempMenu);

        tempMenu := TMenuItem.Create(pmList);
        tempMenu.Action := acUserAudit;
        pmList.Items.Add(tempMenu);

        tempMenu := NewLine;
        pmList.Items.Add(tempMenu);

        tempMenu:=TMenuItem.Create(pmList);
        tempMenu.Action:=acRefresh;
        pmList.Items.Add(tempMenu);
      end
      else if FItemIdx=1 then
      begin
        tempMenu := TMenuItem.Create(pmList);
        tempMenu.Action := acNewGroup;
        pmList.Items.Add(tempMenu);

        tempMenu := NewLine;
        pmList.Items.Add(tempMenu);

        tempMenu := TMenuItem.Create(pmList);
        tempMenu.Action := acGroupList;
        pmList.Items.Add(tempMenu);

        tempMenu := TMenuItem.Create(pmList);
        tempMenu.Action := acUserAudit;
        pmList.Items.Add(tempMenu);

        tempMenu := NewLine;
        pmList.Items.Add(tempMenu);

        tempMenu:=TMenuItem.Create(pmList);
        tempMenu.Action := acRefresh;
        pmList.Items.Add(tempMenu);
      end;
    end;
  end
  else if (Node.Level + Node.Index)=1 then
  begin
    if tvMain.Selected<>nil then begin
      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acNewUser;
      pmList.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acManageUser;
      pmList.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acRemoveUser;
      pmList.Items.Add(tempMenu);

      tempMenu := NewLine;
      pmList.Items.Add(tempMenu);

{      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acSetPassword;
      pmList.Items.Add(tempMenu);}

      tempMenu := NewLine;
      pmList.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acUserList;
      pmList.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acUserAudit;
      pmList.Items.Add(tempMenu);

{      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acUserAccessRights;
      pmList.Items.Add(tempMenu);}

      tempMenu := NewLine;
      pmList.Items.Add(tempMenu);

      tempMenu:=TMenuItem.Create(pmList);
      tempMenu.Action:=acRefresh;
      pmList.Items.Add(tempMenu);
    end;
  end
  else if (Node.Level + Node.Index)=2 then
  begin
    if tvMain.Selected<>nil then begin
      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acNewGroup;
      pmList.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acManageGroup;
      pmList.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acRemoveGroup;
      pmList.Items.Add(tempMenu);

      tempMenu := NewLine;
      pmList.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acGroupList;
      pmList.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acUserAudit;
      pmList.Items.Add(tempMenu);

      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acGroupRights;
      pmList.Items.Add(tempMenu);

{      tempMenu := TMenuItem.Create(pmList);
      tempMenu.Action := acGrpMbrList;
      pmList.Items.Add(tempMenu);}

      tempMenu := NewLine;
      pmList.Items.Add(tempMenu);

      tempMenu:=TMenuItem.Create(pmList);
      tempMenu.Action:=acRefresh;
      pmList.Items.Add(tempMenu);
    end;
  end;
end;

procedure TfrmMainUser.acManageUserExecute(Sender: TObject);
begin
  with fmManageUser do
  begin
    edName.Text   := lvMain.Selected.Caption;
    edFullName.Text  := lvMain.Selected.SubItems.Strings[1];
    //edDesc.Text   := lvMain.Selected.SubItems.Strings[2];
  end;
  if fmManageUser.ShowModal=mrOK then
    acRefresh.Execute;
end;

procedure TfrmMainUser.acNewUserExecute(Sender: TObject);
begin
  if fmNewUser.ShowModal=mrOK then
    acRefresh.Execute;
end;

procedure TfrmMainUser.acManageGroupExecute(Sender: TObject);
begin
  fmNewGroup.Tag := MANAGE_GROUP;
  fmNewGroup.edGroupName.Text := lvMain.Selected.Caption;
  fmNewGroup.edDesc.Text := lvMain.Selected.SubItems.Strings[0];
  if fmNewGroup.ShowModal=mrOK then
    acRefresh.Execute;
end;

function TfrmMainUser.CekMyRights(intValue: Integer): Boolean;
var
  intI: Integer;
begin
  Result := False;
  for intI := 0 to High(FmyRights) do
  begin
    if intValue=FmyRights[intI] then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TfrmMainUser.FormResize(Sender: TObject);
begin
  sbMain.Panels[0].Width := sbMain.Width - sbMain.Panels[1].Width-sbMain.Panels[2].Width;
end;

procedure TfrmMainUser.sbMainDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with sbMain.Canvas do
  begin
    imageList1.Draw(sbMain.Canvas, Rect.Left+2, Rect.Top+1, 1);
    TextOut(Rect.Left + 20, Rect.Top+2, FUserName);
  end;
end;

procedure TfrmMainUser.acUserListExecute(Sender: TObject);
begin
(*
  if CallUMCUserList(Application.Handle, ADOQryRule.Connection, FUserName)=VR_FAILED then
   MessageDlg(Format(rsErrAccessModuleFailed, ['umcreports.dll']), mtError,
     [mbOK], 0);
*)
end;

procedure TfrmMainUser.acGroupListExecute(Sender: TObject);
begin
(*
  if CallUMCGroupList(Application.Handle, ADOQryRule.Connection, FUserName)=VR_FAILED then
   MessageDlg(Format(rsErrAccessModuleFailed, ['umcreports.dll']), mtError,
     [mbOK], 0);
*)
end;

procedure TfrmMainUser.acUserRightsExecute(Sender: TObject);
begin
//
end;

procedure TfrmMainUser.acGroupRightsExecute(Sender: TObject);
begin
(*
  if CallUMCGroupAccessRight(Application.Handle, ADOQryRule.Connection, FUserName,
   lvMain.Selected.Caption)=VR_FAILED then
       MessageDlg(Format(rsErrAccessModuleFailed, ['umcreports.dll']), mtError, [mbOK], 0);
*)
end;

procedure TfrmMainUser.acUserAuditExecute(Sender: TObject);
begin
(*
  if CallUMCUserAudit(Application.Handle, ADOQryRule.Connection, FUserName)=VR_FAILED then
   MessageDlg(Format(rsErrAccessModuleFailed, ['umcreports.dll']), mtError,
     [mbOK], 0);
*)
end;

end.
