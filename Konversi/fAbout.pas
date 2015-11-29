unit fAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinManager, sSkinProvider, sLabel, StdCtrls, sScrollBox,
  sFrameBar, sButton, ExtCtrls;

const
	CP = 'Atma Suwanda';

type
  TForm1 = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sSkinManager1: TsSkinManager;
    slblHeader: TsLabelFX;
    sButton1: TsButton;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DateUtils;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
	if YearOf(Now) = 2013 then
  	slblHeader.Caption := 'CopyRight @2013, ' + CP + #13#10'ats76id@gmail.com'
  else
		slblHeader.Caption := 'CopyRight @2013-' + IntToStr(YearOf(Now)) + ', ' + 
      CP + #13#10'ats76id@gmail.com';
end;

procedure TForm1.sButton1Click(Sender: TObject);
begin
	Close;
end;

end.
