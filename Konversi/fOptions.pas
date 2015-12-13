unit fOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, LMDCustomComponent,
  LMDWndProcComponent, LMDFormShadow, AdvOfficePager,
  AdvPanel, Buttons, AdvOfficePagerStylers, LMDCustomControl,
  LMDCustomPanel, LMDButtonControl, LMDCustomCheckBox, LMDCheckBox, XPMan,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons;

type
  EGeneral = class(Exception);
  TfmOptions = class(TForm)
    AdvPanel1: TAdvPanel;
    pageControl1: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    AdvOfficePager12: TAdvOfficePage;
    lblDays: TLabel;
    lblMinPass: TLabel;
    LblMaxPass: TLabel;
    lblCharMin: TLabel;
    lblCharMax: TLabel;
    Bevel2: TBevel;
    lblExpire: TLabel;
    Image1: TImage;
    lblDescPass: TLabel;
    Label1: TLabel;
    edExpire: TEdit;
    edMinPass: TEdit;
    edMaxPass: TEdit;
    upExpire: TUpDown;
    upMinPass: TUpDown;
    upMaxPass: TUpDown;
    edPassHistory: TEdit;
    upPassHistory: TUpDown;
    lblMinUser: TLabel;
    lblMaxUser: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    Bevel1: TBevel;
    lblDescUser: TLabel;
    edMinName: TEdit;
    edMaxName: TEdit;
    upMinName: TUpDown;
    upMaxName: TUpDown;
    LMDFormShadow1: TLMDFormShadow;
    pgcStyler: TAdvOfficePagerOfficeStyler;
    AdvOfficePage1: TAdvOfficePage;
    cbUseMaxLogon: TLMDCheckBox;
    XPManifest1: TXPManifest;
    bnSave: TcxButton;
    bnBatal: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure upMinPassChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure upMaxPassChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure upMinNameChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure upMaxNameChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure bnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetParamSpecs;
    function UpdateSpecs: Integer;
  public
    { Public declarations }
  end;

var
  fmOptions: TfmOptions;

implementation

{$R *.dfm}

uses fUMCConst, fUtils, fConst, fRules, fUserLib, fUserMain;

procedure TfmOptions.FormShow(Sender: TObject);
begin
  upMinName.OnChangingEx := nil;
  upMaxName.OnChangingEx := nil;
  upMinPass.OnChangingEx := nil;
  upMaxPass.OnChangingEx := nil;
  GetParamSpecs;
  upMinName.OnChangingEx := upMinNameChangingEx;
  upMaxName.OnChangingEx := upMaxNameChangingEx;
  upMinPass.OnChangingEx := upMinPassChangingEx;
  upMaxPass.OnChangingEx := upMaxPassChangingEx;
  PageControl1.ActivePageIndex := 0;
  edExpire.SetFocus;
end;

procedure TfmOptions.GetParamSpecs;
begin
  upExpire.Position  := frmUserLib.usrPasswordExpire;

  upMaxPass.Position := frmUserLib.usrMaxPassLength;
  upMinPass.Position := frmUserLib.usrMinPassLength;

  upMaxName.Position := frmUserLib.usrMaxUserLength;
  upMinName.Position := frmUserLib.usrMinUserLength;

  upPassHistory.Position := frmUserLib.usrPasswordHistory;

  cbUseMaxLogon.Checked := frmUserLib.usrUseMaxLogon;
end;

procedure TfmOptions.upMinPassChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  AllowChange := NewValue<=(StrToInt(edMaxPass.Text));
end;

procedure TfmOptions.upMaxPassChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  AllowChange := NewValue>=(StrToInt(edMinPass.Text));
end;

procedure TfmOptions.upMinNameChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  AllowChange := NewValue<=(StrToInt(edMaxName.Text));
end;

procedure TfmOptions.upMaxNameChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  AllowChange := NewValue>=(StrToInt(edMinName.Text));
end;

procedure TfmOptions.bnSaveClick(Sender: TObject);
var
  intI: Integer;
  strTempMin, strTempMax, strActDetil: string;
