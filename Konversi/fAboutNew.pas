unit fAboutNew;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, AdvGlowButton, AdvPanel;

type
  TAboutBox = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    btnGeneralEdit: TAdvGlowButton;
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Bevel1: TBevel;
    PhysicalMemory: TLabel;
    PhysicalMemoryAvail: TLabel;
    MemoryUtilization: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses fMain;

{$R *.dfm}

function GetMemoryStatus(var MemoryStatus: TMemoryStatus): Boolean;
(*
  Uses: Windows.pas
  The GlobalMemoryStatus call returns additional Information
  in the MemoryStatus structure as shown below.
   typedef struct _MEMORYSTATUS { // mst
     DWord dwLength; // sizeof(MEMORYSTATUS)
     DWord dwMemoryLoad; // percent of memory in use
     DWord dwTotalPhys; // bytes of physical memory
     DWord dwAvailPhys; // free physical memory bytes
     DWord dwTotalPageFile; // bytes of paging file
     DWord dwAvailPageFile; // free bytes of paging file
     DWord dwTotalVirtual; // user bytes of address space
     DWord dwAvailVirtual; // free user bytes
   } MEMORYSTATUS, *LPMEMORYSTATUS;
  *)
begin
  MemoryStatus.dwLength := SizeOf(MemoryStatus);
  GlobalMemoryStatus(MemoryStatus);
  Result := True;
end;

procedure TAboutBox.FormShow(Sender: TObject);
var
  MemStatus : TMemoryStatus;
begin
 if frmMain.CheckRegister(False) then
 	Version.Caption := 'Version ' + APP_VERSION + ' - Registered'
 else
 	Version.Caption := 'Version ' + APP_VERSION + ' - Unregistered';

  GetMemoryStatus(MemStatus);
  PhysicalMemory.Caption := FormatFloat('#,##0;(N/A)', MemStatus.dwTotalPhys div 1024) + ' KB';
  PhysicalMemoryAvail.Caption := FormatFloat('#,##0;(N/A)', MemStatus.dwAvailPhys div 1024) + ' KB';
  MemoryUtilization.Caption := Format('%d%%',[MemStatus.dwMemoryLoad]);
end;

end.
 
