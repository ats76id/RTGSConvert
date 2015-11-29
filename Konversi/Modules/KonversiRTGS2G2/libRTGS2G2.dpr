library libRTGS2G2;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  fMainRTGS2G2 in 'fMainRTGS2G2.pas' {frmMain},
  uRTGS2G2 in 'uRTGS2G2.pas',
  fMainDM in 'fMainDM.pas' {MainDM: TDataModule},
  fGlobalVar in '..\..\shared\fGlobalVar.pas' {GlobalVarForm},
  fGlobalVarDM in '..\..\shared\fGlobalVarDM.pas' {GlobalVarDM: TDataModule},
  futils in '..\..\shared\futils.pas',
  fUserLib in '..\..\shared\fUserLib.pas' {frmUserLib},
  uni_RegCommon in '..\..\shared\uni_RegCommon.pas',
  fConst in '..\..\shared\fConst.pas',
  FProgress in 'FProgress.pas' {pf},
  fParamRTGS in 'fParamRTGS.pas' {frmParamRTGSConvert},
  fAddTC in 'fAddTC.pas' {frmAddTC},
  fLaporanPerProses in 'fLaporanPerProses.pas' {frmLaporanPerProses},
  fLaporanKonversiDetail in 'fLaporanKonversiDetail.pas' {frmLaporanKonversiDetail},
  fCari in 'fCari.pas' {frmCari};

{$R *.res}


exports
  CallConvRTGS2G2,
  CallConvParam,
  CallRptPerProsesFile,
  CallRptKonversiSKN,
  CallRptKonversiREMM,
  CallCariData;

begin
end.
