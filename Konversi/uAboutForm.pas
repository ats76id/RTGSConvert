(*******************************************************************************
   Unit name   : FAboutFrm.pas
   Version     : 1.0
   Author      : Abdul Latief Yukkas
   Purpose     : Form general untuk menampilkan window 'About'.
   Comment     : Unit ini digunakan untuk menampilkan window 'About'.
                 Aplikasi cukup memanggil ShowAboutWindow (AppName, AppVersion)
                 untuk menampilkan window About.
                 Contoh:
                 ShowAboutWindow ('My First App', 'Version 1.00 Build: 990112');
   Date created: 990112 8:50:47 AM
	Last update : 990112
   Copyright ©   1999 by Abdul Latief Yukkas

   History     :
*******************************************************************************)
unit uAboutForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, ComCtrls, LMDScrollText, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDGraphicControl;

type
  TAboutForm = class(TForm)
    Version             : TLabel;
    PhysicalMemory: TLabel;
    PhysicalMemoryAvail: TLabel;
    MemoryUtilization: TLabel;
    Image2: TImage;
    Timer1: TTimer;
    Image1: TImage;
	 procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    DelayTime : Integer;
    bDisp : Boolean;
  public
    { Public declarations }
  end;

  //Public routines
function ShowAboutWindow(AppName: string; AppVersion: string): Word;

////////////////////////////////////////////////////////////////////////////////
implementation

{$R *.DFM}

uses uMisc;

function ShowAboutWindow(AppName: string; AppVersion: string): Word;
var
  AboutForm : TAboutForm;
begin
  AboutForm := TAboutForm.Create(Application);
  try
	 AboutForm.Version.Caption := AppVersion;
	 Result := AboutForm.ShowModal;
  finally
    AboutForm.Free;
  end;
end;

procedure TAboutForm.FormShow(Sender: TObject);
var
  MemStatus : TMemoryStatus;
begin
  DelayTime := 75;
  GetMemoryStatus(MemStatus);
  PhysicalMemory.Caption := FormatFloat('#,##0;(N/A)', MemStatus.dwTotalPhys div 1024) + ' KB';
  PhysicalMemoryAvail.Caption := FormatFloat('#,##0;(N/A)', MemStatus.dwAvailPhys div 1024) + ' KB';
  MemoryUtilization.Caption := Format('%d%%',[MemStatus.dwMemoryLoad]);
end;


procedure TAboutForm.Image2Click(Sender: TObject);
begin
   Close;
end;

procedure TAboutForm.Timer1Timer(Sender: TObject);
begin
   if bDisp then Exit;
   Timer1.Enabled := False;
   bDisp := True;
   Timer1.Enabled := True;
end;

end.

