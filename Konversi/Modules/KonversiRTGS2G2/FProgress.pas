unit FProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, XPMan;

type
  Tpf = class(TForm)
    pl1: TLabel;
    pl: TLabel;
    Progress: TProgressBar;
    lblStatus: TLabel;
    XPManifest1: TXPManifest;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pf: Tpf;

implementation

{$R *.DFM}

end.






