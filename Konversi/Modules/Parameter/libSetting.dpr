library libSetting;

uses
  //Sharemem,
  uSetting in 'uSetting.pas',
  fGlobalVar in '..\..\shared\fGlobalVar.pas' {GlobalVarForm},
  fGlobalVarDM in '..\..\shared\fGlobalVarDM.pas' {GlobalVarDM: TDataModule},
  futils in '..\..\shared\futils.pas',
  fConst in '..\..\shared\fConst.pas',
  fUserLib in '..\..\shared\fUserLib.pas' {frmUserLib},
  fKonfigurasi in 'fKonfigurasi.pas' {frmKonfigurasi},
  fIRegionAdd in 'fIRegionAdd.pas' {frmRegionAdd},
  fIRegionMain in 'fIRegionMain.pas' {frmRegionMain},
  fIBranchAdd in 'fIBranchAdd.pas' {frmiBranchAdd},
  fIBranchMain in 'fIBranchMain.pas' {frmiBranchMain},
  fISubBranchAdd in 'fISubBranchAdd.pas' {frmISubBranchAdd},
  fISubBranchMain in 'fISubBranchMain.pas' {frmISubBranchMain},
  fImportTbTPK in 'fImportTbTPK.pas' {frmImportDBTPK},
  fSOD in 'fSOD.pas' {frmSOD};

{$R *.res}

exports
  CallSysParam,
  CallRegionParam,
  CallBranchParam,
  CallSubBranchParam,
  CallImportDBTPK,
  CallSOD;
end.

