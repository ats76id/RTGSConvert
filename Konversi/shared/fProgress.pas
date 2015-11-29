unit fProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvProgressBar;

type
  TfrmProgress = class(TForm)
    pb1: TAdvProgressBar;
    pb2: TAdvProgressBar;
    lblDesc: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

procedure TfrmProgress.FormShow(Sender: TObject);
begin
	if pb2.Visible then
  	Self.Height := 110
  else
  	Self.Height := 90;
end;

end.
