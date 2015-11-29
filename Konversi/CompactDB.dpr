program CompactDB;

uses
  Forms,
  fMainCompact in 'fMainCompact.pas' {frmMainCompact};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Compact And Repair Database';
  Application.CreateForm(TfrmMainCompact, frmMainCompact);
  Application.Run;
end.
