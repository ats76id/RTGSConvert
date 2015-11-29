unit fusrimport;

interface

uses ADODB, fConst;

procedure usrInit(adocConn: TADOConnection; vstrDataSource, vstrDBMain, vstrDBUser,
  vstrInitialDBTrx, vstrDBUserName, vstrDBPassword, vstrusrRegKey: string); external 'usrlib.dll';
function usrLoadDBConfiguration: Integer; external 'usrlib.dll';
function usrCheckTask: Integer; external 'usrlib.dll';
function usrLogWrite(strUserName: string; intModule: Integer; strActivity: string): Integer; external 'usrlib.dll';
function usrUserAccessList(strUser: string; intModule: Integer): Integer; external 'usrlib.dll';
procedure usrUserModuleAccess(strUser: string); external 'usrlib.dll';
function usrCheckRights(intValue: Integer): Boolean; external 'usrlib.dll';
function usrRegKey: string; external 'usrlib.dll';
function usrDataSource: string; external 'usrlib.dll';
function usrDBMain: string; external 'usrlib.dll';
function usrDBUser: string; external 'usrlib.dll';
function usrDBIntialTrx: string; external 'usrlib.dll';
function usrDBUsername: string; external 'usrlib.dll';
function usrDBPassword: string; external 'usrlib.dll';
function usrMinPassLength: Integer; external 'usrlib.dll';
function usrMaxPassLength: Integer; external 'usrlib.dll';
function usrMinUserLength: Integer; external 'usrlib.dll';
function usrMaxUserLength: Integer; external 'usrlib.dll';
function usrPasswordExpire: Integer; external 'usrlib.dll';
function usrPasswordHistory: Integer; external 'usrlib.dll';
function usrNamaWilKliring: string; external 'usrlib.dll';
function usrPresentWorkDate: TDateTime; external 'usrlib.dll';
function usrPrevWorkDate: TDateTime; external 'usrlib.dll';
function usrNextWorkDate: TDateTime; external 'usrlib.dll';
function usrProcessStatus: Integer; external 'usrlib.dll';
function usrSysStatus: Integer; external 'usrlib.dll';
function usrActiveWilKliring: string; external 'usrlib.dll';
function usrCommandTimeOut: Integer; external 'usrlib.dll';
function usrDBLocation: string; external 'usrlib.dll';
function usrProccessFee: Currency; external 'usrlib.dll';
function usrPocketFee: Currency; external 'usrlib.dll';
function usrRejectFee: Currency; external 'usrlib.dll';
function usrParaTempAccNo: string; external 'usrlib.dll';
function usrParaFeeIncomeAccNo: string; external 'usrlib.dll';
function usrParaFeeIncomeRejAccNo: string; external 'usrlib.dll';
function usrParaPostUnitCode: string; external 'usrlib.dll';
function usrParaClearingPostCode: string; external 'usrlib.dll';
function usrParaClearingTrnCode: string; external 'usrlib.dll';
function usrParaFeePostCode: string; external 'usrlib.dll';
function usrParaFeeTrnCode: string; external 'usrlib.dll';
function usrFTPAddress1: string; external 'usrlib.dll';
function usrFTPUser1: string; external 'usrlib.dll';
function usrFTPPassword1: string; external 'usrlib.dll';
function usrFTPAddress2: string; external 'usrlib.dll';
function usrFTPUser2: string; external 'usrlib.dll';
function usrFTPPassword2: string; external 'usrlib.dll';
function usrFTPAddress3: string; external 'usrlib.dll';
function usrFTPUser3: string; external 'usrlib.dll';
function usrFTPPassword3: string; external 'usrlib.dll';
function usrWinSharedFolder1: string; external 'usrlib.dll';
function usrWinSharedFolder2: string; external 'usrlib.dll';
function usrWinSharedFolder3: string; external 'usrlib.dll';
function usrWinSharedFolder4: string; external 'usrlib.dll';
function usrWinSharedFolder5: string; external 'usrlib.dll';
function usrWinSharedFolder6: string; external 'usrlib.dll';
function usrWinSharedFolder7: string; external 'usrlib.dll';
function usrWinSharedFolder8: string; external 'usrlib.dll';
function usrWinSharedFolder9: string; external 'usrlib.dll';
function usrLoadDataDone: Byte; external 'usrlib.dll';
function usrBackupUserDone: Byte; external 'usrlib.dll';
function usrBackupMainDone: Byte; external 'usrlib.dll';
function usrBackupTrxDone: Byte; external 'usrlib.dll';
function usrRekapDataDone: Byte; external 'usrlib.dll';
function usrFIImportTableDimensiDone: Byte; external 'usrlib.dll';
function usrFIEksporCLSEMUADone: Byte; external 'usrlib.dll';
function usrFIEksporTrxBSKDone: Byte; external 'usrlib.dll';
function usrFIEksporTrxFeeProcessDone: Byte; external 'usrlib.dll';
function usrFIEksporTrxFeeRejectDone: Byte; external 'usrlib.dll';
function usrFIEksporSortPatternDone: Byte; external 'usrlib.dll';
function usrFIEksporSandiBankDone: Byte; external 'usrlib.dll';
function usrReport1Done: Byte; external 'usrlib.dll';
function usrReport2Done: Byte; external 'usrlib.dll';
function usrReport3Done: Byte; external 'usrlib.dll';
function usrReport4Done: Byte; external 'usrlib.dll';
function usrReport5Done: Byte; external 'usrlib.dll';
function usrReport6Done: Byte; external 'usrlib.dll';
function usrReport7Done: Byte; external 'usrlib.dll';
function usrReport8Done: Byte; external 'usrlib.dll';
function usrReport9Done: Byte; external 'usrlib.dll';
function usrReport10Done: Byte; external 'usrlib.dll';
function encUser(strUser: string): string; external 'usrlib.dll';
function encGroup(strGroup: string): string; external 'usrlib.dll';
function encByKey(strBuf, strKey: string): string; external 'usrlib.dll';
function decUser(strUser: string): string; external 'usrlib.dll';
function decGroup(strGroup: string): string; external 'usrlib.dll';
function decByKey(strBuf, strKey: string): string; external 'usrlib.dll';
function usrStartingPocket:Integer; external 'usrlib.dll';

implementation

end.





