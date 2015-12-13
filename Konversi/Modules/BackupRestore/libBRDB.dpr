library libBRDB;

uses
  //Sharemem,
  uBRDB in 'uBRDB.pas',
  fGlobalVar in '..\..\shared\fGlobalVar.pas' {GlobalVarForm},
  fGlobalVarDM in '..\..\shared\fGlobalVarDM.pas' {GlobalVarDM: TDataModule},
  futils in '..\..\shared\futils.pas',
  fConst in '..\..\shared\fConst.pas',
  fUserLib in '..\..\shared\fUserLib.pas' {frmUserLib},
  fBackup in 'fBackup.pas' {frmBackup},
  fRestore in 'fRestore.pas' {frmRestore};

{$R *.res}

exports
  CallBackupDB,
  CallRestoreDB;
end.

