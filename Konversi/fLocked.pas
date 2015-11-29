unit fLocked;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, StdCtrls, XPMan;

type
  TfrmLocked = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    lbUserID: TLabel;
    Label2: TLabel;
    edPassword: TEdit;
    Image1: TImage;
    XPManifest1: TXPManifest;
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocked: TfrmLocked;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmLocked.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Close;
end;

procedure TfrmLocked.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := frmMain.UserPassword=edPassword.Text;
  if not CanClose then
  begin
    Application.MessageBox('Password salah ........ !',PChar(Application.Title), MB_ICONWARNING + MB_OK + MB_TOPMOST);
    edPassword.SetFocus;
  end;

end;

end.