begin
  if (StrToInt(edMinName.Text)>FIXED_USERNAME_MAXLENGTH) or
    (StrToInt(edMinName.Text)>StrToInt(edMaxName.Text)) then
  begin
    strTempMin := CleanString(lblMinUser.Caption, ['&', ':']);
    strTempMax := CleanString(lblMaxUser.Caption, ['&', ':']);
    PageControl1.ActivePageIndex := 1;
    edMinName.SetFocus;
    raise EGeneral.Create(Format(rsMinLessThan, [strTempMin, strTempMax,
      FIXED_USERNAME_MAXLENGTH]));
  end;
  if (StrToInt(edMaxName.Text)>FIXED_USERNAME_MAXLENGTH) then begin
    strTempMax := CleanString(lblMaxUser.Caption, ['&', ':']);
    PageControl1.ActivePageIndex := 1;
    edMaxName.SetFocus;
    raise EGeneral.Create(Format(rsMaxLessThan, [strTempMax, FIXED_USERNAME_MAXLENGTH]));
  end;
  if (StrToInt(edMinPass.Text)>FIXED_USERNAME_MAXLENGTH) or
    (StrToInt(edMinPass.Text)>StrToInt(edMaxPass.Text)) then begin
    strTempMin := CleanString(lblMinPass.Caption, ['&', ':']);
    strTempMax := CleanString(lblMaxPass.Caption, ['&', ':']);
    PageControl1.ActivePageIndex := 0;
    edMinPass.SetFocus;
    raise EGeneral.Create(Format(rsMinLessThan, [strTempMin, strTempMax,
      FIXED_USERNAME_MAXLENGTH]));
  end;
  if StrToInt(edMaxPass.Text)>FIXED_USERNAME_MAXLENGTH then begin
    strTempMax := CleanString(lblMaxPass.Caption, ['&', ':']);
    PageControl1.ActivePageIndex := 0;
    edMaxPass.SetFocus;
    raise EGeneral.Create(Format(rsMaxLessThan, [strTempMax, FIXED_USERNAME_MAXLENGTH]));
  end;

  if ((StrToInt(edMinName.Text)=0) or (StrToInt(edMaxName.Text)=0)) then begin
    PageControl1.ActivePageIndex := 1;
    edMinName.SetFocus;
    raise EGeneral.Create(rsUserNameCannotBeZeroLength);
  end;
  strActDetil := 'Pass: ' + rsLogTxtExpire + '=' + edExpire.Text + ' Min=' + edMinPass.Text +
    ' Max=' + edMaxPass.Text + '. ' + rsTxtUser + ': Min=' + edMinName.Text + ' Max=' + edMaxName.Text;

  intI := UpdateSpecs;
  case intI of
    VR_OK:
      begin
        frmUserLib.usrLoadDBConfiguration;
        ruleSaveLog(frmMainUser.UserName, MDL_UMC, strActDetil);
        MessageDlg(rsInfoDataSaved, mtInformation, [mBOK], 0);
        ModalResult := mrOK;
      end;
    VR_FAILED:
      begin
        MessageDlg(Format(rsErrAccessModuleFailed, ['rules']) + ' ' +
          rsDataNotSaved, mtError, [mbOk], 0);
      end;
    else begin
      MessageDlg(Format(rsErrUnknownResult, [intI]), mtInformation, [mBOK], 0);
    end;
  end;
end;

function TfmOptions.UpdateSpecs: Integer;
var
  strTemp: string;
begin
  Result := VR_FAILED;
  if ruleUpdateSpec(PARA_PASSWORD_EXPIRE, edExpire.Text)=VR_FAILED then
    Exit;
  if ruleUpdateSpec(PARA_MIN_USER_LENGTH, edMinName.Text)=VR_FAILED then
    Exit;
  if ruleUpdateSpec(PARA_MAX_USER_LENGTH, edMaxName.Text)=VR_FAILED then
    Exit;
  if ruleUpdateSpec(PARA_MIN_PASS_LENGTH, edMinPass.Text)=VR_FAILED then
    Exit;
  if ruleUpdateSpec(PARA_MAX_PASS_LENGTH, edMaxPass.Text)=VR_FAILED then
    Exit;
  if ruleUpdateSpec(PARA_PASSWORD_HISTORY, edPassHistory.Text)=VR_FAILED then
    Exit;

  if cbUseMaxLogon.Checked then
  	strTemp := '1'
  else
  	strTemp := '0';

	if ruleUpdateSpec(PARA_USE_MAX_LOGON, strTemp)=VR_FAILED then
    Exit;

  Result := VR_OK;
end;


end.
