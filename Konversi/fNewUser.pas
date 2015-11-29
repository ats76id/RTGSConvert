unit fNewUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AdvPanel, LMDCustomComponent,
  LMDWndProcComponent, LMDFormShadow, Buttons, XPMan;

type
  TfmNewUser = class(TForm)
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    edGroup: TLabel;
    edName: TEdit;
    edFullName: TEdit;
    cbGroup: TComboBox;
    LMDFormShadow1: TLMDFormShadow;
    bnCreate: TBitBtn;
    bnCancel: TBitBtn;
    XPManifest1: TXPManifest;
    procedure bnCreateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edFullNameChange(Sender: TObject);
  private
    { Private declarations }
    FPassMinLength: Byte;
    FUserMinLength: Byte;
    procedure SetEnableCreate;
    procedure SetEditClear;
    procedure GetParamSpecs;
    procedure FillUserList;
  public
    { Public declarations }
  end;

var
  fmNewUser: TfmNewUser;

implementation

{$R *.dfm}

uses
  fUMCConst, fConst, fUtils, fRules, fUserLib, fUserMain;

procedure TfmNewUser.bnCreateClick(Sender: TObject);
var
  tempFName, tempDesc: string;
  intI: Integer;
begin
  if Length(Trim(edName.Text))<FUserMinLength then
  begin
    edName.SetFocus;
    MessageDlg(Format(rsUserNameTooShort, [FUserMinLength]), mtInformation, [mbOK], 0);
  end
  else begin
    if not CheckString(edName.Text) then begin
      edName.SetFocus;
      MessageDlg(rsUserNameInvalid, mtInformation, [mbOK], 0);
    end
    else begin
{      if edPass.Text<>edCfmPass.Text then begin
        edPass.SetFocus;
        MessageDlg(rsPasswordNotMatch, mtError, [mbOk], 0);
      end
      else begin
        if Length(edPass.Text)<FPassMinLength then begin
          MessageDlg(Format(rsPasswordTooShort, [FPassMinLength]), mtError, [mbOk], 0);
        end
        else begin}
          if LowerCase(edName.Text)<>LowerCase(frmMainUser.UserName) then
          begin
            tempFName := CleanString(Trim(edFullName.Text), [';', '''']);
            //tempDesc := CleanString(Trim(edDesc.Text), [';', '''']);
            //tempEmpNo := CleanString(Trim(edEmpNo.Text), [';', '''']);
            intI := ruleCreateUser(edName.Text, tempFName, 'password', cbGroup.text,
              frmMainUser.UserName);
            case intI of
              VR_FAILED:
                begin
                  MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
                end;
              VR_USER_EXISTS:
                begin
                  MessageDlg(Format(rsUserExists, [edName.Text]), mtInformation, [mBOK], 0);
                end;
              VR_OK:
                begin
                  ruleSaveLog(frmMainUser.UserName, MDL_UMC, 'Buat user baru : ' + edName.Text);
                  MessageDlg(rsInfoDataSaved, mtInformation, [mBOK], 0);
                  modalResult := mrOK;
                end;
              else begin
                MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
              end;
            end;
          end
          else begin
            MessageDlg(Format(rsUserExists, [edName.Text]), mtInformation, [mBOK], 0);
          end;
        end;
      end;
    //end;
  //end;
end;

procedure TfmNewUser.FillUserList;
var
  tempList: TStringList;
begin
  tempList := TStringList.Create;
  cbGroup.Items.Clear;
  try
    if ruleGetListGroupValidated(tempList)=VR_OK then
    begin
      //while tempList.Count>0 do begin
        cbGroup.Items.AddStrings(tempList);
        cbGroup.ItemIndex := 0;
        //tempList.Delete(0);
      //end;
    end
    else begin
      MessageDlg(Format(rsErrAccessModuleFailed, ['rules']), mtError, [mbOk], 0);
    end;
  finally
    tempList.Free;
  end;
end;

procedure TfmNewUser.FormShow(Sender: TObject);
begin
  bnCreate.Enabled := False;
  SetEditClear;
  GetParamSpecs;
  FillUserList;
  edName.SetFocus;
end;

procedure TfmNewUser.GetParamSpecs;
begin
   edName.MaxLength := frmUserLib.usrMaxUserLength;
   FUserMinLength := frmUserLib.usrMinUserLength;
end;

procedure TfmNewUser.SetEditClear;
begin
  edName.Clear;
  edFullName.Clear;
  edName.Tag := 0;
  edFullName.Tag := 0;
end;

procedure TfmNewUser.SetEnableCreate;
begin
  bnCreate.Enabled := (edName.Tag=1) and (edFullName.Tag=1);
end;

procedure TfmNewUser.edFullNameChange(Sender: TObject);
begin
  if Trim((Sender as TEdit).Text)='' then
    (Sender as TEdit).Tag := 0
  else
    (Sender as TEdit).Tag := 1;
{  if Sender=edName then begin
    edPass.Text := edName.Text;
    edCfmPass.Text := edName.Text;
  end;}
  SetEnableCreate;

end;

end.
