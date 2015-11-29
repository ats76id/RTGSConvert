unit fapokimport;

interface

uses ADODB, fConst;

procedure apokInit(adocConn: TADOConnection; vstrDataSource, vstrDBMain, vstrDBUser,
  vstrInitialDBTrx, vstrDBUserName, vstrDBPassword, vstrAPOKRegKey: string); external 'apok32.dll';
function apokLoadDBConfiguration: Integer; external 'apok32.dll';
function apokCheckTask: Integer; external 'apok32.dll';
function apokLogWrite(strUserName: string; intModule: Integer; strActivity: string): Integer; external 'apok32.dll';
function apokUserAccessList(strUser: string; intModule: Integer): Integer; external 'apok32.dll';
procedure apokUserModuleAccess(strUser: string); external 'apok32.dll';
function apokCheckRights(intValue: Integer): Boolean; external 'apok32.dll';
function apokRegKey: string; external 'apok32.dll';
function apokDataSource: string; external 'apok32.dll';
function apokDBMain: string; external 'apok32.dll';
function apokDBUser: string; external 'apok32.dll';
function apokDBIntialTrx: string; external 'apok32.dll';
function apokDBUsername: string; external 'apok32.dll';
function apokDBPassword: string; external 'apok32.dll';
function apokMinPassLength: Integer; external 'apok32.dll';
function apokMaxPassLength: Integer; external 'apok32.dll';
function apokMinUserLength: Integer; external 'apok32.dll';
function apokMaxUserLength: Integer; external 'apok32.dll';
function apokPasswordExpire: Integer; external 'apok32.dll';
function apokPasswordHistory: Integer; external 'apok32.dll';
function apokNamaWilKliring: string; external 'apok32.dll';
function apokPresentWorkDate: TDateTime; external 'apok32.dll';
function apokPrevWorkDate: TDateTime; external 'apok32.dll';
function apokNextWorkDate: TDateTime; external 'apok32.dll';
function apokProcessStatus: Integer; external 'apok32.dll';
function apokSysStatus: Integer; external 'apok32.dll';
function apokActiveWilKliring: string; external 'apok32.dll';
function apokCommandTimeOut: Integer; external 'apok32.dll';
function apokDBLocation: string; external 'apok32.dll';
function apokProccessFee: Currency; external 'apok32.dll';
function apokPocketFee: Currency; external 'apok32.dll';
function apokRejectFee: Currency; external 'apok32.dll';
function apokParaTempAccNo: string; external 'apok32.dll';
function apokParaFeeIncomeAccNo: string; external 'apok32.dll';
function apokParaFeeIncomeRejAccNo: string; external 'apok32.dll';
function apokParaPostUnitCode: string; external 'apok32.dll';
function apokParaClearingPostCode: string; external 'apok32.dll';
function apokParaClearingTrnCode: string; external 'apok32.dll';
function apokParaFeePostCode: string; external 'apok32.dll';
function apokParaFeeTrnCode: string; external 'apok32.dll';
function apokFTPAddress1: string; external 'apok32.dll';
function apokFTPUser1: string; external 'apok32.dll';
function apokFTPPassword1: string; external 'apok32.dll';
function apokFTPAddress2: string; external 'apok32.dll';
function apokFTPUser2: string; external 'apok32.dll';
function apokFTPPassword2: string; external 'apok32.dll';
function apokFTPAddress3: string; external 'apok32.dll';
function apokFTPUser3: string; external 'apok32.dll';
function apokFTPPassword3: string; external 'apok32.dll';
function apokWinSharedFolder1: string; external 'apok32.dll';
function apokWinSharedFolder2: string; external 'apok32.dll';
function apokWinSharedFolder3: string; external 'apok32.dll';
function apokWinSharedFolder4: string; external 'apok32.dll';
function apokWinSharedFolder5: string; external 'apok32.dll';
function apokWinSharedFolder6: string; external 'apok32.dll';
function apokWinSharedFolder7: string; external 'apok32.dll';
function apokWinSharedFolder8: string; external 'apok32.dll';
function apokWinSharedFolder9: string; external 'apok32.dll';
function apokLoadDataDone: Byte; external 'apok32.dll';
function apokBackupUserDone: Byte; external 'apok32.dll';
function apokBackupMainDone: Byte; external 'apok32.dll';
function apokBackupTrxDone: Byte; external 'apok32.dll';
function apokRekapDataDone: Byte; external 'apok32.dll';
function apokFIImportTableDimensiDone: Byte; external 'apok32.dll';
function apokFIEksporCLSEMUADone: Byte; external 'apok32.dll';
function apokFIEksporTrxBSKDone: Byte; external 'apok32.dll';
function apokFIEksporTrxFeeProcessDone: Byte; external 'apok32.dll';
function apokFIEksporTrxFeeRejectDone: Byte; external 'apok32.dll';
function apokFIEksporSortPatternDone: Byte; external 'apok32.dll';
function apokFIEksporSandiBankDone: Byte; external 'apok32.dll';
function apokReport1Done: Byte; external 'apok32.dll';
function apokReport2Done: Byte; external 'apok32.dll';
function apokReport3Done: Byte; external 'apok32.dll';
function apokReport4Done: Byte; external 'apok32.dll';
function apokReport5Done: Byte; external 'apok32.dll';
function apokReport6Done: Byte; external 'apok32.dll';
function apokReport7Done: Byte; external 'apok32.dll';
function apokReport8Done: Byte; external 'apok32.dll';
function apokReport9Done: Byte; external 'apok32.dll';
function apokReport10Done: Byte; external 'apok32.dll';
function encUser(strUser: string): string; external 'apok32.dll';
function encGroup(strGroup: string): string; external 'apok32.dll';
function encByKey(strBuf, strKey: string): string; external 'apok32.dll';
function decUser(strUser: string): string; external 'apok32.dll';
function decGroup(strGroup: string): string; external 'apok32.dll';
function decByKey(strBuf, strKey: string): string; external 'apok32.dll';
function apokStartingPocket:Integer; external 'apok32.dll';

implementation

end.





