unit fSiklus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, AdvSpin, AdvGroupBox,
  AdvOfficeButtons;

type
  TOpSiklusForm = class(TForm)
    btnOK: TBitBtn;
    rgPeriode: TAdvOfficeRadioGroup;
    spePeriode: TAdvSpinEdit;
    btnCancel: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure rgPeriodeClick(Sender: TObject);
    procedure spePeriodeChange(Sender: TObject);
  private
    { Private declarations }
    FSiklus : Integer;
    //procedure SetSiklus;
  public
    { Public declarations }
    property Siklus:Integer read FSiklus write FSiklus;
    procedure SetTitle(value:String);
  end;

var
  OpSiklusForm: TOpSiklusForm;

implementation

{$R *.dfm}

procedure TOpSiklusForm.SetTitle(value:String);
begin
  OpSiklusForm.Caption := value;
end;

{procedure TOpSiklusForm.SetSiklus;
begin
	case rgSiklus.ItemIndex of
  	0 : FSiklus := 1;
    1 : FSiklus := 2;
    else FSiklus := 1;
  end;
end;
}
procedure TOpSiklusForm.btnOKClick(Sender: TObject);
begin
  case rgPeriode.ItemIndex of
    1: FSiklus := spePeriode.Value;
  	else
    	FSiklus := 0;
  end;

	ModalResult := mrOk;
end;

procedure TOpSiklusForm.Button1Click(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TOpSiklusForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
(*
	If ModalResult = mrOK then
  	CanClose := True
  else
  	CanClose := False;
*)  
end;

procedure TOpSiklusForm.FormShow(Sender: TObject);
begin
	rgPeriode.ItemIndex := 0;
  spePeriode.Enabled := rgPeriode.ItemIndex = 1;
end;

procedure TOpSiklusForm.btnCancelClick(Sender: TObject);
begin
  FSiklus := 0;
	ModalResult := mrCancel;
end;

procedure TOpSiklusForm.rgPeriodeClick(Sender: TObject);
begin
	if rgPeriode.ItemIndex = 1 then
  begin
  	spePeriode.Enabled := True;
    FSiklus := spePeriode.Value;
    spePeriode.SetFocus;
  end
  else begin
  	FSiklus := 0;
  	spePeriode.Enabled := False;
  end;
end;

procedure TOpSiklusForm.spePeriodeChange(Sender: TObject);
begin
	FSiklus := spePeriode.Value;
end;

end.
