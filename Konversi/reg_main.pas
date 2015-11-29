unit reg_main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, AdvGroupBox, ExtCtrls, AdvPanel, Buttons, XPMan;

type
  TregMain = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    AdvGroupBox1: TAdvGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    edtSerial: TEdit;
    Memo1: TMemo;
    edtRelease: TEdit;
    btnGeneralEdit: TBitBtn;
    btnSave: TBitBtn;
    XPManifest1: TXPManifest;
    procedure Memo1Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function SetReg(ApplicationHandle:THandle):boolean; external 'siklib.dll';


var
  regMain: TregMain;

implementation

uses
  uni_RegCommon, fMain;

{$R *.DFM}

procedure TregMain.FormActivate(Sender: TObject);
begin
  //edtMachine.Text := format('%d',[MachineModifier]);
end;

procedure TregMain.Memo1Enter(Sender: TObject);
begin
  edtSerial.SetFocus;
end;

procedure TregMain.btnSaveClick(Sender: TObject);
var
  SerialNum : longint;
  dtExpire:TDateTime;
begin
  // Validate the serial number
  try
    SerialNum := StrToInt(edtSerial.Text);
  except
    MessageDlg('Invalid Serial Number.  Please check your entry and try again.', mtError, [mbOK], 0);
    edtSerial.SetFocus;
    edtSerial.SelectAll;
    exit;
  end;

  // Validate the release code
  if not IsReleaseCodeValid (edtRelease.Text, SerialNum, dtExpire) then begin
    MessageDlg('Invalid Release Code.  Please check your entry and try again.', mtError, [mbOK], 0);
    edtRelease.SetFocus;
    edtRelease.Text := '';
    exit;
  end else begin
    MessageDlg('Registration complete.', mtInformation, [mbOK], 0);
    SetApplicationPath(frmMain.FApplicationPath);
    SaveRegistrationInformation(edtRelease.Text, SerialNum);
    SetReg(Application.Handle);
    ModalResult:=mrOK;
  end;
end;

procedure TregMain.btnGeneralEditClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

end.
