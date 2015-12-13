library libSOD;

uses
  Sharemem,
  uSOD in 'uSOD.pas',
  fSOD in 'fSOD.pas' {frmSOD},
  fGlobalVar in '..\..\shared\fGlobalVar.pas' {GlobalVarForm},
  fGlobalVarDM in '..\..\shared\fGlobalVarDM.pas' {GlobalVarDM: TDataModule},
  futils in '..\..\shared\futils.pas',
  fConst in '..\..\shared\fConst.pas',
  fUserLib in '..\..\shared\fUserLib.pas' {frmUserLib};

{$R *.res}

exports
  CallSOD;
end.

