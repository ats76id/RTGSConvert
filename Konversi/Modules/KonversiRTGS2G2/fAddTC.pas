unit fAddTC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomComponent, LMDWndProcComponent, LMDFormShadow,
  StdCtrls, Buttons, JvExStdCtrls, JvEdit, JvValidateEdit, ExtCtrls,
  AdvPanel, XPMan, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons;

type
  TfrmAddTC = class(TForm)
    AdvPanel1: TAdvPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    edtTCBaru: TEdit;
    LMDFormShadow1: TLMDFormShadow;
    edtTCLama: TEdit;
    XPManifest1: TXPManifest;
    AdvGlowButton1: TcxButton;
    AdvGlowButton2: TcxButton;
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
    function GetTCBaru: String;
    function GetTCLama: String;
    procedure SetTCBaru(const Value: String);
    procedure SetTCLama(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property TCLama:String read GetTCLama write SetTCLama;
    property TCBaru:String read GetTCBaru write SetTCBaru;
  end;

var
  frmAddTC: TfrmAddTC;

implementation

{$R *.dfm}

{ TfrmAddTC }

function TfrmAddTC.GetTCBaru: String;
begin
	Result := Trim(edtTCBaru.Text);
end;

function TfrmAddTC.GetTCLama: String;
begin
	Result := Trim(edtTCLama.Text);
end;

procedure TfrmAddTC.SetTCBaru(const Value: String);
begin
	edtTCBaru.Text := Value;
end;

procedure TfrmAddTC.SetTCLama(const Value: String);
begin
	edtTCLama.Text := Value;
end;

procedure TfrmAddTC.AdvGlowButton1Click(Sender: TObject);
begin
	ModalResult := mrOk;
end;

procedure TfrmAddTC.AdvGlowButton2Click(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

end.
