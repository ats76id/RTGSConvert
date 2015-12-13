unit fIRegionAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, JvExStdCtrls, JvEdit,
  JvValidateEdit, ExtCtrls, AdvPanel, LMDCustomComponent,
  LMDWndProcComponent, LMDFormShadow, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmRegionAdd = class(TForm)
    AdvPanel1: TAdvPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    edtNamaWilayah: TEdit;
    edtSandiWilayah: TJvValidateEdit;
    AdvGlowButton1: TcxButton;
    AdvGlowButton2: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegionAdd: TfrmRegionAdd;

implementation

uses fGlobalVar;

{$R *.dfm}

procedure TfrmRegionAdd.FormShow(Sender: TObject);
begin
	case Self.Tag of
  	1:
    	begin
      	edtSandiWilayah.Enabled := True;
        edtSandiWilayah.SetFocus;
      end;
  	2:
    	begin
      	edtSandiWilayah.Enabled := False;
        edtNamaWilayah.SetFocus;
      end;
  end;
end;

procedure TfrmRegionAdd.AdvGlowButton1Click(Sender: TObject);
begin
	ModalResult := mrOK;
end;

procedure TfrmRegionAdd.AdvGlowButton2Click(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

end.
