unit fGlobalVar;

(*
  Remark : Khusus BCA.
           Fiture: Tidak pake registri lagi
*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, JvAppStorage, JvAppXMLStorage,
  JvAppRegistryStorage, JvComponentBase, JvAppDBStorage, HCMngr,   JvSimpleXml,
  ImgList;

type
  TGlobalVarForm = class(TForm)
    JvAppDBStorage1: TJvAppDBStorage;
    JvAppRegistryStorage1: TJvAppXMLFileStorage;
    cmCipher: TCipherManager;
    listGlobalImage: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    FLogPath,
    FProfileRegistryKey,
    FApplicationRegistryKey   : String;
    FCipher                   : TCipherManager;
    FCipher2                  : TCipherManager;
    FApplicationDataPath: string;
    function GetBankAccountBranch: string;
    function GetBankActiveBranch: string;
    function GetBankCentreBranch: string;
    function GetBankCode: string;
    function GetBankCPCBranch: string;
    function GetBankName: string;
    function GetBankShortName: string;
    function GetContinueEODIfFail: Boolean;
    function GetContinueSODIfFail: Boolean;
    function GetContinueAuthorizeIfFail: Boolean;
    function GetDBBackupFolder: string;
    function GetDBConnectionString: string;
    function GetDBDailyDBName: string;
    function GetDBDataFolder: string;
    function GetDBDataSource: string;
    function GetDBMainDBName: string;
    function GetDBParams: string;
    function GetDBPassword: string;
    function GetDBProvider: string;
    function GetDBSharedBackupFolder: string;
    function GetDBTrxLifeCycle: Integer;
    function GetDBType: Integer;
    function GetDBUserDBName: string;
    function GetDBUsername: string;
    function GetDownloadFilename: string;
    function GetDownloadSourcePath(Index: Integer): string;
    function GetDownloadSourcePathCount: Integer;
    function GetHostInterfaceAutoConvert: Integer;
    function GetHostInterfaceAutoConvertDelay: Integer;
    function GetHostInterfaceAutoResult: Integer;
    function GetHostInterfaceAutoResultDelay: Integer;
    function GetHostInterfaceButtonViewLog: Integer;
    function GetHostInterfaceDownloadVisible: Integer;
    function GetHostInterfaceName: string;
    function GetHostInterfaceShowMessage: Integer;
    function GetHostInterfaceUploadVisible: Integer;
    function GetLoadDLLOnEOD: Integer;
    function GetLoadDLLOnSOD: Integer;
    function GetLoadDLLOnAuthorize: Integer;
    function GetMaxAmountPerBatch: Currency;
    function GetMaxItemPerBatch: Integer;
    function GetSystemLastDay: TDate;
    function GetSystemNextDay: TDate;
    function GetSystemPowerEncode: Boolean;
    function GetSystemStatus: Integer;
    function GetSystemToday: TDate;
    function GetTPKConnectionString: string;
    function GetTPKDBType: string;
    function GetTPKRootFolder: string;
    function GetTPKVersion : Integer;

    procedure SetBankAccountBranch(const Value: string);
    procedure SetBankActiveBranch(const Value: string);
    procedure SetBankCentreBranch(const Value: string);
    procedure SetBankCode(const Value: string);
    procedure SetBankCPCBranch(const Value: string);
    procedure SetBankName(const Value: string);
    procedure SetBankShortName(const Value: string);
    procedure SetContinueEODIfFail(const Value: boolean);
    procedure SetContinueSODIfFail(const Value: boolean);
    procedure SetContinueAuthorizeIfFail(const Value: boolean);
    procedure SetDBBackupFolder(const Value: string);
    procedure SetDBConnectionString(const Value: string);
    procedure SetDBDailyDBName(const Value: string);
    procedure SetDBDataFolder(const Value: string);
    procedure SetDBDataSource(const Value: string);
    procedure SetDBMainDBName(const Value: string);
    procedure SetDBParams(const Value: string);
    procedure SetDBPassword(const Value: string);
    procedure SetDBProvider(const Value: string);
    procedure SetDBSharedBackupFolder(const Value: string);
    procedure SetDBTrxLifeCycle(const Value: Integer);
    procedure SetDBType(const Value: Integer);
    procedure SetDBUserDBName(const Value: string);
    procedure SetDBUsername(const Value: string);
    procedure SetDownloadFilename(const Value: string);
    procedure SetDownloadSourcePath(Index: Integer; const Value: string);
    procedure SetDownloadSourcePathCount(const Value: Integer);
    procedure SetHostInterfaceAutoConvert(const Value: Integer);
    procedure SetHostInterfaceAutoConvertDelay(const Value: Integer);
    procedure SetHostInterfaceAutoResult(const Value: Integer);
    procedure SetHostInterfaceAutoResultDelay(const Value: Integer);
    procedure SetHostInterfaceButtonViewLog(const Value: Integer);
    procedure SetHostInterfaceDownloadVisible(const Value: Integer);
    procedure SetHostInterfaceName(const Value: string);
    procedure SetHostInterfacetShowMessage(const Value: Integer);
    procedure SetHostInterfaceUploadVisible(const Value: Integer);
    procedure SetMaxAmountPerBatch(const Value: Currency);
    procedure SetMaxItemPerBatch(const Value: Integer);
    procedure SetLoadDLLOnEOD(const Value: Integer);
    procedure SetLoadDLLOnSOD(const Value: Integer);
    procedure SetLoadDLLOnAuthorize(const Value: Integer);
    procedure SetSystemLastDay(const Value: TDate);
    procedure SetSystemNextDay(const Value: TDate);
    procedure SetSystemPowerEncode(const Value: Boolean);
    procedure SetSystemStatus(const Value: Integer);
    procedure SetSystemToday(const Value: TDate);
    procedure SetTPKConnectionString(const Value: string);
    procedure SetTPKDBType(const Value: string);
    procedure SetTPKRootFolder(const Value: string);
    procedure SetTPKVersion (const Value : Integer); // 8 Dec 2005

    function GetTableToTextDir: String;
    procedure SetTableToTextDir(const Value: String);
    function GetDBDailyInwardDBName: string;
    function GetSystemInwardStatus: Integer;
    function GetSystemInwardToday: TDate;
    procedure SetDBDailyInwardDBName(const Value: string);
    procedure SetSystemInwardStatus(const Value: Integer);
    procedure SetSystemInwardToday(const Value: TDate);
    function GetSystemDefaultPostingCode: string;
    procedure SetSystemDefaultPostingCode(const Value: string);
    function GetSystemVerifyUsergroup: string;
    procedure SetSystemVerifyUsergroup(const Value: string);
    function GetSystemInwardEnabled: boolean;
    function GetSystemOutwardEnabled: boolean;
    function GetSystemPrintCreditNotes: boolean;
    function GetSystemReturnEnabled: boolean;
    procedure SetSystemInwardEnabled(const Value: boolean);
    procedure SetSystemOutwardEnabled(const Value: boolean);
    procedure SetSystemPrintCreditNotes(const Value: boolean);
    procedure SetSystemReturnEnabled(const Value: boolean);
    procedure SetDownloadAutoBatch(const Value: Boolean);
    procedure SetDownloadHostActive(const Value: Boolean);
    function GetDownloadAutoBatch: Boolean;
    function GetDownloadHostActive: Boolean;
    function GetSystemStatusHostInterface: Integer;
    procedure SetSystemStatusHostInterface(const Value: Integer);
    function GetSystemChno: Integer;
    procedure SetSystemChno(const Value: Integer);
    function GetSystemHostInterfaceDate: string;
    procedure SetSystemHostIntefaceDate(const Value: string);
    function GetHostAddress: string;
    function GetHostDirectClose: Boolean;
    function GetHostFilename: string;
    function GetHostLocalFilename: string;
    function GetHostPassword: string;
    function GetHostProgram: string;
    function GetHostProgramFailedString: string;
    function GetHostProgramSuccessString: string;
    function GetHostUserName: string;
    procedure SetHostAddress(const Value: string);
    procedure SetHostDirectClose(const Value: Boolean);
    procedure SetHostFilename(const Value: string);
    procedure SetHostLocalFilename(const Value: string);
    procedure SetHostPassword(const Value: string);
    procedure SetHostProgram(const Value: string);
    procedure SetHostProgramFailedString(const Value: string);
    procedure SetHostProgramSuccessString(const Value: string);
    procedure SetHostUserName(const Value: string);
    function GetAuthGroupCetakUlang: string;
    function GetAuthGroupEditBatch: string;
    function GetAuthGroupParaBatch: string;
    function GetControlCNCetakBeritaAcara: Boolean;
    function GetControlCNEditControl: Integer;
    function GetControlCNSatKerPTR: string;
    function GetControlCNViewBeritaAcaraApprove: Boolean;
    function GetControlCNViewBeritaAcaraControl: Boolean;
    procedure SetAuthGroupCetakUlang(const Value: string);
    procedure SetAuthGroupEditBatch(const Value: string);
    procedure SetAuthGroupParaBatch(const Value: string);
    procedure SetControlCNCetakBeritaAcara(const Value: Boolean);
    procedure SetControlCNEditControl(const Value: Integer);
    procedure SetControlCNSatKerPTR(const Value: string);
    procedure SetControlCNViewBeritaAcaraApprove(const Value: Boolean);
    procedure SetControlCNViewBeritaAcaraControl(const Value: Boolean);
    function GetFieldSizeAccountNo: Integer;
    function GetFieldSizeCustName: Integer;
    function GetFieldSizeOPAccountNo: Integer;
    function GetFieldSizeOPCustName: Integer;
    function GetFieldSizeReferenceNo: Integer;
    procedure SetFieldSizeAccountNo(const Value: Integer);
    procedure SetFieldSizeCustName(const Value: Integer);
    procedure SetFieldSizeOPAccountNo(const Value: Integer);
    procedure SetFieldSizeOPCustName(const Value: Integer);
    procedure SetFieldSizeReferenceNo(const Value: Integer);
    function GetControlCNLembarBeritaAcara: Integer;
    procedure SetControlCNLembarBeritaAcara(const Value: Integer);
    function GetMaxAmountRTGS: Currency;
    procedure SetMaxAmountRTGS(const Value: Currency);
    function GetSystemReportLength: Integer;
    procedure SetSystemReportLength(const Value: Integer);
    function GetControlCNReferenceNoVisible: Boolean;
    function GetControlCNSatKerSystem: string;
    procedure SetControlCNReferenceNoVisible(const Value: Boolean);
    procedure SetControlCNSatKerSystem(const Value: string);
    function GetDownloadCRCChecked: Boolean;
    procedure SetDownloadCRCChecked(const Value: Boolean);
    function GetDownloadStringCekList: string;
    procedure SetDownloadStringCekList(const Value: string);
    function GetDownloadAltFilename: string;
    function GetDownloadAltSourcePath(Index: Integer): string;
    function GetDownloadAltSourcePathCount: Integer;
    procedure SetDownloadAltFilename(const Value: string);
    procedure SetDownloadAltSourcePath(Index: Integer;
      const Value: string);
    procedure SetDownloadAltSourcePathCount(const Value: Integer);
    function GetUploadTargetFilename: string;
    function GetUploadTargetPath: string;
    procedure SetUploadTargetFilename(const Value: string);
    procedure SetUploadTargetPath(const Value: string);
    function GetIBankNameLength: Integer;
    procedure SetIBankNameLength(const Value: Integer);
    function GetSODTransferTables: Integer;
    procedure SetSODTransferTables(const Value: Integer);
    function GetSystemDebitEditableField: string;
    procedure SetSystemDebitEditableField(const Value: string);
    function GetSystemCreditEditableField: string;
    procedure SetSystemCreditEditableField(const Value: string);
    function GetPrinterTellstrook: string;
    procedure SetPrinterTellStrook(const Value: string);
    function GetSystemAuthorizeAllEnabled: Boolean;
    procedure SetSystemAuthorizeAllEnabled(const Value: Boolean);
    function GetTPKBatchPerTransfer: Integer;
    procedure SetTPKBatchPerTransfer(const Value: Integer);
    function GetDownloadTargetPath(Index: Integer): string;
    function GetDownloadTargetPathCount: Integer;
    procedure SetDownloadTargetPath(Index: Integer; const Value: string);
    procedure SetDownloadTargetPathCount(const Value: Integer);
    function GetTPKTextFileName(Index: Integer): string;
    procedure SetTPKTextFileName(Index: Integer; const Value: string);
    function getACKCheckFlag: string;
    procedure setACKCheckFlag(const Value: string);
    function GetSystemReportSignee: string;
    procedure SetSystemReportSignee(const Value: string);
    function GetSystemBackupDataSuffix: string;
    function GetSystemBackupLogSuffix: string;
    procedure SetBackupDataSuffix(const Value: string);
    procedure SetBackupLogSuffix(const Value: string);
    function GetDownloadAlt2Filename: string;
    procedure SetDownloadAlt2Filename(const Value: string);
    function GetDownloadAlt2SourcePath(Index: Integer): string;
    procedure SetDownloadAlt2SourcePath(Index: Integer;
      const Value: string);
    function GetDownloadAlt2SourcePathCount: Integer;
    procedure SetDownloadAlt2SourcePathCount(const Value: Integer);
    function GetBICreditFee : Double;
    procedure SetBICreditFee(value : Double);
    function GetBIDebitFee : Double;
    procedure SetBIDebitFee(value : Double);
    function GetCPCCreditFee : Double;
    procedure SetCPCCreditFee(value :Double);
    function GetCPCDebitFee : Double;
    procedure SetCPCDebitFee(value : Double);
    function GetDownloadSourceFileName(Index: Integer): string;
    procedure SetDownloadSourceFileName(Index: Integer;
      const Value: string);
    function GetDownloadAltSourceFileName(Index: Integer): string;
    procedure SetDownloadAltSourceFileName(Index: Integer;
      const Value: string);
    function GetUploadDBCancelRejectBatch: Boolean;
    function GetUploadDBUpdateInSSKStatus: Boolean;
    function GetUploadDBUpdateInTPKStatus: Boolean;
    function GetUploadDBUpdateRejectBatch: Boolean;
    procedure SetUploadDBCancelRejectBatch(const Value: Boolean);
    procedure SetUploadDBUpdateInSSKStatus(const Value: Boolean);
    procedure SetUploadDBUpdateInTPKStatus(const Value: Boolean);
    procedure SetUploadDBUpdateRejectBatch(const Value: Boolean);
    function GetUploadRTCancelRejectBatch: Boolean;
    function GetUploadRTUpdateInSSKStatus: Boolean;
    function GetUploadRTUpdateInTPKStatus: Boolean;
    function GetUploadRTUpdateRejectBatch: Boolean;
    procedure SetUploadRTCancelRejectBatch(const Value: Boolean);
    procedure SetUploadRTUpdateInSSKStatus(const Value: Boolean);
    procedure SetUploadRTUpdateInTPKStatus(const Value: Boolean);
    procedure SetUploadRTUpdateRejectBatch(const Value: Boolean);
    function GetCommInboxPath: string;
    function GetCommOutboxPath: string;
    procedure SetCommInboxPath(const Value: string);
    procedure SetCommOutboxPath(const Value: string);
    function GetACKOutwardCallFunction: String;
    function GetACKOutwardCreditCallFunction: String;
    function GetACKOutwardDebitCallFunction: String;
    function GetACKOutwardDllName: String;
    function GetACKOutwardEnabled: Integer;
    function GetACKReturnDllName: String;
    function GetACKReturnEnabled: Integer;
    procedure SetACKOutwardCallFunction(const Value: String);
    procedure SetACKOutwardCreditCallFunction(const Value: String);
    procedure SetACKOutwardDebitCallFunction(const Value: String);
    procedure SetACKOutwardDllName(const Value: String);
    procedure SetACKOutwardEnabled(const Value: Integer);
    procedure SetACKReturnDllName(const Value: String);
    procedure SetACKReturnEnabled(const Value: Integer);
    function GetACKReturnCallFunction: String;
    procedure SetACKReturnCallFunction(const Value: String);
    function GetAEOfflineVisible: Boolean;
    function GetAESendACKCreditVisible: Boolean;
    function GetAESendACKDebitVisible: Boolean;
    procedure SetAEOfflineVisible(const Value: Boolean);
    procedure SetAESendACKCreditVisible(const Value: Boolean);
    procedure SetAESendACKDebitVisible(const Value: Boolean);
    procedure SetMaxAuthorizedAmountDBPerItem(const Value: Currency);
    function GetMaxAuthorizedAmountDBPerItem: Currency;
    function GetDownloadHostFTPQuote: Boolean;
    procedure SetDownloadHostFTPQuote(const Value: Boolean);
    function BuildText(ASource: string):string;
    function GetDownloadHostTelnetActive: Boolean;
    procedure SetDownloadHostTelnetActive(const Value: Boolean);
    function GetTransferHistoryBackwardDays: Integer;
    function GetTransferHistoryOption: Integer;
    procedure SetTransferHistoryBackwardDays(const Value: Integer);
    procedure SetTransferHistoryOption(const Value: Integer);
    function GetFileEncryptionKey: string;
    procedure SetFileEncryptionKey(const Value: string);
    function GetFileDecryptEnabled: Boolean;
    procedure SetFileDecryptEnabled(const Value: Boolean);
    function GetDataSnapFileManagerPort: Integer;
    procedure SetDataSnapFileManagerPort(const Value: Integer);
    function GetSystemAuthorizeUsergroup: string;
    procedure SetSystemAuthorizeUsergroup(const Value: string);
    function GetInwardFileDecryptEnabled: Boolean;
    function GetFileEncryptEnabled: Boolean;
    procedure SetInwardFileDecryptEnabled(const Value: Boolean);
    procedure SetFileEncryptEnabled(const Value: Boolean);
    function GetInwardFileEncryptEnabled: Boolean;
    procedure SetInwardFileEncryptEnabled(const Value: Boolean);
    function GetFeeDebetClearing: Double;
    procedure SetFeeDebetClearing(const Value: Double);
    function GetReturDBName: string;
    function GetReturDBUserName: string;
    function GetReturDBUserPass: string;
    function GetReturServerAddress: string;
    function GetReturServerHost: string;
    function GetReturServerPort: integer;
    function GetXLSCabPgn: String;
    //=====modified n add by teguh=============
    function GetXLSJnsTxnMng: string;
    function GetXLSJnsTxnKlh: string;
    function GetTPKRprtPath: string;

    function GetXLSJrnID: string;
    function GetXLSNarasiJabo: string;
    function GetXLSNarasiNonJaboKlh: string;
    function GetXLSNarasiNonJaboMng: string;
    function GetXLSNoJabo: Integer;
    function GetXLSNoNonJabo: Integer;
    procedure SetReturDBName(const Value: string);
    procedure SetReturDBUserName(const Value: string);
    procedure SetReturDBUserPass(const Value: string);
    procedure SetReturServerAddress(const Value: string);
    procedure SetReturServerHost(const Value: string);
    procedure SetReturServerPort(const Value: integer);
    procedure SetXLSCabPgn(const Value: String);
    //===========modified n added by teguh============
    procedure SetXLSJnsTxnMng(const Value: string);
    procedure SetXLSJnsTxnKlh(const Value: string);
    procedure SetTPKRprtPath(const Value: string);

    procedure SetXLSJrnID(const Value: string);
    procedure SetXLSNarasiJabo(const Value: string);
    procedure SetXLSNarasiNonJaboKlh(const Value: string);
    procedure SetXLSNarasiNonJaboMng(const Value: string);
    procedure SetXLSNoJabo(const Value: Integer);
    procedure SetXLSNoNonJabo(const Value: Integer);
    function GetDashboardDBName: string;
    procedure SetDashboardDBName(const Value: string);
    function GetDBMonthlyRptDBName: string;
    procedure SetDBMonthlyRptDBName(const Value: string);
    function GetTPKDebetConnectionString: string;
    procedure SetTPKDebetConnectionString(const Value: string);
    function GetFeeIntercity: Double;
    procedure SetFeeIntercity(const Value: Double);
    function GetIntercityAccBCA: string;
    procedure SetIntercityAccBCA(const Value: string);
    function GetDBDailyInwardDebetDBName: string;
    procedure SetDBDailyInwardDebetDBName(const Value: string);
    function GetSystemPortraitReportLength: Integer;
    procedure SetSystemPortraitReportLength(const Value: Integer);
    function GetSystemInputFolder: string;
    function GetSystemOutputFolder: string;
    procedure SetSystemInputFolder(const Value: string);
    procedure SetSystemOutputFolder(const Value: string);
    function GetBankBIActiveBranch: string;
    procedure SetBankBIActiveBranch(const Value: string);
    function GetBankWilayahKliringAktive: string;
    //procedure InitConfig;
    procedure SetBankWilayahKliringAktive(const Value: string);
    function GetSystemAppVersion: Integer;
    procedure SetSystemAppVersion(const Value: Integer);
    function GetSystemApplicationPath: string;
    procedure SetSystemApplicationPath(const Value: string);
    function GetDBSecurityInfo: Boolean;
    procedure SetDBSecurityInfo(const Value: boolean);
    function GetInterfaceDownloadFileName(idx: Integer): string;
    function GetInterfaceDownloadPath(idx: Integer): String;
    function GetInterfaceDownloadPathCount: Integer;
    procedure SetInterfaceDownloadFileName(idx: Integer;
      const Value: string);
    procedure SetInterfaceDownloadPath(idx: Integer; const Value: String);
    procedure SetInterfaceDownloadPathCount(const Value: Integer);
    function GetSandiPesertaActive: String;
    procedure SetSandiPesertaActive(const Value: String);
    function GetTPKWSDLAddress: String;
    procedure SetTPKWSDLAddress(const Value: String);
    function GetTPKWSDLAuthCode: String;
    procedure SetTPKWSDLAuthCode(const Value: String);
    function GetSPKDKEType: String;
    procedure SetSPKDKEType(const Value: String);
    function GetHostIntfDownloadFTPAddress: String;
    function GetHostIntfDownloadFTPCRSourcePath: String;
    function GetHostIntfDownloadFTPDBSourcePath: String;
    function GetHostIntfDownloadFTPPassword: String;
    function GetHostIntfDownloadFTPPort: Integer;
    function GetHostIntfDownloadFTPUsername: String;
    function GetHostIntfDownloadProtocolType: Integer;
    procedure SetHostIntfDownloadFTPAddress(const Value: String);
    procedure SetHostIntfDownloadFTPCRSourcePath(const Value: String);
    procedure SetHostIntfDownloadFTPDBSourcePath(const Value: String);
    procedure SetHostIntfDownloadFTPPassword(const Value: String);
    procedure SetHostIntfDownloadFTPPort(const Value: Integer);
    procedure SetHostIntfDownloadFTPUsername(const Value: String);
    procedure SetHostIntfDownloadProtocolType(const Value: Integer);
    function GetHostInterfaceDownloadDKOFileName: String;
    function GetHostInterfaceDownloadDPOFileName: String;
    procedure SetHostInterfaceDownloadDKOFileName(const Value: String);
    procedure SetHostInterfaceDownloadDPOFileName(const Value: String);
    function GetSystemUsePolaSiklusForOutDebet: Boolean;
    procedure SetSystemUsePolaSiklusForOutDebet(const Value: Boolean);
    function GetHostInterfaceDownloadDKOFolder: String;
    function GetHostInterfaceDownloadDPOFolder: String;
    procedure SetHostInterfaceDownloadDKOFolder(const Value: String);
    procedure SetHostInterfaceDownloadDPOFolder(const Value: String);
    function GetSystemSandiEchanel: String;
    procedure SetSystemSandiEchanel(const Value: String);

    function GetSystemInwardHostInputFolder: string;
    function GetSystemInwardHostOutputFolder: string;
    procedure SetSystemInwardHostInputFolder(const Value: string);
    procedure SetSystemInwardHostOutputFolder(const Value: string);
    function GetCurrentCycle: Integer;
    procedure SetCurrentCycle(const Value: Integer);
    function GetInwardActiveBranchCode: String;
    procedure SetInwardActiveBranchCode(const Value: String);
    function GetInwardPromoCode: String;
    procedure SetInwardPromoCode(const Value: String);
    function GetSystemDefaultRejectPostingCode: string;
    procedure SetSystemDefaultRejectPostingCode(const Value: string);
    function GetVirtualAccountAcceptPostingCode: String;
    procedure SetVirtualAccountAcceptPostingCode(const Value: String);
    function GetTSAPostingCode: String;
    procedure SetTSAPostingCode(const Value: String);
    procedure SetGenDKIFileOutFolder(const Value: String);
    procedure SetGenDKIFileName(const Value: String);
    function GetGenDKIFileName: String;
    function GetGenDKIFileOutFolder: String;
    function GetSystemIBPrefixRef: String;
    procedure SetSystemIBPrefixRef(const Value: String);
    function GetHostAddress5: string;
    function GetHostPassword5: string;
    function GetHostTargetPath5: string;
    function GetHostUserName5: string;
    procedure SetHostAddress5(const Value: string);
    procedure SetHostPassword5(const Value: string);
    procedure SetHostTargetPath5(const Value: string);
    procedure SetHostUserName5(const Value: string);
    function GetSystemInwardHostInputFileName: string;
    procedure SetSystemInwardHostInputFileName(const Value: string);
    function GetSystemInwardDownloadDKIFromFTP: Boolean;
    procedure SetSystemInwardDownloadDKIFromFTP(const Value: Boolean);
    function GetOtomatisKirimFileGenDKIKeFTP: Boolean;
    procedure SetOtomatisKirimFileGenDKIKeFTP(const Value: Boolean);
    function GetGenDKIFTPAddress: String;
    function GetGenDKIFTPPassword: String;
    function GetGenDKIFTPPort: Integer;
    function GetGenDKIFTPTargetPath: String;
    function GetGenDKIFTPUsername: String;
    procedure SetGenDKIFTPAddress(const Value: String);
    procedure SetGenDKIFTPPassword(const Value: String);
    procedure SetGenDKIFTPPort(const Value: Integer);
    procedure SetGenDKIFTPTargetPath(const Value: String);
    procedure SetGenDKIFTPUsername(const Value: String);
    function GetInDKIHostFTPAddress: String;
    function GetInDKIHostFTPPassword: String;
    function GetInDKIHostFTPPath: String;
    function GetInDKIHostFTPPort: Integer;
    function GetInDKIHostFTPUsername: String;
    function GetOutDKIHostFTPAddress: String;
    function GetOutDKIHostFTPPassword: String;
    function GetOutDKIHostFTPPath: String;
    function GetOutDKIHostFTPPort: Integer;
    function GetOutDKIHostFTPUsername: String;
    procedure SetInDKIHostFTPAddress(const Value: String);
    procedure SetInDKIHostFTPPassword(const Value: String);
    procedure SetInDKIHostFTPPath(const Value: String);
    procedure SetInDKIHostFTPPort(const Value: Integer);
    procedure SetInDKIHostFTPUsername(const Value: String);
    procedure SetOutDKIHostFTPAddress(const Value: String);
    procedure SetOutDKIHostFTPPassword(const Value: String);
    procedure SetOutDKIHostFTPPath(const Value: String);
    procedure SetOutDKIHostFTPPort(const Value: Integer);
    procedure SetOutDKIHostFTPUsername(const Value: String);
    function GetConvBankCode: string;
    procedure SetConvBankCode(const Value: string);
    function GetGenDPIFileName: String;
    function GetGenDPIFileOutFolder: String;
    function GetGenDPIFTPAddress: String;
    function GetGenDPIFTPPassword: String;
    function GetGenDPIFTPPort: Integer;
    function GetGenDPIFTPTargetPath: String;
    function GetGenDPIFTPUsername: String;
    function GetOtomatisKirimFileGenDPIKeFTP: Boolean;
    procedure SetGenDPIFileName(const Value: String);
    procedure SetGenDPIFileOutFolder(const Value: String);
    procedure SetGenDPIFTPAddress(const Value: String);
    procedure SetGenDPIFTPPassword(const Value: String);
    procedure SetGenDPIFTPPort(const Value: Integer);
    procedure SetGenDPIFTPTargetPath(const Value: String);
    procedure SetGenDPIFTPUsername(const Value: String);
    procedure SetOtomatisKirimFileGenDPIKeFTP(const Value: Boolean);
    function GetInitialCreditBatchNoSPK: Integer;
    function GetInitialDebetBatchNoSPK: Integer;
    procedure SetInitialCreditBatchNoSPK(const Value: Integer);
    procedure SetInitialDebetBatchNoSPK(const Value: Integer);
    function GetRTGSConvertFileName: String;
    function GetRTGSConvertFolder: String;
    function GetRTGSConvertMultipleConvert: Boolean;
    procedure SetRTGSConvertFileName(const Value: String);
    procedure SetRTGSConvertFolder(const Value: String);
    procedure SetRTGSConvertMultipleConvert(const Value: Boolean);
    function GetRTGSListTRNConvert: String;
    procedure SetRTGSListTRNConvert(const Value: String);
    function GetPartialSyncOPSData: Boolean;
    procedure SetPartialSyncOPSData(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property ProfileRegistryKey:string read FProfileRegistryKey write FProfileRegistryKey;
    property ApplicationRegistryKey:string read FApplicationRegistryKey write FApplicationRegistryKey;
    property LogPath: String Read FLogPath Write FLogPath;
    property SystemReportLength: Integer read GetSystemReportLength Write SetSystemReportLength;
    property SystemPortraitReportLength: Integer read GetSystemPortraitReportLength Write SetSystemPortraitReportLength;
    property BankAccountBranch:string read GetBankAccountBranch write SetBankAccountBranch;
    property BankActiveBranch:string read GetBankActiveBranch write SetBankActiveBranch;
    property BankBIActiveBranch:string read GetBankBIActiveBranch write SetBankBIActiveBranch;
    property BankCentreBranch:string read GetBankCentreBranch write SetBankCentreBranch;
    property BankCode:string read GetBankCode write SetBankCode;
    property BankCPCBranch:string read GetBankCPCBranch write SetBankCPCBranch;
    property BankName:string read GetBankName write SetBankName;
    property BankShortName:string read GetBankShortName write SetBankShortName;
    property ContinueEODIfFail: Boolean read GetContinueEODIfFail write SetContinueEODIfFail;
    property ContinueSODIfFail: Boolean read GetContinueSODIfFail write SetContinueSODIfFail;
    property ContinueAuthorizeIfFail: Boolean read GetContinueAuthorizeIfFail write SetContinueAuthorizeIfFail;
    property DBBackupFolder:string read GetDBBackupFolder write SetDBBackupFolder;
    property DBConnectionString:string read GetDBConnectionString write SetDBConnectionString;
    property DBDailyDBName:string read GetDBDailyDBName write SetDBDailyDBName;
    property DBDailyInwardDBName:string read GetDBDailyInwardDBName write SetDBDailyInwardDBName;
    property DBDailyInwardDebetDBName:string read GetDBDailyInwardDebetDBName write SetDBDailyInwardDebetDBName;
    property DBDataFolder:string read GetDBDataFolder write SetDBDataFolder;
    //<=================== added by nino =====================//
    property XLSCabPgn          : string  read GetXLSCabPgn           write SetXLSCabPgn;
    //=============================edited n added by teguh================================//
    property XLSJnsTxnMng          : string  read GetXLSJnsTxnMng           write SetXLSJnsTxnMng;
    property XLSJnsTxnKlh          : string  read GetXLSJnsTxnKlh           write SetXLSJnsTxnKlh;
    property TPKRprtPath           : string  read GetTPKRprtPath            write SetTPKRprtPath;

    property XLSJrnID           : string  read GetXLSJrnID            write SetXLSJrnID;
    property XLSNoJabo          : Integer read GetXLSNoJabo           write SetXLSNoJabo;
    property XLSNoNonJabo       : Integer read GetXLSNoNonJabo        write SetXLSNoNonJabo;
    property XLSNarasiJabo      : string  read GetXLSNarasiJabo       write SetXLSNarasiJabo;
    property XLSNarasiNonJaboKlh: string  read GetXLSNarasiNonJaboKlh write SetXLSNarasiNonJaboKlh;
    property XLSNarasiNonJaboMng: string  read GetXLSNarasiNonJaboMng write SetXLSNarasiNonJaboMng;

    property ReturServerAddress : string  read GetReturServerAddress write SetReturServerAddress;
    property ReturServerHost    : string  read GetReturServerHost    write SetReturServerHost;
    property ReturServerPort    : integer read GetReturServerPort    write SetReturServerPort;
    property ReturDBUserName    : string  read GetReturDBUserName    write SetReturDBUserName;
    property ReturDBUserPass    : string  read GetReturDBUserPass    write SetReturDBUserPass;
    property ReturDBName        : string  read GetReturDBName        write SetReturDBName;

    property DashboardDBName       : string  read GetDashboardDBName       write SetDashboardDBName;
    //==================== added by nino ====================>//
    property DBDataSource:string read GetDBDataSource write SetDBDataSource;
    property DBMainDBName:string read GetDBMainDBName write SetDBMainDBName;
    property DBParams:string read GetDBParams write SetDBParams;
    property DBPassword:string read GetDBPassword write SetDBPassword;
    property DBProvider:string read GetDBProvider write SetDBProvider;
    property DBSecurityInfo:boolean read GetDBSecurityInfo write SetDBSecurityInfo;
    property DBSharedBackupFolder:string read GetDBSharedBackupFolder write SetDBSharedBackupFolder;
    property DBTrxLifeCycle:Integer read GetDBTrxLifeCycle write SetDBTrxLifeCycle;
    property DBType:Integer read GetDBType write SetDBType;
    property DBUserDBName:string read GetDBUserDBName write SetDBUserDBName;
    property DBUsername:string read GetDBUsername write SetDBUsername;
    property DownloadFilename:string read GetDownloadFilename write SetDownloadFilename;
    property DownloadSourcePath[Index: Integer]: string read GetDownloadSourcePath write SetDownloadSourcePath;
    property DownloadSourceFileName[Index: Integer]: string read GetDownloadSourceFileName write SetDownloadSourceFileName;
    property DownloadSourcePathCount:Integer read GetDownloadSourcePathCount write SetDownloadSourcePathCount;
    property DownloadAltFilename:string read GetDownloadAltFilename write SetDownloadAltFilename;
    property DownloadAltSourcePath[Index: Integer]: string read GetDownloadAltSourcePath write SetDownloadAltSourcePath;
    property DownloadAltSourceFileName[Index: Integer]: string read GetDownloadAltSourceFileName write SetDownloadAltSourceFileName;
    property DownloadAltSourcePathCount:Integer read GetDownloadAltSourcePathCount write SetDownloadAltSourcePathCount;
    property DownloadAlt2Filename:string read GetDownloadAlt2Filename write SetDownloadAlt2Filename;
    property DownloadAlt2SourcePath[Index: Integer]: string read GetDownloadAlt2SourcePath write SetDownloadAlt2SourcePath;
    property DownloadAlt2SourcePathCount:Integer read GetDownloadAlt2SourcePathCount write SetDownloadAlt2SourcePathCount;
    property DownloadTargetPath[Index: Integer]:string read GetDownloadTargetPath write SetDownloadTargetPath;
    property DownloadTargetPathCount: Integer read GetDownloadTargetPathCount write SetDownloadTargetPathCount;
    property DownloadAutoBatch: Boolean read GetDownloadAutoBatch write SetDownloadAutoBatch;
    property DownloadHostActive: Boolean read GetDownloadHostActive write SetDownloadHostActive;
    property DownloadHostTelnetActive: Boolean read GetDownloadHostTelnetActive write SetDownloadHostTelnetActive;
    property DownloadHostFTPQuote: Boolean read GetDownloadHostFTPQuote write SetDownloadHostFTPQuote;
    property DownloadCRCChecked: Boolean read GetDownloadCRCChecked write SetDownloadCRCChecked;
    property DownloadStringCekList: string read GetDownloadStringCekList write SetDownloadStringCekList;
    property UploadDBUpdateRejectBatch: Boolean read GetUploadDBUpdateRejectBatch write SetUploadDBUpdateRejectBatch;
    property UploadDBCancelRejectBatch: Boolean read GetUploadDBCancelRejectBatch write SetUploadDBCancelRejectBatch;
    property UploadDBUpdateInTPKStatus: Boolean read GetUploadDBUpdateInTPKStatus write SetUploadDBUpdateInTPKStatus;
    property UploadDBUpdateInSSKStatus: Boolean read GetUploadDBUpdateInSSKStatus write SetUploadDBUpdateInSSKStatus;
    property UploadRTUpdateRejectBatch: Boolean read GetUploadRTUpdateRejectBatch write SetUploadRTUpdateRejectBatch;
    property UploadRTCancelRejectBatch: Boolean read GetUploadRTCancelRejectBatch write SetUploadRTCancelRejectBatch;
    property UploadRTUpdateInTPKStatus: Boolean read GetUploadRTUpdateInTPKStatus write SetUploadRTUpdateInTPKStatus;
    property UploadRTUpdateInSSKStatus: Boolean read GetUploadRTUpdateInSSKStatus write SetUploadRTUpdateInSSKStatus;
    property UploadTargetPath: string read GetUploadTargetPath write SetUploadTargetPath;
    property UploadTargetFilename: string read GetUploadTargetFilename write SetUploadTargetFilename;
    property HostInterfaceAutoConvert:Integer read GetHostInterfaceAutoConvert write SetHostInterfaceAutoConvert;
    property HostInterfaceAutoConvertDelay:Integer read GetHostInterfaceAutoConvertDelay write SetHostInterfaceAutoConvertDelay;
    property HostInterfaceAutoResult:Integer read GetHostInterfaceAutoResult write SetHostInterfaceAutoResult;
    property HostInterfaceAutoResultDelay:Integer read GetHostInterfaceAutoResultDelay write SetHostInterfaceAutoResultDelay;
    property HostInterfaceButtonViewLog:Integer read GetHostInterfaceButtonViewLog write SetHostInterfaceButtonViewLog;
    property HostInterfaceDownloadVisible:Integer read GetHostInterfaceDownloadVisible write SetHostInterfaceDownloadVisible;
    property HostInterfaceName:string read GetHostInterfaceName write SetHostInterfaceName;
    property HostInterfaceShowMessage:Integer read GetHostInterfaceShowMessage write SetHostInterfacetShowMessage;
    property HostInterfaceUploadVisible:Integer read GetHostInterfaceUploadVisible write SetHostInterfaceUploadVisible;
    property HostAddress: string read GetHostAddress write SetHostAddress;
    property HostUserName: string read GetHostUserName write SetHostUserName;
    property HostPassword: string read GetHostPassword write SetHostPassword;
    property HostProgram: string read GetHostProgram write SetHostProgram;
    property HostProgramSuccessString: string read GetHostProgramSuccessString write SetHostProgramSuccessString;
    property HostProgramFailedString: string read GetHostProgramFailedString write SetHostProgramFailedString;
    property HostFilename: string read GetHostFilename write SetHostFilename;
    property HostLocalFilename: string read GetHostLocalFilename write SetHostLocalFilename;
    property HostDirectClose: Boolean read GetHostDirectClose write SetHostDirectClose;
    property MaxAmountPerBatch:Currency read GetMaxAmountPerBatch write SetMaxAmountPerBatch;
    property MaxAmountRTGS:Currency read GetMaxAmountRTGS write SetMaxAmountRTGS;
    property MaxItemPerBatch:Integer read GetMaxItemPerBatch write SetMaxItemPerBatch;
    property MaxAuthorizedAmountDBPerItem: Currency read GetMaxAuthorizedAmountDBPerItem write SetMaxAuthorizedAmountDBPerItem;
    property SystemLastDay:TDate read GetSystemLastDay write SetSystemLastDay;
    property SystemNextDay:TDate read GetSystemNextDay write SetSystemNextDay;
    property SystemPowerEncode:Boolean read GetSystemPowerEncode write SetSystemPowerEncode;
    property SystemStatus:Integer read GetSystemStatus write SetSystemStatus;
    property SystemToday:TDate read GetSystemToday write SetSystemToday;
    property TableToTextDir:String read GetTableToTextDir write SetTableToTextDir;
    property TPKConnectionString:string read GetTPKConnectionString write SetTPKConnectionString;
    property TPKDebetConnectionString:string read GetTPKDebetConnectionString write SetTPKDebetConnectionString;
    property TPKDBType:string read GetTPKDBType write SetTPKDBType;
    property TPKRootFolder:string read GetTPKRootFolder write SetTPKRootFolder;
    property TPKBatchPerTransfer:Integer read GetTPKBatchPerTransfer write SetTPKBatchPerTransfer;
    property TPKVersion:Integer read GetTPKVersion write SetTPKVersion;
    property SystemInwardToday:TDate read GetSystemInwardToday write SetSystemInwardToday;
    property SystemInwardStatus:Integer read GetSystemInwardStatus write SetSystemInwardStatus;
    property SystemDefaultPostingCode:string read GetSystemDefaultPostingCode write SetSystemDefaultPostingCode;
    property SystemDefaultRejectPostingCode:string read GetSystemDefaultRejectPostingCode write SetSystemDefaultRejectPostingCode;
    property SystemVerifyUsergroup:string read GetSystemVerifyUsergroup write SetSystemVerifyUsergroup;
    property SystemOutwardEnabled:boolean read GetSystemOutwardEnabled write SetSystemOutwardEnabled;
    property SystemInwardEnabled:boolean read GetSystemInwardEnabled write SetSystemInwardEnabled;
    property SystemReturnEnabled:boolean read GetSystemReturnEnabled write SetSystemReturnEnabled;
    property SystemInwardHostInputFileName:string read GetSystemInwardHostInputFileName write SetSystemInwardHostInputFileName;
    property SystemInwardHostOutputFolder:string read GetSystemInwardHostOutputFolder write SetSystemInwardHostOutputFolder;
    property SystemPrintCreditNotes:boolean read GetSystemPrintCreditNotes write SetSystemPrintCreditNotes;
    property SystemStatusHostInterface:Integer read GetSystemStatusHostInterface write SetSystemStatusHostInterface;
    property SystemHostInterfaceDate: string read GetSystemHostInterfaceDate write SetSystemHostIntefaceDate;
    property SystemChno:Integer read GetSystemChno write SetSystemChno;
    property CurrentCycle:Integer read GetCurrentCycle write SetCurrentCycle;
    property InwardActiveBranchCode:String read GetInwardActiveBranchCode write SetInwardActiveBranchCode;
    property InwardPromoCode:String read GetInwardPromoCode write SetInwardPromoCode;
    property SystemDebitEditableField:string read GetSystemDebitEditableField write SetSystemDebitEditableField;
    property SystemCreditEditableField:string read GetSystemCreditEditableField write SetSystemCreditEditableField;
    property SystemAuthorizeAllEnabled:Boolean read GetSystemAuthorizeAllEnabled write SetSystemAuthorizeAllEnabled;
    property HostAddress5: string read GetHostAddress5 write SetHostAddress5;
    property HostUserName5: string read GetHostUserName5 write SetHostUserName5;
    property HostPassword5: string read GetHostPassword5 write SetHostPassword5;
    property HostTargetPath5: string read GetHostTargetPath5 write SetHostTargetPath5;
    property SystemReportSignee:string read GetSystemReportSignee write SetSystemReportSignee;
    property SystemBackupDataSuffix:string read GetSystemBackupDataSuffix write SetBackupDataSuffix;
    property SystemBackupLogSuffix:string read GetSystemBackupLogSuffix write SetBackupLogSuffix;
    property SystemAuthorizeUsergroup:string read GetSystemAuthorizeUsergroup write SetSystemAuthorizeUsergroup;
    property PrinterTellstrook:string read GetPrinterTellstrook write SetPrinterTellStrook;
    property LoadDLLOnEOD: Integer read GetLoadDLLOnEOD write SetLoadDLLOnEOD;
    property LoadDLLOnSOD: Integer read GetLoadDLLOnSOD write SetLoadDLLOnSOD;
    property LoadDLLOnAuthorize: Integer read GetLoadDLLOnAuthorize write SetLoadDLLOnAuthorize;
    property ControlCNEditControl: Integer read GetControlCNEditControl write SetControlCNEditControl;
    property ControlCNCetakBeritaAcara: Boolean read GetControlCNCetakBeritaAcara write SetControlCNCetakBeritaAcara;
    property ControlCNSatKerPTR: string read GetControlCNSatKerPTR write SetControlCNSatKerPTR;
    property ControlCNViewBeritaAcaraControl: Boolean read GetControlCNViewBeritaAcaraControl write SetControlCNViewBeritaAcaraControl;
    property ControlCNViewBeritaAcaraApprove: Boolean read GetControlCNViewBeritaAcaraApprove write SetControlCNViewBeritaAcaraApprove;
    property ControlCNLembarBeritaAcara: Integer read GetControlCNLembarBeritaAcara write SetControlCNLembarBeritaAcara;
    property ControlCNReferenceNoVisible: Boolean read GetControlCNReferenceNoVisible write SetControlCNReferenceNoVisible;
    property ControlCNSatKerSystem: string read GetControlCNSatKerSystem write SetControlCNSatKerSystem;
    property AuthGroupCetakUlang: string read GetAuthGroupCetakUlang write SetAuthGroupCetakUlang;
    property AuthGroupEditBatch: string read GetAuthGroupEditBatch write SetAuthGroupEditBatch;
    property AuthGroupParaBatch: string read GetAuthGroupParaBatch write SetAuthGroupParaBatch;
    property FieldSizeReferenceNo: Integer read GetFieldSizeReferenceNo write SetFieldSizeReferenceNo;
    property FieldSizeAccountNo: Integer read GetFieldSizeAccountNo write SetFieldSizeAccountNo;
    property FieldSizeOPAccountNo: Integer read GetFieldSizeOPAccountNo write SetFieldSizeOPAccountNo;
    property FieldSizeCustName: Integer read GetFieldSizeCustName write SetFieldSizeCustName;
    property FieldSizeOPCustName: Integer read GetFieldSizeOPCustName write SetFieldSizeOPCustName;
    property IBankNameLength: Integer read GetIBankNameLength write SetIBankNameLength;
    property SODTransferTables: Integer read GetSODTransferTables write SetSODTransferTables;
    property TPKTextFileName[Index:Integer]:string read GetTPKTextFileName write SetTPKTextFileName;
    property ACKCheckFlag: string read getACKCheckFlag write setACKCheckFlag;
    property CommOutboxPath: string read GetCommOutboxPath write SetCommOutboxPath;
    property CommInboxPath: string read GetCommInboxPath write SetCommInboxPath;
    property BICreditFee : Double read GetBICreditFee write SetBICreditFee;
    property BIDebitFee : Double read GetBIDebitFee write SetBIDebitFee;
    property CPCCreditFee : Double read GetCPCCreditFee write SetCPCCreditFee;
    property CPCDebitFee : Double read GetCPCDebitFee write SetCPCDebitFee;
    property ACKReturnEnabled : Integer read GetACKReturnEnabled write SetACKReturnEnabled;
    property ACKOutwardEnabled : Integer read GetACKOutwardEnabled write SetACKOutwardEnabled;
    property ACKReturnDllName : String read GetACKReturnDllName write SetACKReturnDllName;
    property ACKReturnCallFunction : String read GetACKReturnCallFunction write SetACKReturnCallFunction;
    property ACKOutwardDllName : String read GetACKOutwardDllName write SetACKOutwardDllName;
    property ACKOutwardCallFunction : String read GetACKOutwardCallFunction write SetACKOutwardCallFunction;
    property ACKOutwardCreditCallFunction : String read GetACKOutwardCreditCallFunction write SetACKOutwardCreditCallFunction;
		property ACKOutwardDebitCallFunction : String read GetACKOutwardDebitCallFunction write SetACKOutwardDebitCallFunction;
    property AEOfflineVisible : Boolean read GetAEOfflineVisible write SetAEOfflineVisible;
    property AESendACKCreditVisible : Boolean read GetAESendACKCreditVisible write SetAESendACKCreditVisible;
		property AESendACKDebitVisible : Boolean read GetAESendACKDebitVisible write SetAESendACKDebitVisible;
    property TransferHistoryOption: Integer read GetTransferHistoryOption write SetTransferHistoryOption;
    property TransferHistoryBackwardDays: Integer read GetTransferHistoryBackwardDays write SetTransferHistoryBackwardDays;
    property ApplicationDataPath: string read FApplicationDataPath;
    property FileEncryptionKey: string read GetFileEncryptionKey write SetFileEncryptionKey;
    property FileDecryptEnabled: Boolean read GetFileDecryptEnabled write SetFileDecryptEnabled;
		property InwardFileDecryptEnabled: Boolean read GetInwardFileDecryptEnabled write SetInwardFileDecryptEnabled;
    property FileEncryptEnabled: Boolean read GetFileEncryptEnabled write SetFileEncryptEnabled;
    property DataSnapFileManagerPort: Integer read GetDataSnapFileManagerPort write SetDataSnapFileManagerPort;
    property InwardFileEncryptEnabled: Boolean read GetInwardFileEncryptEnabled write SetInwardFileEncryptEnabled;
		property FeeDebetClearing:Double read GetFeeDebetClearing write SetFeeDebetClearing;
		property FeeIntercity:Double read GetFeeIntercity write SetFeeIntercity;
    property DBMonthlyRptDBName:string read GetDBMonthlyRptDBName write SetDBMonthlyRptDBName;
		property IntercityAccBCA: string read GetIntercityAccBCA write SetIntercityAccBCA;

    //Self
    property SystemInputFolder:string read GetSystemInputFolder write SetSystemInputFolder;
    property SystemOutputFolder:string read GetSystemOutputFolder write SetSystemOutputFolder;
    property BankWilayahKliringAktive:string read GetBankWilayahKliringAktive write SetBankWilayahKliringAktive;
    property SystemAppVersion:Integer read GetSystemAppVersion write SetSystemAppVersion;
    property SystemApplicationPath:string read GetSystemApplicationPath write SetSystemApplicationPath;
    property InterfaceDownloadPathCount:Integer read GetInterfaceDownloadPathCount write SetInterfaceDownloadPathCount;
    property InterfaceDownloadPath[idx:Integer]:String read GetInterfaceDownloadPath write SetInterfaceDownloadPath;
    property InterfaceDownloadFileName[idx: Integer]: string read GetInterfaceDownloadFileName write SetInterfaceDownloadFileName;
    property SandiPesertaActive:String read GetSandiPesertaActive write SetSandiPesertaActive;
    property TPKWSDLAddress:String read GetTPKWSDLAddress write SetTPKWSDLAddress;
    property TPKWSDLAuthCode:String read GetTPKWSDLAuthCode write SetTPKWSDLAuthCode;
		property SPKDKEType:String read GetSPKDKEType write SetSPKDKEType;

		property HostInterfaceDownloadProtocolType:Integer read GetHostIntfDownloadProtocolType write SetHostIntfDownloadProtocolType;
		property HostInterfaceDownloadDKOFolder:String read GetHostInterfaceDownloadDKOFolder write SetHostInterfaceDownloadDKOFolder;
		property HostInterfaceDownloadDPOFolder:String read GetHostInterfaceDownloadDPOFolder write SetHostInterfaceDownloadDPOFolder;
		property HostInterfaceDownloadDKOFileName:String read GetHostInterfaceDownloadDKOFileName write SetHostInterfaceDownloadDKOFileName;
		property HostInterfaceDownloadDPOFileName:String read GetHostInterfaceDownloadDPOFileName write SetHostInterfaceDownloadDPOFileName;
		property HostInterfaceDownloadFTPAddress:String read GetHostIntfDownloadFTPAddress write SetHostIntfDownloadFTPAddress;
		property HostInterfaceDownloadFTPPort:Integer read GetHostIntfDownloadFTPPort write SetHostIntfDownloadFTPPort;
		property HostInterfaceDownloadFTPUsername:String read GetHostIntfDownloadFTPUsername write SetHostIntfDownloadFTPUsername;
		property HostInterfaceDownloadFTPPassword:String read GetHostIntfDownloadFTPPassword write SetHostIntfDownloadFTPPassword;
		property HostInterfaceDownloadFTPCRSourcePath:String read GetHostIntfDownloadFTPCRSourcePath write SetHostIntfDownloadFTPCRSourcePath;
		property HostInterfaceDownloadFTPDBSourcePath:String read GetHostIntfDownloadFTPDBSourcePath write SetHostIntfDownloadFTPDBSourcePath;
    Property SystemPolaSiklusOutDebetEnable:Boolean read GetSystemUsePolaSiklusForOutDebet  write SetSystemUsePolaSiklusForOutDebet;
		property SystemSandiEchanel:String read GetSystemSandiEchanel write SetSystemSandiEchanel;

		//Inward Kredit
    property SystemInwardHostInputFolder:string read GetSystemInwardHostInputFolder write SetSystemInwardHostInputFolder;
    property SystemVirtualAccountAcceptPostingCode:String read GetVirtualAccountAcceptPostingCode write SetVirtualAccountAcceptPostingCode;
    property SystemInwardDownloadDKIFromFTP:Boolean read GetSystemInwardDownloadDKIFromFTP write SetSystemInwardDownloadDKIFromFTP;
    property GenDKIOtomatisKirimFileKeFTP:Boolean read GetOtomatisKirimFileGenDKIKeFTP write SetOtomatisKirimFileGenDKIKeFTP;
    property GenDKIFTPAddress:String Read GetGenDKIFTPAddress write SetGenDKIFTPAddress;
    property GenDKIFTPUsername:String Read GetGenDKIFTPUsername write SetGenDKIFTPUsername;
    property GenDKIFTPPassword:String Read GetGenDKIFTPPassword write SetGenDKIFTPPassword;
    property GenDKIFTPPort:Integer Read GetGenDKIFTPPort write SetGenDKIFTPPort;
    property GenDKIFTPTargetPath:String Read GetGenDKIFTPTargetPath write SetGenDKIFTPTargetPath;

    property InDKIHostFTPAddress:String Read GetInDKIHostFTPAddress write SetInDKIHostFTPAddress;
    property InDKIHostFTPUsername:String Read GetInDKIHostFTPUsername write SetInDKIHostFTPUsername;
    property InDKIHostFTPPassword:String Read GetInDKIHostFTPPassword write SetInDKIHostFTPPassword;
    property InDKIHostFTPPort:Integer Read GetInDKIHostFTPPort write SetInDKIHostFTPPort;
    property InDKIHostFTPPath:String Read GetInDKIHostFTPPath write SetInDKIHostFTPPath;

    property OutDKIHostFTPAddress:String Read GetOutDKIHostFTPAddress write SetOutDKIHostFTPAddress;
    property OutDKIHostFTPUsername:String Read GetOutDKIHostFTPUsername write SetOutDKIHostFTPUsername;
    property OutDKIHostFTPPassword:String Read GetOutDKIHostFTPPassword write SetOutDKIHostFTPPassword;
    property OutDKIHostFTPPort:Integer Read GetOutDKIHostFTPPort write SetOutDKIHostFTPPort;
    property OutDKIHostFTPPath:String Read GetOutDKIHostFTPPath write SetOutDKIHostFTPPath;
    property ConvBankCode:string read GetConvBankCode write SetConvBankCode;

    //Self

    procedure InitConfig;
    procedure InitDB;
    procedure DeInitDB;
    procedure InitDBTPK;
    procedure InitReg;
    function GetValueDLLOnEOD(Index: Integer): string;
    function GetValueDLLOnSOD(Index: Integer): string;
    function GetValueDLLOnAuthorize(Index: Integer): string;
    procedure SetValueDLLOnEOD(Index: Integer; Value: String);
    procedure SetValueDLLOnSOD(Index: Integer; Value: String);
    procedure SetValueDLLOnAuthorize(Index: Integer; Value: String);
    property SystemTSAPostingCode:String read GetTSAPostingCode write SetTSAPostingCode;
		property GenDKIFileName:String read GetGenDKIFileName write SetGenDKIFileName;
  	property GenDKIFileOutFolder:String read GetGenDKIFileOutFolder write SetGenDKIFileOutFolder;
    property SystemIBPrefixRef:String read GetSystemIBPrefixRef write SetSystemIBPrefixRef;

		property GenDPIFileName:String read GetGenDPIFileName write SetGenDPIFileName;
  	property GenDPIFileOutFolder:String read GetGenDPIFileOutFolder write SetGenDPIFileOutFolder;
    property GenDPIOtomatisKirimFileKeFTP:Boolean read GetOtomatisKirimFileGenDPIKeFTP write SetOtomatisKirimFileGenDPIKeFTP;
    property GenDPIFTPAddress:String Read GetGenDPIFTPAddress write SetGenDPIFTPAddress;
    property GenDPIFTPUsername:String Read GetGenDPIFTPUsername write SetGenDPIFTPUsername;
    property GenDPIFTPPassword:String Read GetGenDPIFTPPassword write SetGenDPIFTPPassword;
    property GenDPIFTPPort:Integer Read GetGenDPIFTPPort write SetGenDPIFTPPort;
    property GenDPIFTPTargetPath:String Read GetGenDPIFTPTargetPath write SetGenDPIFTPTargetPath;
    property InitialCreditBatchNoSPK:Integer read GetInitialCreditBatchNoSPK write SetInitialCreditBatchNoSPK;
    property InitialDebetBatchNoSPK:Integer read GetInitialDebetBatchNoSPK write SetInitialDebetBatchNoSPK;
    property RTGSConvertFileName:String read GetRTGSConvertFileName write SetRTGSConvertFileName;
    property RTGSConvertFolder:String read GetRTGSConvertFolder write SetRTGSConvertFolder;
    property RTGSConvertMultipleConvert:Boolean read GetRTGSConvertMultipleConvert write SetRTGSConvertMultipleConvert;
    property RTGSListTRNConvert:String read GetRTGSListTRNConvert write SetRTGSListTRNConvert;
    property PartialSyncOPSData:Boolean read GetPartialSyncOPSData write SetPartialSyncOPSData;
  end;

const
  STR_CIPHER_KEY                              = '#L@ut4nB3rli@n#';

  SYS_STATUS_OPENED        = 1;
  SYS_STATUS_CLOSED        = 0;

  OB_STATUS_INSERTING      = 1;
  OB_STATUS_REJECT         = 2;
  OB_STATUS_CORRECTED      = 3;
  OB_STATUS_READYTOTPK     = 4;
  OB_STATUS_TPKPROCESS     = 5;
  OB_STATUS_READYFORPE     = 6;
  OB_STATUS_ENCODING       = 7;
  OB_STATUS_FINISHED       = 8;
  OB_STATUS_UNBALANCED     = 9;
  OB_STATUS_BALANCED       = 10;
  OB_STATUS_REJECT_DOUBLE  = 11;
  OB_STATUS_CANCELING      = 254;
  OB_STATUS_CANCEL         = 255;
  OB_STATUS_DELETED				 = 99;	

  OB_STATUS_INSTPK         = 1;
  OB_STATUS_INTPK          = 2;
  OB_STATUS_INSSK          = 3;

  OB_TYPE_CREDIT           = 1;
  OB_TYPE_DEBIT            = 2;
  OB_TYPE_RETURN           = 3;
  OB_TYPE_CANCEL           = 4;
  OB_TYPE_TPK_CREDIT       = 5;
  OB_TYPE_TPK_DEBIT        = 6;

  OB_MOVED_FROM_PREVIOUS   = 1;
  OB_MOVED_TO_CURRENT      = 2;

  OD_STATUS_READY          = 1;
  OD_STATUS_REJECT         = 2;
  OD_STATUS_CORRECTED      = 3;
  OD_STATUS_READYFORPE     = 6;
  OD_STATUS_FINISHED       = 8;
  OD_STATUS_IMPORT         = 9;
  OD_STATUS_IMPORT_EDIT    = 10;
  OD_STATUS_CONTROL_NEW    = 11;
  OD_STATUS_CONTROL_EDIT   = 12;
  OD_STATUS_DELETING       = 13;
  OD_STATUS_DELETED        = 99;
  OD_STATUS_CANCEL         = 255;

  OD_STATUS_INSTPK         = 1;
  OD_STATUS_INTPK          = 2;
  OD_STATUS_INSSK          = 3;

	(* Status Verifikasi *)
  ID_STATUS_UNVERIFIED     = 1;
  ID_STATUS_VERIFIED       = 2;
  ID_STATUS_EDITED         = 3;

  ID_STATUS_ERROR_NO_ACC   = 1;

  (* Status Proses *)
  (* BNI *)
  ID_STATUS_IMPORT_FROM_TPK		= 1;
  ID_STATUS_GENERATE_FROM_TPK = 2;
  ID_STATUS_IMPORT_FROM_HOST  = 3;
  ID_STATUS_EXPORT_TO_HOST  	= 4;
  (**)

  { ERROR FIELD ID }
  EFI_CHNO                 = 1;
  EFI_BANKNO               = 2;
  EFI_ACCNO                = 3;
  EFI_TC                   = 4;
  EFI_AMOUNT               = 5;
  EFI_REF_NO               = 6;
  EFI_OP_NAME              = 7;
  EFI_CU_NAME              = 8;
  EFI_CU_RESIDENT          = 9;
  EFI_CU_CITIZEN           = 10;
  EFI_PROV_CODE            = 11;
  EFI_CITY_CODE            = 12;
  EFI_BANK_TYPE            = 13;
  EFI_BR_ID                = 14;    //Added on 24 July 2005
  EFI_CU_ADDRESS					 = 15;
  EFI_SARANA_TRANSAKSI		 = 16;

  SYS_STATUS_HI_INACTIVE   = 0;
  SYS_STATUS_HI_ACTIVE     = 1;

  TEXT_OB_STATUS_INSERTING      = 'Inserting...';
  TEXT_OB_STATUS_REJECT         = 'Dokumen reject';
  TEXT_OB_STATUS_CORRECTED      = 'Telah dikoreksi';
  TEXT_OB_STATUS_READYTOTPK     = 'Siap proses ke SPK'; //'Siap Generate DPO';//
  TEXT_OB_STATUS_TPKPROCESS     = 'Sedang proses ke SPK';
  TEXT_OB_STATUS_READYFORPE     = 'Siap untuk PE';
  TEXT_OB_STATUS_ENCODING       = 'Sedang di-encode';
  TEXT_OB_STATUS_FINISHED       = 'Selesai';
  TEXT_OB_STATUS_UNBALANCED     = 'Unbalanced';
  TEXT_OB_STATUS_BALANCED       = 'Balanced';
  TEXT_OB_STATUS_CANCELING      = 'Proses Batal';
  TEXT_OB_STATUS_CANCEL         = 'Batal';
  TEXT_OB_STATUS_REJECT_DOUBLE  = 'Reject [Double]';

  TEXT_OB_STATUS_INSTPK         = 'SIK';
  TEXT_OB_STATUS_INTPK          = 'SPK';
  TEXT_OB_STATUS_INSSK          = 'SSK';

  TEXT_OB_TYPE_CREDIT           = 'KR Penyerahan';
  TEXT_OB_TYPE_DEBIT            = 'DB Penyerahan';
  TEXT_OB_TYPE_RETURN           = 'Pengembalian';
  TEXT_OB_TYPE_CANCEL           = 'Batch Batal';

  TEXT_OD_STATUS_READY          = 'Siap proses ke SPK';
  TEXT_OD_STATUS_REJECT         = 'Dokumen reject';
  TEXT_OD_STATUS_CORRECTED      = 'Telah dikoreksi';
  TEXT_OD_STATUS_READYFORPE     = 'Siap untuk PE';
  TEXT_OD_STATUS_FINISHED       = 'Selesai';
  TEXT_OD_STATUS_CANCEL         = 'Batal';
  TEXT_OD_STATUS_DELETED        = 'Dihapus';
  TEXT_OD_STATUS_DELETING       = 'Proses hapus';
  TEXT_OD_STATUS_IMPORT         = 'Impor';
  TEXT_OD_STATUS_IMPORT_EDIT    = 'Impor Edit';
  TEXT_OD_STATUS_CONTROL_NEW    = 'Kontrol baru';
  TEXT_OD_STATUS_CONTROL_EDIT   = 'Kontrol edit';

  TEXT_OD_STATUS_INSTPK         = 'STPK';
  TEXT_OD_STATUS_INTPK          = 'SPK';
  TEXT_OD_STATUS_INSSK          = 'SSK';

  VR_OK = 0;

	TRX_KREDIT  = 1;
  TRX_DEBET = 2;

  ID_STATUS_AUTOKREDIT_BERHASIL	= 0;
  ID_STATUS_AUTOKREDIT_GAGAL	  = 1;

  ID_STATUS_POSTING_AUTOKREDIT_TOLAK  = 1;
  ID_STATUS_POSTING_AUTOKREDIT_MANUAL = 2;

  //added by nino
  KEY_XLS_CAB_PGN                           = 'XLS\CabPgn';
  //modified n added by teguh
  KEY_XLS_JNS_TXN_MNG                       = 'XLS\JnsTxnMng';
  KEY_XLS_JNS_TXN_KLH                       = 'XLS\JnsTxnKlh';

  KEY_XLS_JRN_ID                            = 'XLS\JrnID';
  KEY_XLS_NO_JABO                           = 'XLS\NoJabo';
  KEY_XLS_NO_NONJABO                        = 'XLS\NoNonJabo';
  KEY_XLS_NARASI_JABO                       = 'XLS\NarasiJabo';
  KEY_XLS_NARASI_NONJABO_KLH                = 'XLS\NarasiNonJaboKlh';
  KEY_XLS_NARASI_NONJABO_MNG                = 'XLS\NarasiNonJaboMng';
  KEY_DB_RETURSERVERADDRESS                 = 'DB\ReturServerAddress';
  KEY_DB_RETURSERVERHOST                    = 'DB\ReturServerHost';
  KEY_DB_RETURSERVERPORT                    = 'DB\ReturServerPort';
  KEY_DB_RETURDBUSERNAME                    = 'DB\ReturDBUserName';
  KEY_DB_RETURDBUSERPASS                    = 'DB\ReturDBPassword';
  KEY_DB_RETURDBNAME                        = 'DB\ReturDBName';
  KEY_DB_DAILYINWARDDEBETDBNAME             = 'DB\DailyInwardDebetDBName';
  KEY_DB_DASHBOARDDBNAME                    = 'DB\DashboardDBName';

  //===============
  KEY_DB_CONNECTIONSTRING                   = 'DB\ConnectionString';
  KEY_DB_MAINDBNAME                         = 'DB\MainDBName';
  KEY_DB_DAILYDBNAME                        = 'DB\DailyDBName';
  KEY_DB_DAILYINWARDDBNAME                  = 'DB\DailyInwardDBName';
  KEY_DB_USERDBNAME                         = 'DB\UserDBName';
  KEY_DB_PROVIDER                           = 'DB\Provider';
  KEY_DB_USERNAME                           = 'DB\Username';
  KEY_DB_PASSWORD                           = 'DB\Password';
  KEY_DB_PARAMS                             = 'DB\Params';
  KEY_DB_DATASOURCE                         = 'DB\DataSource';
  KEY_DB_TYPE                               = 'DB\DBType';
  KEY_DB_TRXLIFECYCLE                       = 'DB\TrxLifeCycle';
  KEY_DB_DATAFOLDER                         = 'DB\DataFolder';
  KEY_DB_BACKUPFOLDER                       = 'DB\BackupFolder';
  KEY_DB_SHAREDBACKUPFOLDER                 = 'DB\SharedBackupFolder';
  KEY_DB_SECURITYINFO                       = 'DB\SecurityInfo';
  KEY_TPK_CONNECTIONSTRING                  = 'SPK\ConnectionString';
  KEY_TPK_DEBET_CONNECTIONSTRING            = 'SPK\DebetConnectionString';
  KEY_TPK_DBTYPE                            = 'SPK\DBType';
  KEY_TPK_ROOTFOLDER                        = 'SPK\DKEFolder';
  KEY_TPK_BATCHPERTRANSFER                  = 'SPK\BatchPerTransfer';
  KEY_TPK_TEXTFILENAME                      = 'SPK\TextFileName';
  KEY_TPK_VERSION		 			  								= 'SPK\Version'; //8 Dec 2005

  //=============added by teguh===================================
  KEY_TPK_RPRT_PATH                         = 'TPKReport\TPKRprtPath';

  KEY_CONS_MAXAMOUNTPERBATCH                = 'Constraints\MaxAmountPerBatch';
  KEY_CONS_MAXITEMPERBATCH                  = 'Constraints\MaxItemPerBatch';
  KEY_CONS_MAXAMOUNTRTGS                    = 'Constraints\MaxAmountRTGS';
  KEY_CONS_MAXAUTHORIZEDAMOUNTDBPERITEM     = 'Constraints\MaxAuthorizedAmountDBPerItem';
  KEY_DOWNLOAD_SOURCEPATHCOUNT              = 'HostInterface\Download\SourcePathCount';
  KEY_DOWNLOAD_SOURCEPATH                   = 'HostInterface\Download\SourcePath';
  KEY_DOWNLOAD_SOURCEFILENAME               = 'HostInterface\Download\SourceFilename';
  KEY_DOWNLOAD_TARGETPATHCOUNT              = 'HostInterface\Download\TargetPathCount';
  KEY_DOWNLOAD_TARGETPATH                   = 'HostInterface\Download\TargetPath';
  KEY_DOWNLOAD_FILENAME                     = 'HostInterface\Download\Filename';
  KEY_DOWNLOAD_ALTSOURCEPATHCOUNT           = 'HostInterface\Download\AltSourcePathCount';
  KEY_DOWNLOAD_ALTSOURCEPATH                = 'HostInterface\Download\AltSourcePath';
  KEY_DOWNLOAD_ALTSOURCEFILENAME            = 'HostInterface\Download\AltSourceFilename';
  KEY_DOWNLOAD_ALTFILENAME                  = 'HostInterface\Download\AltFilename';
  KEY_DOWNLOAD_ALT2SOURCEPATHCOUNT          = 'HostInterface\Download\Alt2SourcePathCount';
  KEY_DOWNLOAD_ALT2SOURCEPATH               = 'HostInterface\Download\Alt2SourcePath';
  KEY_DOWNLOAD_ALT2FILENAME                 = 'HostInterface\Download\Alt2Filename';
  KEY_DOWNLOAD_AUTOBATCH                    = 'HostInterfaceDownload\AutoBatch';
  KEY_DOWNLOAD_HOSTACTIVE                   = 'HostInterfaceDownload\HostActive';
  KEY_DOWNLOAD_HOSTTELNETACTIVE             = 'HostInterfaceDownload\HostTelnetActive';
  KEY_DOWNLOAD_HOSTFTPQUOTE                 = 'HostInterfaceDownload\HostFTPQuote';
  KEY_DOWNLOAD_CRCCHECKED                   = 'HostInterfaceDownload\CRCChecked';
  KEY_DOWNLOAD_STRINGCEKLIST                = 'HostInterfaceDownload\StringCekList';
  KEY_UPLOAD_DBUPDATEREJECTBATCH            = 'HostInterfaceUpload\DBUpdateRejectBatch';
  KEY_UPLOAD_DBCANCELREJECTBATCH            = 'HostInterfaceUpload\DBCancelRejectBatch';
  KEY_UPLOAD_DBUPDATEINTPKSTATUS            = 'HostInterfaceUpload\DBUpdateInTPKStatus';
  KEY_UPLOAD_DBUPDATEINSSKSTATUS            = 'HostInterfaceUpload\DBUpdateInSSKStatus';
  KEY_UPLOAD_RTUPDATEREJECTBATCH            = 'HostInterfaceUpload\RTUpdateRejectBatch';
  KEY_UPLOAD_RTCANCELREJECTBATCH            = 'HostInterfaceUpload\RTCancelRejectBatch';
  KEY_UPLOAD_RTUPDATEINTPKSTATUS            = 'HostInterfaceUpload\RTUpdateInTPKStatus';
  KEY_UPLOAD_RTUPDATEINSSKSTATUS            = 'HostInterfaceUpload\RTUpdateInSSKStatus';
  KEY_UPLOAD_TARGETPATH                     = 'HostInterface\Upload\TargetPath';
  KEY_UPLOAD_TARGETFILENAME                 = 'HostInterface\Upload\TargetFilename';
  KEY_HI_AUTOCONVERT                        = 'HostInterface\AutoConvert';
  KEY_HI_AUTOCONVERTDELAY                   = 'HostInterface\AutoConvertDelay';
  KEY_HI_AUTORESULT                         = 'HostInterface\AutoResult';
  KEY_HI_AUTORESULTDELAY                    = 'HostInterface\AutoResultDelay';
  KEY_HI_BUTTONVIEWLOG                      = 'HostInterface\ButtonViewLog';
  KEY_HI_DOWNLOADVISIBLE                    = 'HostInterface\DownloadVisible';
  KEY_HI_UPLOADVISIBLE                      = 'HostInterface\UploadVisible';
  KEY_HI_SHOWMESSAGE                        = 'HostInterface\ShowMessage';
  KEY_HI_NAME                               = 'HostInterface\Name';
  KEY_BANK_CODE                             = 'Bank\Code';
  KEY_BANK_NAME                             = 'Bank\Name';
  KEY_BANK_SHORTNAME                        = 'Bank\ShortName';
  KEY_BANK_ACTIVEBRANCH                     = 'Bank\ActiveBranch';
  KEY_BANK_BI_ACTIVEBRANCH                  = 'Bank\BIActiveBranch';
  KEY_BANK_CPCBRANCH                        = 'Bank\CPCBranch';
  KEY_BANK_CENTREBRANCH                     = 'Bank\CentreBranch';
  KEY_BANK_ACCOUNTBRANCH                    = 'Bank\AccountBranch';
  KEY_BANK_ACTIVE_REGION										= 'Bank\SKNRegionCode';
  KEY_SYSTEM_TODAY                          = 'System\Today';
  KEY_SYSTEM_LASTDAY                        = 'System\LastDay';
  KEY_SYSTEM_NEXTDAY                        = 'System\NextDay';
  KEY_SYSTEM_STATUS                         = 'System\Status';
  KEY_SYSTEM_POWERENCODE                    = 'System\PowerEncode';
  KEY_SYSTEM_TABLETOTEXTDIR                 = 'System\TableToTextDir';
  KEY_SYSTEM_INWARDTODAY                    = 'System\InwardToday';
  KEY_SYSTEM_INWARDSTATUS                   = 'System\InwardStatus';
  KEY_SYSTEM_DEFAULTPOSTINGCODE             = 'System\DefaultPostingCode';
  KEY_SYSTEM_DEFAULT_REJECT_POSTING_CODE= 'System\DefaultRejectPostingCode';
  KEY_SYSTEM_VERIFYUSERGROUP                = 'System\VerifyUserGroup';
  KEY_SYSTEM_INWARDENABLED                  = 'System\InwardEnabled';
  KEY_SYSTEM_OUTWARDENABLED                 = 'System\OutwardEnabled';
  KEY_SYSTEM_RETURNENABLED                  = 'System\ReturnEnabled';
  KEY_SYSTEM_PRINTCREDITNOTES               = 'System\PrintCreditNotes';
  KEY_SYSTEM_STATUSHOSTINTERFACE            = 'System\StatusHostInterface';
  KEY_SYSTEM_HOSTINTERFACEDATE              = 'System\HostInterfaceDate';
  KEY_SYSTEM_CHNO                           = 'System\ChNo';
  KEY_SYSTEM_REPORTLENGTH                   = 'System\ReportLength';
  KEY_SYSTEM_PORTRAIT_REPORTLENGTH          = 'System\PortraitReportLength';
  KEY_SYSTEM_DEBITEDITABLEFIELD             = 'System\DebitEditableField';
  KEY_SYSTEM_CREDITEDITABLEFIELD            = 'System\CreditEditableField';
  KEY_SYSTEM_AUTHORIZEALLENABLED            = 'System\AuthorizeAllEnabled';
  KEY_SYSTEM_REPORTSIGNEE                   = 'System\ReportSignee';
  KEY_SYSTEM_BACKUPDATASUFFIX               = 'System\BackupDataSuffix';
  KEY_SYSTEM_BACKUPLOGSUFFIX                = 'System\BackupLogSuffix';
  KEY_SYSTEM_AE_OFFLINE_VISIBLE 						= 'System\AEOfflineVisible';
  KEY_SYSTEM_AE_SEND_ACK_CREDIT_VISIBLE			= 'System\AESendACKCreditVisible';
	KEY_SYSTEM_AE_SEND_ACK_DEBIT_VISIBLE			= 'System\AESendACKDebitVisible';
  KEY_SYSTEM_AUTHORIZEUSERGROUP         		= 'System\AuthorizeUserGroup';
  KEY_SYSTEM_SPK_DKE_TYPE										= 'System\SPKDKEType';
  KEY_PRINTER_TELLSTROOK                    = 'Printer\Tellstrook';
  KEY_HOST_ADDRESS                          = 'Host\Address';
  KEY_HOST_USERNAME                         = 'Host\UserName';
  KEY_HOST_PASSWORD                         = 'Host\Password';
  KEY_HOST_PROGRAM                          = 'Host\Program';
  KEY_HOST_PROGRAMSUCCESSSTRING             = 'Host\ProgramSuccessString';
  KEY_HOST_PROGRAMFAILEDSTRING              = 'Host\ProgramFailedString';
  KEY_HOST_FILENAME                         = 'Host\Filename';
  KEY_HOST_LOCALFILENAME                    = 'Host\LocalFilename';
  KEY_HOST_DIRECTCLOSE                      = 'Host\DirectClose';
  KEY_LOADDLL_ONEOD                         = 'LoadDLL\OnEOD';
  KEY_LOADDLL_ONSOD                         = 'LoadDLL\OnSOD';
  KEY_LOADDLL_ONAUTHORIZE                   = 'LoadDLL\OnAuthorize';
  KEY_LOADDLL_ONEODITEM                     = 'LoadDLLOnEODItem';
  KEY_LOADDLL_ONSODITEM                     = 'LoadDLLOnSODItem';
  KEY_LOADDLL_ONAUTHORIZEITEM               = 'LoadDLLOnAuthorizeItem';
  KEY_LOADDLL_CONTINUEEODIFFAIL             = 'LoadDLL\ContinueEODIfFail';
  KEY_LOADDLL_CONTINUESODIFFAIL             = 'LoadDLL\ContinueSODIfFail';
  KEY_LOADDLL_CONTINUEAUTHORIZEIFFAIL       = 'LoadDLL\ContinueAuthorizeIfFail';
  KEY_CONTROLCN_EDITCONTROL                 = 'ControlCN\EditControl';
  KEY_CONTROLCN_CETAKBERITAACARA            = 'ControlCN\CetakBeritaAcara';
  KEY_CONTROLCN_SATKERPTR                   = 'ControlCN\SatKerPTR';
  KEY_CONTROLCN_VIEWBERITAACARACONTROL      = 'ControlCN\ViewBeritaAcaraControl';
  KEY_CONTROLCN_VIEWBERITAACARAAPPROVE      = 'ControlCN\ViewBeritaAcaraApprove';
  KEY_CONTROLCN_LEMBARBERITAACARA           = 'ControlCN\LembarBeritaAcara';
  KEY_CONTROLCN_REFERENCENOVISIBLE          = 'ControlCN\ReferenceNoVisible';
  KEY_CONTROLCN_SATKERSYSTEM                = 'ControlCN\SatKerSystem';
  KEY_AUTHGROUP_CETAKULANG                  = 'AuthGroup\CetakUlang';
  KEY_AUTHGROUP_EDITBATCH                   = 'AuthGroup\EditBatch';
  KEY_AUTHGROUP_PARABATCH                   = 'AuthGroup\ParaBatch';
  KEY_FIELDSIZE_REFERENCENO                 = 'FieldSize\ReferenceNo';
  KEY_FIELDSIZE_ACCOUNTNO                   = 'FieldSize\AccountNo';
  KEY_FIELDSIZE_OPACCOUNTNO                 = 'FieldSize\OPAccountNo';
  KEY_FIELDSIZE_CUSTNAME                    = 'FieldSize\CustName';
  KEY_FIELDSIZE_OPCUSTNAME                  = 'FieldSize\OPCustName';
  KEY_IMPORTIBANK_BANKNAMELENGTH            = 'ImportIBank\BankNameLength';
  KEY_SOD_TRANSFERTABLES                    = 'SOD\TransferTables';
  KEY_ACK_CHECK_FLAG                        = 'ACK\CheckFlag';    //30 Agustus 2005
  //14 November 2005
  KEY_BANK_BI_CREDITFEE											= 'Bank\BICreditFee';
  KEY_BANK_BI_DEBITFEE											= 'Bank\BIDebitFee';
  KEY_BANK_CPC_CREDITFEE										= 'Bank\CPCCreditFee';
  KEY_BANK_CPC_DEBITFEE											= 'Bank\CPCDebitFee';
  KEY_COMM_INBOXPATH                        = 'Comm\InboxPath';
  KEY_COMM_OUTBOXPATH                       = 'Comm\OutboxPath';
  KEY_ACK_RETURN_ENABLED										= 'ACK\ReturnEnabled';
  KEY_ACK_OUTWARD_ENABLED										= 'ACK\OutwardEnabled';
  KEY_ACK_RETURN_DLL_NAME										= 'ACK\Return\DllName';
  KEY_ACK_RETURN_CALL_FUNCTION							= 'ACK\Return\CallFunction';
  KEY_ACK_OUTWARD_DLL_NAME									= 'ACK\Outward\DllName';
  KEY_ACK_OUTWARD_CALL_FUNCTION							= 'ACK\Outward\CallFunction';
  KEY_ACK_OUTWARD_CREDIT_CALL_FUNCTION			= 'ACK\Outward\CreditCallFunction';
  KEY_ACK_OUTWARD_DEBIT_CALL_FUNCTION				= 'ACK\Outward\DebitCallFunction';

  KEY_TRANSFERHISTORY_OPTION                = 'TransferHistory\Option';
  KEY_TRANSFERHISTORY_BACKWARDDAYS          = 'TransferHistory\BackwardDays';

  KEY_INTERFACEFILE_ENCRYPTIONKEY           = 'InterfaceFile\EncryptionKey';
  KEY_INTERFACEFILE_DECRYPTENABLED          = 'InterfaceFile\DecryptEnabled';
  KEY_INTERFACEFILE_ENCRYPTENABLED   				= 'InterfaceFile\EncryptEnabled';
  KEY_INTERFACEFILE_INWARD_DECRYPTENABLED   = 'InterfaceFile\InwardDecryptEnabled';
  KEY_INTERFACEFILE_INWARD_ENCRYPTENABLED		= 'InterfaceFile\InwardEncryptEnabled';


  KEY_DATASNAP_FILEMANAGER_PORT             = 'DataSnap\FileManagerPort';
	KEY_SYSTEM_FEE_DEBET_CLEARING							= 'System\FeeDebetClearaing';
	KEY_SYSTEM_FEE_INTERCITY									= 'System\FeeIntercity';
  KEY_SYSTEM_INTERCITY_ACC_BCA							= 'System\IntercityAcc';

  //Self
  KEY_SYSTEM_INPUT_FOLDER										= 'System\DKIHostInputFolder';
  KEY_SYSTEM_OUTPUT_FOLDER									= 'System\DKIHostOutputFolder';
  KEY_SYSTEM_APP_VERSION										= 'System\AppVersion';
  KEY_SYSTEM_APPLICATION_PATH								= 'General\ApplicationPath';
  KEY_HI_DOWNLOAD_PROTOCOLTYPE              = 'FTP\DHProtocolType';
  KEY_HI_DOWNLOAD_DKO_FOLDER              	= 'FTP\DHDKOFolder';
  KEY_HI_DOWNLOAD_DPO_FOLDER              	= 'FTP\DHDPOFolder';
  KEY_HI_DOWNLOAD_DKO_FILENAME              = 'FTP\DHDKOFileName';
  KEY_HI_DOWNLOAD_DPO_FILENAME              = 'FTP\DHDPOFileName';
  KEY_HI_DOWNLOAD_FTP_ADDRESS	              = 'FTP\DHFTPAddress';
  KEY_HI_DOWNLOAD_FTP_PORT		              = 'FTP\DHFTPPort';
  KEY_HI_DOWNLOAD_FTP_USERNAME              = 'FTP\DHFTPUsername';
  KEY_HI_DOWNLOAD_FTP_PASSWORD              = 'FTP\DHFTPPassword';
  KEY_HI_DOWNLOAD_FTP_SOURCE_CR             = 'FTP\DHFTPCRSourcePath';
  KEY_HI_DOWNLOAD_FTP_SOURCE_DB             = 'FTP\DHFTPDBSourcePath';

  //Interface
  KEY_INTERFACE_DOWNLOAD_PATH_COUNT					= 'Interface\DownloadPathCount';
  KEY_INTERFACE_DOWNLOAD_PATH								= 'Interface\DownloadPath';
  KEY_INTERFACE_DOWNLOAD_FILE								= 'Interface\DownloadFile';

	KEY_BANK_SANDI_PESERTA_ACTIVE					    = 'Bank\SandiPesertaActive';
  KEY_TPK_WSDL_ADDRESS											= 'SPK\WSLDAddress';
  KEY_TPK_WSDL_AUTH_CODE										= 'SPK\WSLDAuthCode';
  KEY_SYSTEM_POLASIKLUS_OUTDB_ENABLED				= 'System\PolaSiklusKlrDebetEnable';
  KEY_SYSTEM_SANDI_ECHANEL									= 'System\SandiEChanel';
  //Self

  //INward Kedit
	KEY_SYSTEM_INWARD_HOST_INPUT_FOLDER   = 'System\InwardHostInputFolder';
	KEY_SYSTEM_INWARD_HOST_OUTPUT_FOLDER  = 'System\InwardHostOutputFolder';
  KEY_SYSTEM_DEFAULT_VIRTUALACCOUNT_ACCEPT_POSTING_CODE = 'System\DefaultVAAcceptPostingCode';
  KEY_BANK_INWARD_ACTIVE_BRANCHCODE		 	= 'Bank\InwardActiveBranchCode';
  KEY_SYSTEM_INWARD_PROMO_CODE					= 'System\InwardPromoCode';

  KEY_HOST_ADDRESS5                     = 'Host\Address5';
  KEY_HOST_USERNAME5                    = 'Host\UserName5';
  KEY_HOST_PASSWORD5                    = 'Host\Password5';
  KEY_HOST_TARGETPATH5                  = 'Host\TargetPath5';
  KEY_SYSTEM_INWARD_HOST_INPUT_FILENAME = 'System\DKIHostInputFileName';
  KEY_SYSTEM_DEFAULT_TSA_POSTING_CODE = 'System\DefaultTSAPostingCode';
  KEY_SYSTEM_GEN_DKI_FILENAME						= 'System\GenDKIFileName';
  KEY_SYSTEM_GEN_DKI_OUTFOLDER					= 'System\GenDKIOutFolder';
  KEY_SYSTEM_CURRENT_CYCLE							= 'System\CurrentCycle';
  KEY_SYSTEM_IB_PREFIX_REF						= 'System\IBPrefixRef';
  KEY_SYSTEM_DOWNLOAD_DKI_FROM_FTP			= 'System\DownloadDKIFromFTP';
  KEY_SYSTEM_GEN_DKI_AUTO_SEND_FTP 		= 'System\GenDKIAutoSendFTP';
  KEY_GEN_DKI_FTP_ADDRESS								= 'FTP\DKIFTPAddress';
  KEY_GEN_DKI_FTP_USERNAME							= 'FTP\DKIFTPUsername';
  KEY_GEN_DKI_FTP_PASSWORD							= 'FTP\DKIFTPPassword';
  KEY_GEN_DKI_FTP_PORT									= 'FTP\DKIFTPPort';
  KEY_GEN_DKI_FTP_TARGET_PATH						= 'FTP\DKIFTPTargetPath';

  KEY_DKI_HOST_IN_FTP_ADDRESS						= 'FTP\InDKIHOSTFTPAddress';
  KEY_DKI_HOST_IN_FTP_USERNAME					= 'FTP\InDKIHOSTFTPUsername';
  KEY_DKI_HOST_IN_FTP_PASSWORD					= 'FTP\InDKIHOSTFTPPassword';
  KEY_DKI_HOST_IN_FTP_PORT							= 'FTP\InDKIHOSTFTPPort';
  KEY_DKI_HOST_IN_FTP_PATH							= 'FTP\InDKIHOSTFTPPath';

  KEY_DKI_HOST_OUT_FTP_ADDRESS					= 'FTP\OutDKIHOSTFTPAddress';
  KEY_DKI_HOST_OUT_FTP_USERNAME					= 'FTP\OutDKIHOSTFTPUsername';
  KEY_DKI_HOST_OUT_FTP_PASSWORD					= 'FTP\OutDKIHOSTFTPPassword';
  KEY_DKI_HOST_OUT_FTP_PORT							= 'FTP\OutDKIHOSTFTPPort';
  KEY_DKI_HOST_OUT_FTP_PATH							= 'FTP\OutDKIHOSTFTPPath';
	KEY_KONVERSI_BANK_CODE                = 'Bank\ConvBankCode';

  KEY_SYSTEM_GEN_DPI_FILENAME						= 'System\GenDPIFileName';
  KEY_SYSTEM_GEN_DPI_OUTFOLDER					= 'System\GenDPIOutFolder';
  KEY_SYSTEM_GEN_DPI_AUTO_SEND_FTP 		  = 'System\GenDPIAutoSendFTP';
  KEY_GEN_DPI_FTP_ADDRESS								= 'FTP\DPIFTPAddress';
  KEY_GEN_DPI_FTP_USERNAME							= 'FTP\DPIFTPUsername';
  KEY_GEN_DPI_FTP_PASSWORD							= 'FTP\DPIFTPPassword';
  KEY_GEN_DPI_FTP_PORT									= 'FTP\DPIFTPPort';
  KEY_GEN_DPI_FTP_TARGET_PATH						= 'FTP\DPIFTPTargetPath';
  KEY_SYSTEM_INITIAL_CR_BATCH_NO_SPK	  = 'System\InitialCrBatchNoSPK';
  KEY_SYSTEM_INITIAL_DB_BATCH_NO_SPK	  = 'System\InitialDbBatchNoSPK';
  KEY_SYSTEM_PARTIAL_SYNC_OPSDATA					= 'System\PartialSyncOPSData';
  (* Konversi RTG -> G2 *)
  KEY_CONV_RTGS2G2_FileName							= 'CONV\RTGS2G2FileName';
  KEY_CONV_RTGS2G2_Folder							  = 'CONV\RTGS2G2Folder';
  KEY_CONV_RTGS2G2_MultipleConvert      = 'CONV\RTGS2G2MultipleConvert';
  KEY_CONV_RTGS2G2_LIST_TRN_CONVERT			= 'CONV\RTGS2G2ListTRNConvert';


  APP_LITE_VERSION					  = 1;
  APP_FULL_VERSION						= 2;

  BACKUP_AUTO                 = 1;
  BACKUP_MANUAL               = 2;

  DB_OWNER                    = 'dbo';

  //DB_TABLE_BANK                      = 'bank';
  //DB_TABLE_BANKBRANCH                = 'bankbranch';
  DB_TABLE_BRANCH                    = 'branch';
  DB_TABLE_HISTORYCREDIT             = 'documents_cr_history';
  DB_TABLE_HISTORYCREDIT_DOWNLOAD    = 'documents_cr_history_download';
  DB_TABLE_HISTORYDEBIT              = 'documents_history';
  DB_TABLE_HISTORYDEBIT_DOWNLOAD     = 'documents_history_download';
  //DB_TABLE_IBANK                     = 'ibank';
  DB_TABLE_HISTORY_INCREDITNOTES     = 'indocuments_cr_history';
  DB_TABLE_INCREDITNOTES             = 'indocuments_cr';
  DB_TABLE_INDOCUMENTS             	 = 'indocuments';
  DB_TABLE_INDOCUMENTS_HISTORY     	 = 'indocuments_history';
  DB_TABLE_OCERROR                   = 'doc_cr_error';
  DB_TABLE_OCHISTORY                 = 'oc_history';
  DB_TABLE_ODERROR                   = 'doc_error';
  DB_TABLE_ODHISTORY                 = 'od_history';
  DB_TABLE_OPERASIONALBANK           = 'OPERASIONAL_BANK';
  DB_TABLE_OPERASIONALWILAYAHKLIRING = 'OPERASIONAL_WILAYAH_KLIRING';
  DB_TABLE_OBERROR		               = 'ob_error';
  DB_TABLE_OUTBATCH                  = 'batch';
  DB_TABLE_OUTBATCH_HISTORY          = 'batch_history';
  DB_TABLE_OUTBATCH_ERROR            = 'batch_error';
  DB_TABLE_OUTBATCH_ERROR_HISTORY    = 'batch_error_history';
  DB_TABLE_OUTCREDITNOTES            = 'documents_cr';
  DB_TABLE_OUTDOCUMENTS              = 'documents';
  DB_TABLE_OUTDOCUMENTS_ERROR				 = 'doc_error';
	DB_TABLE_OUTDOCUMENTS_ERROR_HISTORY= 'doc_error_history';
  DB_TABLE_OUTDOCUMENTS_CR_ERROR			= 'doc_cr_error';
	DB_TABLE_OUTDOCUMENTS_CR_ERROR_HISTORY= 'doc_cr_error_history';
  DB_TABLE_PARAMS                    = 'params';
  DB_TABLE_POSTINGCODES              = 'PostingCodes';
  DB_TABLE_REF_ALASAN_PENOLAKAN      = 'REF_ALASAN_PENOLAKAN';
  DB_TABLE_REF_BANK                  = 'REF_BANK';
  DB_TABLE_REF_DAFTAR_HITAM          = 'REF_DAFTAR_HITAM';
  DB_TABLE_REF_INSTITUSI_BANK        = 'REF_INSTITUSI_BANK';
  DB_TABLE_REF_JENIS_BANK            = 'REF_JENIS_BANK';
  DB_TABLE_REF_JENIS_NASABAH         = 'REF_JENIS_NASABAH';
  DB_TABLE_REF_JENIS_TRANSAKSI       = 'REF_JENIS_TRANSAKSI';
  DB_TABLE_REF_JENIS_USAHA           = 'REF_JENIS_USAHA';
  DB_TABLE_REF_KANTOR_BANK           = 'REF_KANTOR_BANK';
  DB_TABLE_REF_KBI                   = 'REF_KBI';
  DB_TABLE_REF_KOTA                  = 'REF_KOTA';
  DB_TABLE_REF_PROPINSI              = 'REF_PROPINSI';
  DB_TABLE_REF_STATUS_PENDUDUK       = 'REF_STATUS_PENDUDUK';
  DB_TABLE_REF_STATUS_WARGA_NEGARA   = 'REF_STATUS_WARGA_NEGARA';
  DB_TABLE_REF_WILAYAH_KLIRING       = 'REF_WILAYAH_KLIRING';
  //DB_TABLE_VERIFYUSERS               = 'verifyusers';
  //DB_TABLE_FILE_HISTORY_LOG					 = 'file_history';
  //DB_TABLE_FILE_HISTORY_ERROR				 = 'file_history_error';
  DB_TABLE_USER											 = 'users';
  DB_TABLE_ACCESS										 = 'access';
  DB_TABLE_USER_GROUP								 = 'groups';
  DB_TABLE_GROUP_ACCESS							 = 'groupaccess';
  DB_TABLE_USER_LOGS								 = 'userlogs';
  DB_TABLE_USER_PARAMS							 = 'params';
  DB_TABLE_IREGION									 = 'iRegion';
  DB_TABLE_IBRANCH									 = 'iBranch';
  DB_TABLE_PASSWORD_LIST						 = 'passwordlist';
  DB_TABLE_TRX_LOGS								 	 = 'logs';
  DB_TABLE_REF_PESERTA							 = 'REF_PESERTA';
  DB_TABLE_OPS_PESERTA_DB						 = 'OPS_PESERTA_DB';
  DB_TABLE_OPS_PESERTA_KR						 = 'OPS_PESERTA_KR';
  DB_TABLE_OPS_WILAYAH_KLIRING			 = 'OPS_WILAYAH_KLIRING';
  DB_TABLE_REF_JENIS_KEPESERTAAN		 = 'REF_JENIS_KEPESERTAAN';
  DB_TABLE_REF_JENIS_SARANA_TRANSAKSI= 'REF_JENIS_SARANA_TRANSAKSI';
  DB_TABLE_REF_PESERTA_KONVERSI			 = 'REF_PESERTA_KONVERSI';
  DB_TABLE_REF_PESERTA_WILAYAH			 = 'REF_PESERTA_WILAYAH';
  DB_TABLE_REF_WILAYAH_KOTA					 = 'REF_WILAYAH_KOTA';
  DB_TABLE_REF_KPWDN								 = 'REF_KPWDN';
  DB_TABLE_OPS_ZONA_DB_INDV					 = 'OPS_ZONA_DB_INDV';
  DB_TABLE_REF_KODE_ERROR            = 'REF_KODE_ERROR';
  DB_TABLE_REF_HARI_LIBUR_WILAYAH		 = 'REF_HARI_LIBUR_WILAYAH';
  DB_TABLE_REF_HARI_LIBUR_NASIONAL   = 'REF_HARI_LIBUR_NASIONAL';
  DB_TABLE_VERIFYUSERS               = 'verifyusers';

  //Tabel Inward Kredit
  DB_TABLE_TITLES                    = 'titles';
  DB_TABLE_PREFIXREF								 = 'PrefixRef';
  DB_TABLE_BINS											 = 'bins';
  DB_TABLE_VIRTUALACCOUNT_PREFIX     = 'vaPrefixAccount';
  DB_TABLE_ACCOUNTPC                 = 'accountpc';
  DB_TABLE_REJECT_REASONS            = 'RejectReasons';  //tambahan 30 july 2005
  DB_TABLE_TSA											 = 'tsAccount';

  DB_TABLE_REF_KONVERSI_TC					 = 'REF_KONVERSI_TC';
  DB_TABLE_RTGS2SKN_HISTORY					 = 'RTGS2SKNHistory';
  DB_TABLE_RTGS2SWIFT_HISTORY				 = 'RTGSG1History';


  DELETE_AUTO       = 1;
  DELETE_MANUAL     = 2;
  DELETE_DB_SKN     = '1';
  DELETE_DB_INWARD  = '2';

  TRANSFER_HISTORYCREDIT  = 0;
  TRANSFER_OUTDOCUMENTS   = 1;
  TRANSFER_OUTCREDITNOTES = 2;

  // TRANSFER OPTION PARAMETER
  TRANSFER_OPTION_BY_FLAG = 1;
  TRANSFER_OPTION_BY_DATE = 2;

  // Registry Root Key Constanta
  REG_TYPE_HKCU  = 1;
  REG_TYPE_HKLM  = 2;

  //Step Proses
  SP_NEW = 0;
  SP_DOWNLOAD_BIMC = 1;
  SP_UPLOAD_DPO = 2;

  // Short Date Format
  //    English_UnitedStates
  SDF_ENGLISH_US = 'mm/dd/yyyy';
  SDF_ENGLISH_US_TIME = 'mm/dd/yyyy hh:nn:ss';

  TPK_CR_ERROR_TABLE : array[1..25,1..2] of string =
    (('9001','Nomor Referensi tidak boleh kosong (blank)'),
     ('9002','Nomor Urut tidak boleh kosong (blank)'),
     ('9004','Nama Pengirim tidak boleh kosong (blank)'),
     ('9005','Nama Penerima tidak boleh kosong (blank)'),
     ('9007','Nomor Rekening tidak boleh kosong (blank)'),
     ('9008','Untuk No Rekening ''0000000000000002''/Retur Kredit, data Keterangan harus diisi'),
     ('9009','Nilai Nominal tidak boleh = 0'),
     ('9010','Intitusi Sandi Bank Penerima'),
     ('9011','Pengiriman dalam satu Bank'),
     ('9012','Sandi Kliring Asal'),
     ('9013','Sandi Penyelenggara Asal'),
     ('9014','Sandi KBI Asal'),
     ('9016','bukan merupakan Sandi Transaksi Kredit'),
     ('9017','mempunyai capping 0'),
     ('9018','melewati capping'),
     ('9020','Sandi Jenis Usaha'),
     ('9021','Sandi Status Penduduk'),
     ('9022','Sandi Status Warga Negara'),
     ('9023','Sandi Propinsi'),
     ('9024','Sandi Kota Penerima'),
     ('9025','Sandi Penyelenggara Penerima'),
     ('9040','Institusi Bank Penerima'),
     ('9042','Jumlah Nominal dari Batch dengan Transaksi, tidak sama (Unbalance)'),
     ('9043','Jumlah Item dari Batch dengan Transaksi, tidak sama (Unbalance)'),
     ('9044','Jumlah Item dari Transaksi, tidak boleh > 200 warkat')
    );

  TPK_DB_ERROR_TABLE : array[1..17,1..2] of string =
    (('9101','Nomor Referensi tidak boleh kosong (blank)'),
     ('9102','Nomor Urut tidak boleh kosong (blank)'),
     ('9103','Nomor Warkat tidak boleh kosong (blank)'),
     ('9107','Nomor Rekening tidak boleh kosong (blank)'),
     ('9109','Nilai Nominal tidak boleh = 0'),
     ('9113','Sandi Penyelenggara Asal'),
     ('9116','bukan merupakan Sandi Transaksi Debet'),
     ('9115','Sandi Transaksi'),
     ('9117','mempunyai capping 0'),
     ('9118','melewati capping'),
     ('9126','Bank Penerima'),
     ('9127','Sandi Kliring Tertarik'),
     ('9128','Pengiriman dalam satu Kantor'),
     ('9129','tidak terdaftar sebagai peserta Intercity'),
     ('9142','Jumlah Nominal dari Batch dengan Transaksi, tidak sama (Unbalance)'),
     ('9143','Jumlah Item dari Batch dengan Transaksi, tidak sama (Unbalance)'),
     ('9144','Jumlah Item dari Transaksi, tidak boleh > 200 warkat')
    );

  TPK_RT_ERROR_TABLE : array[1..26,1..2] of string =
    (('9201','Nomor Referensi tidak boleh kosong (blank)'),
     ('9202','Nomor Urut tidak boleh kosong (blank)'),
     ('9203','Nomor Warkat tidak boleh kosong (blank)'),
     ('9206','Sandi Kliring Asal'),
     ('9207','Nomor Rekening tidak boleh kosong (blank)'),
     ('9209','Nilai Nominal tidak boleh = 0'),
     ('9210','Sandi Penyelenggara Asal'),
     ('9216','bukan merupakan Sandi Transaksi Debet'),
     ('9217','mempunyai capping 0'),
     ('9218','melewati capping'),
     ('9228','Pengiriman dalam satu Kantor'),
     ('9230','Nama Nasabah tidak boleh kosong (blank)'),
     ('9231','NPWP tidak boleh kosong untuk Badan Usaha atau badan Hukum (3/4)'),
     ('9232','Tanggal Lahir tidak boleh kosong (blank)'),
     ('9233','Nama Penarik tidak boleh kosong (blank)'),
     ('9234','Alamat tidak boleh kosong (blank)'),
     ('9235','Nama Kota tidak boleh kosong (blank)'),
     ('9236','Nama Propinsi tidak boleh kosong (blank)'),
     ('9237','tidak berada pada wilayah yang sama'),
     ('9238','Sandi Alasan Penolakan'),
     ('9239','Sandi Kliring Penarik'),
     ('9240','Institusi Bank Penerima (9999) Tidak Ikut Kliring'),
     ('9241','Tidak Ikut Kliring pada H-1'),
     ('9242','Jumlah Nominal dari Batch dengan Transaksi, tidak sama (Unbalance)'),
     ('9243','Jumlah Item dari Batch dengan Transaksi, tidak sama (Unbalance)'),
     ('9244','Jumlah Item dari Transaksi, tidak boleh > 200 warkat')
    );

var
  GlobalVarForm: TGlobalVarForm;

implementation

uses fGlobalVarDM, futils;
(*
function vld32InitModule(param:PChar):integer; external 'vldrule.dll';
function vld32GetLogPath(logPath:PChar):integer;external 'vldrule.dll';
function vld32DeInitModule:integer; external 'vldrule.dll';
*)

{$R *.dfm}

{ TGlobalVarForm }


procedure TGlobalVarForm.InitDB;
begin
  try
    if (DBType = 1) and (Trim(ExtractFileDir(DBDataSource)) = '') then
    	DBDataSource := ExtractFilePath(Application.ExeName) + 'DB';

    GlobalVarDM.MainADOConn.Connected:=False;
    if DBType = 1 then //Access
    begin
      GlobalVarDM.MainADOConn.ConnectionString:= 'Provider=Microsoft.Jet.OLEDB.4.0'+
                      ';User ID='+DBUsername+
                      ';Jet OLEDB:Database Password='+ DBPassword +
                      ';Data Source='+DBDataSource+'\' + DBMainDBName + '.MDB'+
                      ';Persist Security Info=' + BoolToStr(DBSecurityInfo,
                        True);
    end
    else begin
      GlobalVarDM.MainADOConn.ConnectionString := 'Provider=SQLOLEDB.1'+
                  ';User ID='+DBUsername+
                  ';Password='+DBPassword+
                  ';Data Source='+DBDataSource+
                  ';Initial Catalog='+ DBMainDBName+
                  ';Persist Security Info=' + BoolToStr(DBSecurityInfo,
                        True)
    end;
    GlobalVarDM.MainADOConn.Connected:=True;

    GlobalVarDM.DailyADOConn.Connected:=False;
    if DBType = 1 then
    begin
      GlobalVarDM.DailyADOConn.ConnectionString:= 'Provider=Microsoft.Jet.OLEDB.4.0'+
                      ';User ID='+DBUsername+
                      ';Jet OLEDB:Database Password='+DBPassword+
                      ';Data Source='+DBDataSource+'\' + DBDailyDBName + '.MDB'+
                      ';Persist Security Info=' + BoolToStr(DBSecurityInfo,
                        True)
    end
    else begin
      GlobalVarDM.DailyADOConn.ConnectionString := 'Provider=SQLOLEDB.1'+
                  ';User ID='+DBUsername+
                  ';Password='+DBPassword+
                  ';Data Source='+DBDataSource+
                  ';Initial Catalog='+ DBDailyDBName+
                  ';Persist Security Info=' + BoolToStr(DBSecurityInfo,
                        True)
    end;
    GlobalVarDM.DailyADOConn.Connected:=True;

    GlobalVarDM.paramsTable.Connection := GlobalVarDM.DailyADOConn;
    GlobalVarDM.paramsTable.TableName:= DB_TABLE_PARAMS;
    GlobalVarDM.paramsTable.Open;
    utilsTrxDate:=SystemToday;
    utilsInwardTrxDate:=SystemInwardToday;
  except
  	On E:Exception do
    begin
    	MessageDlgExs('Error Init database: ' + E.Message, mtError, ['&Ok'], 0);
    end;
  end;
end;

procedure TGlobalVarForm.DeInitDB;
begin
  try
    if GlobalVarDM.MainADOConn.Connected then
    	GlobalVarDM.MainADOConn.Close;
    if GlobalVarDM.DailyADOConn.Connected then
    	GlobalVarDM.DailyADOConn.Close;
  except
  	On E:Exception do
    begin
    	MessageDlgExs('Error DeInit database: ' + E.Message, mtError, ['&Ok'], 0);
    end;
  end;
end;

procedure TGlobalVarForm.InitDBTPK;
begin
  try
  	GlobalVarDM.DBTPKADOConn.Connected := False;
  	GlobalVarDM.DBTPKADOConn.ConnectionString := TPKConnectionString;
  	GlobalVarDM.DBTPKADOConn.Connected := True;
  Except
  	On E:Exception do
    begin
    	MessageDlgExs('Error Init SPK Database: ' + E.Message, mtError, ['&Ok'], 0);
    end;
  end;
end;


procedure TGlobalVarForm.InitReg;
var
  strCfg: string;
  tempBuff,pLogPath: PChar;
  strOriginalProfileRegistryKey: string;
  xmlNode: TJvSimpleXmlElem;
  xmlFileConfigApp : TJvAppXMLFileStorage;
begin
  //strOriginalProfileRegistryKey := ExtractFilePath(Application.ExeName) + 'Config.xml';
  strOriginalProfileRegistryKey := GetItem(FProfileRegistryKey,';',0);

  //xmlFileConfigApp := TJvAppXMLFileStorage.Create(nil);
  try
    (*
    try
    	xmlFileConfigApp.Location := flCustom;
      xmlFileConfigApp.ReadOnly := True;
      xmlFileConfigApp.FileName := strOriginalProfileRegistryKey;
      //xmlFileConfigApp.RootNodeName := 'Configuration';
    except
      on E: Exception do begin
        MessageDlgExs('Assign XML Filename: ' + E.Message, mtError, ['&Ok'],0);
        Exit;
      end;
    end;

   	xmlNode := xmlFileConfigApp.Xml.Root.Items.ItemNamed['SIK'];
    if xmlNode = nil then begin
      MessageDlgExs('Failed to load configuration for EZMENU node.',mtError,['&Ok'],0);
      Exit;
    end;


    FApplicationRegistryKey:= xmlFileConfigApp.ReadString('SIK\DBPath','');

    FApplicationDataPath := IncludeTrailingPathDelimiter(ExtractFilePath(FApplicationRegistryKey));
    ForceDirectories(FApplicationDataPath);

    tempBuff := StrAlloc(128);
    try
      StrPCopy(tempBuff,strOriginalProfileRegistryKey);
      vld32InitModule(tempBuff);
      try
        pLogPath := StrAlloc(256);
        try
          vld32GetLogPath(pLogPath);
          FLogPath:=StrPas(pLogPath);
          if Pos(':', FLogPath)=0 then
            FLogPath := IncludeTrailingPathDelimiter(FLogPath);
        finally
          StrDispose(pLogPath);
        end;
      finally
        vld32DeInitModule;
      end;
    finally
      StrDispose(tempBuff);
    end;
    *)

    //JvAppRegistryStorage1.Root:='Software\'+FApplicationRegistryKey;
    try
      JvAppRegistryStorage1.FileName := strOriginalProfileRegistryKey;//FApplicationRegistryKey;
    except
      on E: Exception do
        MessageDlgExs('GlobalVar.Assign XML Filename: ' + E.Message, mtError,['&Ok'],0);
    end;

    utilsMainDBName:=DBMainDBName;
    utilsDailyDBName:=DBDailyDBName;
		//utilsDailyInwardDebetDBName:=DBDailyInwardDebetDBName;
    //utilMonthlyRptDBName := DBMonthlyRptDBName;
    utilsDBOwnerName:=DB_OWNER;
  finally
	  xmlFileConfigApp.Free
    //FProfileRegistryKey := strOriginalProfileRegistryKey;
  end;
end;

{
procedure TGlobalVarForm.InitReg_old;
var
  ProfileRegistry:TRegIniFile;
  strCfg: string;
  btRegType: Byte;
  tempBuff,pLogPath: PChar;
  strOriginalProfileRegistryKey: string;
begin
  {
  ProfileRegistry:=TRegIniFile.Create;
  try
    ProfileRegistry.RootKey:=HKEY_CURRENT_USER;
    if ProfileRegistry.OpenKeyReadOnly('Software\'+FProfileRegistryKey) then
    begin
      FApplicationRegistryKey:=ProfileRegistry.ReadString('','ApplicationConfig','STPK');
      FLogPath := ProfileRegistry.ReadString('', 'LogPath',
          ExtractFilePath(ExtractFileDir(Application.ExeName)) + '0000\log');
    end
    else
    begin
      FApplicationRegistryKey:='STPK';
      FLogPath := ExtractFilePath(ExtractFileDir(Application.ExeName)) + '0000\log';
    end;
    JvAppRegistryStorage1.Root:='Software\'+FApplicationRegistryKey;
    utilsMainDBName:=DBMainDBName;
    utilsDailyDBName:=DBDailyDBName;
    utilsDBOwnerName:=DB_OWNER;
  finally
  	ProfileRegistry.CloseKey;
    ProfileRegistry.Free;
  end;
  }
{  strOriginalProfileRegistryKey := FProfileRegistryKey;
  ProfileRegistry:=TRegIniFile.Create;
  try
    strCfg:=LowerCase(Copy(Trim(FProfileRegistryKey),1,4));
    if (strCfg='hklm') or (strCfg='hkcu') then
    begin
      if strCfg='hklm' then btRegType:=REG_TYPE_HKLM
      else btRegType:=REG_TYPE_HKCU;
      strCfg:=FProfileRegistryKey;
      strCfg:=Copy(strCfg, Pos('\',strCfg)+1, Length(strCfg));
      FProfileRegistryKey := strCfg;
    end;

    case btRegType of
      REG_TYPE_HKCU: ProfileRegistry.RootKey := HKEY_CURRENT_USER;
      REG_TYPE_HKLM: ProfileRegistry.RootKey := HKEY_LOCAL_MACHINE;
      else
        ProfileRegistry.RootKey := HKEY_CURRENT_USER;
    end;

    if ProfileRegistry.OpenKeyReadOnly('Software\'+FProfileRegistryKey) then
    begin
      //FApplicationRegistryKey:=ProfileRegistry.ReadString('','ApplicationConfig','STPK');
      FApplicationRegistryKey:=ProfileRegistry.ReadString('','ApplicationConfig','C:\STPK.XML');
      //FLogPath := IncludeTrailingBackslash(ExpandFileName(ProfileRegistry.ReadString('','LogPath','.\Log')));
    end
    else
    begin
      FApplicationRegistryKey:='C:\STPK.XML';
      //FLogPath := ExpandFileName('.\log');
    end;
    FApplicationDataPath := IncludeTrailingPathDelimiter(ExtractFilePath(FApplicationRegistryKey));
    //ForceDirectories(FApplicationDataPath);

    tempBuff := StrAlloc(128);
    try
      StrPCopy(tempBuff,strOriginalProfileRegistryKey);
      vld32InitModule(tempBuff);
      try
        pLogPath := StrAlloc(256);
        try
          vld32GetLogPath(pLogPath);
          FLogPath:=StrPas(pLogPath);
          if Pos(':', FLogPath)=0 then
            FLogPath := IncludeTrailingPathDelimiter(FLogPath);
        finally
          StrDispose(pLogPath);
        end;
      finally
        vld32DeInitModule;
      end;
    finally
      StrDispose(tempBuff);
    end;

    //JvAppRegistryStorage1.Root:='Software\'+FApplicationRegistryKey;
    try
      JvAppRegistryStorage1.FileName := FApplicationRegistryKey;
    except
      on E: Exception do
        SendDebugEx('GlobalVar.Assign XML Filename: ' + E.Message, mtError);
    end;

    utilsMainDBName:=DBMainDBName;
    utilsDailyDBName:=DBDailyDBName;
		utilsDailyInwardDebetDBName:=DBDailyInwardDebetDBName;
    utilMonthlyRptDBName := DBMonthlyRptDBName;
    utilsDBOwnerName:=DB_OWNER;
  finally
    FProfileRegistryKey := strOriginalProfileRegistryKey;
    ProfileRegistry.CloseKey;
    ProfileRegistry.Free;
  end;
end;
}
procedure TGlobalVarForm.InitConfig;
begin
  InitReg;
  InitDB;
end;

procedure TGlobalVarForm.FormCreate(Sender: TObject);
begin
  FCipher:=TCipherManager.Create(Self);
  FCipher.Algorithm:='Blowfish';
  FCipher.InitKey(STR_CIPHER_KEY,nil);

  FCipher2:=TCipherManager.Create(Self);
  FCipher2.Algorithm:='Diamond II';
  FCipher2.InitKey(STR_CIPHER_KEY,nil);

  FProfileRegistryKey:='ezmenu';
end;

procedure TGlobalVarForm.FormDestroy(Sender: TObject);
begin
  FCipher.Free;
  FCipher2.Free;
end;

function TGlobalVarForm.GetMaxItemPerBatch: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_CONS_MAXITEMPERBATCH,200);
end;

procedure TGlobalVarForm.SetMaxItemPerBatch(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_CONS_MAXITEMPERBATCH,Value);
end;

function TGlobalVarForm.GetDBConnectionString: string;
var
	strConn:string;
begin
  Result:=FCipher.DecodeString(JvAppRegistryStorage1.ReadString(KEY_DB_CONNECTIONSTRING,
    ''));
end;

procedure TGlobalVarForm.SetDBConnectionString(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_CONNECTIONSTRING,FCipher.EncodeString(Value));
end;

function TGlobalVarForm.GetTPKConnectionString: string;
begin
  Result:=FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_TPK_CONNECTIONSTRING,''));
end;

procedure TGlobalVarForm.SetTPKConnectionString(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_TPK_CONNECTIONSTRING,FCipher.EncodeString(Value));
end;

function TGlobalVarForm.GetBankCode: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_BANK_CODE,'000');
end;

procedure TGlobalVarForm.SetBankCode(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_BANK_CODE,Value);
end;

function TGlobalVarForm.GetBankName: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_BANK_NAME,'Unknown');
end;

procedure TGlobalVarForm.SetBankName(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_BANK_NAME,Value);
end;

function TGlobalVarForm.GetBankShortName: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_BANK_SHORTNAME,'Unknown');
end;

procedure TGlobalVarForm.SetBankShortName(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_BANK_SHORTNAME,Value);
end;

function TGlobalVarForm.GetBankAccountBranch: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_BANK_ACCOUNTBRANCH,'0000');
end;

procedure TGlobalVarForm.SetBankAccountBranch(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_BANK_ACCOUNTBRANCH,Value);
end;

function TGlobalVarForm.GetBankActiveBranch: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_BANK_ACTIVEBRANCH,'0000');
end;

procedure TGlobalVarForm.SetBankActiveBranch(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_BANK_ACTIVEBRANCH,Value);
end;

function TGlobalVarForm.GetBankCPCBranch: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_BANK_CPCBRANCH,'0000');
end;

procedure TGlobalVarForm.SetBankCPCBranch(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_BANK_CPCBRANCH,Value);
end;

function TGlobalVarForm.GetBankCentreBranch: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_BANK_CENTREBRANCH,'0000');
end;

procedure TGlobalVarForm.SetBankCentreBranch(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_BANK_CENTREBRANCH,Value);
end;

function TGlobalVarForm.GetSystemLastDay: TDate;
var
  strValue: string;
begin
  strValue := JvAppDBStorage1.ReadString(KEY_SYSTEM_LASTDAY, FormatDateTime(SDF_ENGLISH_US, Date-1));
  Result := StrToDateTimeDef_EN_US(strValue, Date-1);
end;

procedure TGlobalVarForm.SetSystemLastDay(const Value: TDate);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_LASTDAY, FormatDateTime(SDF_ENGLISH_US, Value));
end;

function TGlobalVarForm.GetSystemNextDay: TDate;
var
  strValue: string;
begin
  strValue := JvAppDBStorage1.ReadString(KEY_SYSTEM_NEXTDAY, FormatDateTime(SDF_ENGLISH_US, Date+1));
  Result := StrToDateTimeDef_EN_US(strValue, Date+1);
end;

procedure TGlobalVarForm.SetSystemNextDay(const Value: TDate);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_NEXTDAY, FormatDateTime(SDF_ENGLISH_US, Value));
end;

function TGlobalVarForm.GetSystemToday: TDate;
var
  strValue: string;
begin
  strValue := JvAppDBStorage1.ReadString(KEY_SYSTEM_TODAY, FormatDateTime(SDF_ENGLISH_US, Date));
  Result := StrToDateTimeDef_EN_US(strValue, Date);
end;

procedure TGlobalVarForm.SetSystemToday(const Value: TDate);
begin
  //JvAppDBStorage1.WriteDateTime(KEY_SYSTEM_TODAY, Value);
  JvAppDBStorage1.WriteString(KEY_SYSTEM_TODAY, FormatDateTime(SDF_ENGLISH_US, Value));
end;

function TGlobalVarForm.GetSystemStatus: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_SYSTEM_STATUS, SYS_STATUS_CLOSED);
end;

procedure TGlobalVarForm.SetSystemStatus(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_SYSTEM_STATUS,Value);
end;

function TGlobalVarForm.GetTPKRootFolder: string;
begin
  Result:=IncludeTrailingBackslash(JvAppRegistryStorage1.ReadString(KEY_TPK_ROOTFOLDER, 'C:\SKN\TPK\'));
end;

procedure TGlobalVarForm.SetTPKRootFolder(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_TPK_ROOTFOLDER, Value);
end;

function TGlobalVarForm.GetDBMainDBName: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_MAINDBNAME,'DBSYS');
end;

procedure TGlobalVarForm.SetDBMainDBName(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_MAINDBNAME,Value);
  utilsMainDBName:=Value;
end;

function TGlobalVarForm.GetDBDailyDBName: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_DAILYDBNAME,'DBSIK');
end;

procedure TGlobalVarForm.SetDBDailyDBName(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_DAILYDBNAME,Value);
  utilsDailyDBName:=Value;
end;

function TGlobalVarForm.GetDBUserDBName: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_USERDBNAME,'ezskncpc');
end;

procedure TGlobalVarForm.SetDBUserDBName(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_USERDBNAME,Value);
end;

function TGlobalVarForm.GetDBParams: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_PARAMS,'');
end;

procedure TGlobalVarForm.SetDBParams(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_PARAMS,Value);
end;

function TGlobalVarForm.GetDBPassword: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_PASSWORD,'');
  if Result<>'' then Result:=FCipher.DecodeString(Result);
end;

procedure TGlobalVarForm.SetDBPassword(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_PASSWORD,FCipher.EncodeString(Value));
end;

function TGlobalVarForm.GetDBProvider: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_PROVIDER,'SQLOLEDB.1');
end;

procedure TGlobalVarForm.SetDBProvider(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_PROVIDER,Value);
end;

function TGlobalVarForm.GetDBUsername: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_USERNAME,'');
end;

procedure TGlobalVarForm.SetDBUsername(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_USERNAME,Value);
end;

function TGlobalVarForm.GetDBDataSource: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_DATASOURCE,'');
end;

procedure TGlobalVarForm.SetDBDataSource(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_DATASOURCE,Value);
end;

function TGlobalVarForm.GetDBDataFolder: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_DB_DATAFOLDER,'');
end;

procedure TGlobalVarForm.SetDBDataFolder(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_DB_DATAFOLDER,Value);
end;

function TGlobalVarForm.GetDBTrxLifeCycle: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_DB_TRXLIFECYCLE, 30);
end;

procedure TGlobalVarForm.SetDBTrxLifeCycle(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_DB_TRXLIFECYCLE, Value);
end;

function TGlobalVarForm.GetDBType: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_DB_TYPE, 1);
end;

procedure TGlobalVarForm.SetDBType(const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_DB_TYPE, Value);
end;

function TGlobalVarForm.GetDBBackupFolder: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_DB_BACKUPFOLDER,'');
end;

procedure TGlobalVarForm.SetDBBackupFolder(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_DB_BACKUPFOLDER,Value);
end;

function TGlobalVarForm.GetDBSharedBackupFolder: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_DB_SHAREDBACKUPFOLDER,'');
end;

procedure TGlobalVarForm.SetDBSharedBackupFolder(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_DB_SHAREDBACKUPFOLDER,Value);
end;

function TGlobalVarForm.GetSystemPowerEncode: Boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_POWERENCODE,True);
end;

procedure TGlobalVarForm.SetSystemPowerEncode(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_POWERENCODE,Value);
end;

function TGlobalVarForm.GetMaxAmountPerBatch: Currency;
begin
  Result:=JvAppDBStorage1.ReadFloat(KEY_CONS_MAXAMOUNTPERBATCH, 999999999999.99);
end;

procedure TGlobalVarForm.SetMaxAmountPerBatch(const Value: Currency);
begin
  JvAppDBStorage1.WriteFloat(KEY_CONS_MAXAMOUNTPERBATCH,Value);
end;

function TGlobalVarForm.GetDownloadSourcePathCount: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_DOWNLOAD_SOURCEPATHCOUNT,0);
end;

procedure TGlobalVarForm.SetDownloadSourcePathCount(const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_DOWNLOAD_SOURCEPATHCOUNT, Value);
end;

function TGlobalVarForm.GetDownloadSourcePath(Index: Integer): string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DOWNLOAD_SOURCEPATH+IntToStr(Index),'');
end;

procedure TGlobalVarForm.SetDownloadSourcePath(Index: Integer;
  const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DOWNLOAD_SOURCEPATH+IntToStr(Index), Value);
end;

function TGlobalVarForm.GetDownloadFilename: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DOWNLOAD_FILENAME,'');
end;

procedure TGlobalVarForm.SetDownloadFilename(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DOWNLOAD_FILENAME, Value);
end;

function TGlobalVarForm.GetHostInterfaceAutoConvert: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_HI_AUTOCONVERT,0);
end;

procedure TGlobalVarForm.SetHostInterfaceAutoConvert(const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_HI_AUTOCONVERT, Value);
end;

function TGlobalVarForm.GetHostInterfaceAutoConvertDelay: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_HI_AUTOCONVERTDELAY,60);
end;

procedure TGlobalVarForm.SetHostInterfaceAutoConvertDelay(
  const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_HI_AUTOCONVERTDELAY, Value);
end;

function TGlobalVarForm.GetHostInterfaceAutoResult: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_HI_AUTORESULT,0);
end;

procedure TGlobalVarForm.SetHostInterfaceAutoResult(const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_HI_AUTORESULT, Value);
end;

function TGlobalVarForm.GetHostInterfaceAutoResultDelay: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_HI_AUTORESULTDELAY,60);
end;

procedure TGlobalVarForm.SetHostInterfaceAutoResultDelay(
  const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_HI_AUTORESULTDELAY, Value);
end;

function TGlobalVarForm.GetHostInterfaceButtonViewLog: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_HI_BUTTONVIEWLOG,1);
end;

procedure TGlobalVarForm.SetHostInterfaceButtonViewLog(
  const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_HI_BUTTONVIEWLOG, Value);
end;

function TGlobalVarForm.GetHostInterfaceDownloadVisible: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_HI_DOWNLOADVISIBLE,1);
end;

procedure TGlobalVarForm.SetHostInterfaceDownloadVisible(
  const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_HI_DOWNLOADVISIBLE, Value);
end;

function TGlobalVarForm.GetHostInterfaceShowMessage: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_HI_SHOWMESSAGE,1);
end;

procedure TGlobalVarForm.SetHostInterfacetShowMessage(
  const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_HI_SHOWMESSAGE, Value);
end;

function TGlobalVarForm.GetHostInterfaceUploadVisible: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_HI_UPLOADVISIBLE,1);
end;

procedure TGlobalVarForm.SetHostInterfaceUploadVisible(
  const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_HI_UPLOADVISIBLE, Value);
end;

function TGlobalVarForm.GetHostInterfaceName: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_HI_NAME,'');
end;

procedure TGlobalVarForm.SetHostInterfaceName(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_HI_NAME, Value);
end;

function TGlobalVarForm.GetTableToTextDir: String;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_SYSTEM_TABLETOTEXTDIR,
    ExtractFileDir(Application.ExeName));
end;

procedure TGlobalVarForm.SetTableToTextDir(const Value: String);
begin
  JvAppRegistryStorage1.WriteString(KEY_SYSTEM_TABLETOTEXTDIR, Value);
end;

function TGlobalVarForm.GetDBDailyInwardDBName: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_DAILYINWARDDBNAME,'skn_smiw');
end;

procedure TGlobalVarForm.SetDBDailyInwardDBName(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_DAILYINWARDDBNAME,Value);
  utilsDailyInwardDBName:=Value;
end;

function TGlobalVarForm.GetSystemInwardToday: TDate;
var
  strValue: string;
begin
  strValue := JvAppDBStorage1.ReadString(KEY_SYSTEM_INWARDTODAY, FormatDateTime(SDF_ENGLISH_US, Date));
  Result := StrToDateTimeDef_EN_US(strValue, Date);
end;

procedure TGlobalVarForm.SetSystemInwardToday(const Value: TDate);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_INWARDTODAY, FormatDateTime(SDF_ENGLISH_US, Value));
end;

function TGlobalVarForm.GetSystemInwardStatus: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_SYSTEM_INWARDSTATUS, SYS_STATUS_CLOSED);
end;

procedure TGlobalVarForm.SetSystemInwardStatus(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_SYSTEM_INWARDSTATUS,Value);
end;

function TGlobalVarForm.GetSystemDefaultPostingCode: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_DEFAULTPOSTINGCODE,'');
end;

procedure TGlobalVarForm.SetSystemDefaultPostingCode(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_DEFAULTPOSTINGCODE,Value);
end;

function TGlobalVarForm.GetSystemVerifyUsergroup: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_VERIFYUSERGROUP,'operator');
end;

procedure TGlobalVarForm.SetSystemVerifyUsergroup(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_VERIFYUSERGROUP,Value);
end;

function TGlobalVarForm.GetSystemInwardEnabled: boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_INWARDENABLED,False);
end;

function TGlobalVarForm.GetSystemOutwardEnabled: boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_OUTWARDENABLED,True);
end;

function TGlobalVarForm.GetSystemPrintCreditNotes: boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_PRINTCREDITNOTES,False);
end;

function TGlobalVarForm.GetSystemInwardHostOutputFolder: string;
begin
  Result:=IncludeTrailingBackslash(JvAppDBStorage1.ReadString(KEY_SYSTEM_INWARD_HOST_OUTPUT_FOLDER,'C:\'));
end;

function TGlobalVarForm.GetSystemReturnEnabled: boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_RETURNENABLED,False);
end;

procedure TGlobalVarForm.SetSystemInwardEnabled(const Value: boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_INWARDENABLED, Value);
end;

procedure TGlobalVarForm.SetSystemOutwardEnabled(const Value: boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_OUTWARDENABLED, Value);
end;

procedure TGlobalVarForm.SetSystemPrintCreditNotes(const Value: boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_PRINTCREDITNOTES, Value);
end;

procedure TGlobalVarForm.SetSystemReturnEnabled(const Value: boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_RETURNENABLED, Value);
end;

function TGlobalVarForm.GetDownloadAutoBatch: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_DOWNLOAD_AUTOBATCH, FALSE);
end;

function TGlobalVarForm.GetDownloadHostActive: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_DOWNLOAD_HOSTACTIVE, TRUE);
end;

procedure TGlobalVarForm.SetDownloadAutoBatch(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_DOWNLOAD_AUTOBATCH, VALUE);
end;

procedure TGlobalVarForm.SetDownloadHostActive(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_DOWNLOAD_HOSTACTIVE, VALUE);
end;

function TGlobalVarForm.GetSystemStatusHostInterface: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_SYSTEM_STATUSHOSTINTERFACE, SYS_STATUS_HI_INACTIVE);
end;

procedure TGlobalVarForm.SetSystemStatusHostInterface(
  const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_SYSTEM_STATUSHOSTINTERFACE,Value);
end;

function TGlobalVarForm.GetSystemChno: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_SYSTEM_CHNO,0);
end;

procedure TGlobalVarForm.SetSystemChno(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_SYSTEM_CHNO,Value);
end;

function TGlobalVarForm.GetSystemHostInterfaceDate: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_HOSTINTERFACEDATE,'');
end;

procedure TGlobalVarForm.SetSystemHostIntefaceDate(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_HOSTINTERFACEDATE, Value);
end;

function TGlobalVarForm.GetHostAddress: string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_HOST_ADDRESS,'10.104.5.2');
end;

function TGlobalVarForm.GetHostDirectClose: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_HOST_DIRECTCLOSE, False );
end;

function TGlobalVarForm.GetHostFilename: string;
begin
  Result := BuildText(JvAppDBStorage1.ReadString(KEY_HOST_FILENAME,'llg.data'));
end;

function TGlobalVarForm.GetHostLocalFilename: string;
begin
  Result := BuildText(JvAppDBStorage1.ReadString(KEY_HOST_LOCALFILENAME,'c:\temp\llg.data'));
end;

function TGlobalVarForm.GetHostPassword: string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_HOST_PASSWORD,'pass');
end;

function TGlobalVarForm.GetHostProgram: string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_HOST_PROGRAM,'llg');
end;

function TGlobalVarForm.GetHostProgramFailedString: string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_HOST_PROGRAMFAILEDSTRING,'');
end;

function TGlobalVarForm.GetHostProgramSuccessString: string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_HOST_PROGRAMSUCCESSSTRING,'CP LOGOFF');
end;

function TGlobalVarForm.GetHostUserName: string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_HOST_USERNAME,'NTKRD');
end;

procedure TGlobalVarForm.SetHostAddress(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_HOST_ADDRESS,Value);
end;

procedure TGlobalVarForm.SetHostDirectClose(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_HOST_DIRECTCLOSE,Value);
end;

procedure TGlobalVarForm.SetHostFilename(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_HOST_FILENAME,Value);
end;
procedure TGlobalVarForm.SetSystemInwardHostOutputFolder(
  const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_INWARD_HOST_OUTPUT_FOLDER,Value);
end;

procedure TGlobalVarForm.SetHostLocalFilename(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_HOST_LOCALFILENAME,Value);
end;

procedure TGlobalVarForm.SetHostPassword(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_HOST_PASSWORD,Value);
end;

procedure TGlobalVarForm.SetHostProgram(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_HOST_PROGRAM,Value);
end;

procedure TGlobalVarForm.SetHostProgramFailedString(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_HOST_PROGRAMFAILEDSTRING,Value);
end;

procedure TGlobalVarForm.SetHostProgramSuccessString(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_HOST_PROGRAMSUCCESSSTRING,Value);
end;

procedure TGlobalVarForm.SetHostUserName(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_HOST_Username,Value);
end;

function TGlobalVarForm.GetLoadDLLOnSOD: Integer;
begin
  Result := JvAppDBStorage1.ReadInteger(KEY_LOADDLL_ONSOD, 0);
end;

procedure TGlobalVarForm.SetLoadDLLOnSOD(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_LOADDLL_ONSOD,Value);
end;

function TGlobalVarForm.GetValueDLLOnSOD(Index: Integer): string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_LOADDLL_ONSODITEM + '\' +
      IntToStr(Index), '');
end;

procedure TGlobalVarForm.SetValueDLLOnSOD(Index: Integer;
  Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_LOADDLL_ONSODITEM + '\' + IntToStr(Index),
    Value);
end;

function TGlobalVarForm.GetLoadDLLOnEOD: Integer;
begin
  Result := JvAppDBStorage1.ReadInteger(KEY_LOADDLL_ONEOD, 0);
end;

procedure TGlobalVarForm.SetLoadDLLOnEOD(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_LOADDLL_ONEOD,Value);
end;

function TGlobalVarForm.GetValueDLLOnEOD(Index: Integer): string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_LOADDLL_ONEODITEM + '\' +
      IntToStr(Index), '');
end;

procedure TGlobalVarForm.SetValueDLLOnEOD(Index: Integer;
  Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_LOADDLL_ONEODITEM + '\' + IntToStr(Index),
    Value);
end;

function TGlobalVarForm.GetContinueSODIfFail: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_LOADDLL_CONTINUESODIFFAIL, True);
end;

procedure TGlobalVarForm.SetContinueSODIfFail(const Value: boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_LOADDLL_CONTINUESODIFFAIL, Value);
end;

function TGlobalVarForm.GetContinueEODIfFail: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_LOADDLL_CONTINUESODIFFAIL, True);
end;

procedure TGlobalVarForm.SetContinueEODIfFail(const Value: boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_LOADDLL_CONTINUESODIFFAIL, Value);
end;

function TGlobalVarForm.GetTPKDBType: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_TPK_DBTYPE,'');
end;

procedure TGlobalVarForm.SetTPKDBType(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_TPK_DBTYPE,Value);
end;

function TGlobalVarForm.GetAuthGroupCetakUlang: string;
begin
  Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_AUTHGROUP_CETAKULANG, ''));
end;

function TGlobalVarForm.GetAuthGroupEditBatch: string;
begin
 Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_AUTHGROUP_EDITBATCH, ''));
end;

function TGlobalVarForm.GetAuthGroupParaBatch: string;
begin
  Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_AUTHGROUP_PARABATCH, ''));
end;

function TGlobalVarForm.GetControlCNCetakBeritaAcara: Boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_CONTROLCN_CETAKBERITAACARA,True);
end;

function TGlobalVarForm.GetControlCNEditControl: Integer;
begin
  Result := JvAppDBStorage1.ReadInteger(KEY_CONTROLCN_EDITCONTROL, 0);
end;

function TGlobalVarForm.GetControlCNSatKerPTR: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_CONTROLCN_SATKERPTR,'');
end;

function TGlobalVarForm.GetControlCNViewBeritaAcaraApprove: Boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_CONTROLCN_VIEWBERITAACARAAPPROVE,True);
end;

function TGlobalVarForm.GetControlCNViewBeritaAcaraControl: Boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_CONTROLCN_VIEWBERITAACARACONTROL,True);
end;

procedure TGlobalVarForm.SetAuthGroupCetakUlang(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_AUTHGROUP_CETAKULANG,FCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetAuthGroupEditBatch(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_AUTHGROUP_EDITBATCH,FCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetAuthGroupParaBatch(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_AUTHGROUP_PARABATCH,FCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetControlCNCetakBeritaAcara(
  const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_CONTROLCN_CETAKBERITAACARA,Value);
end;

procedure TGlobalVarForm.SetControlCNEditControl(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_CONTROLCN_EDITCONTROL,Value);
end;

procedure TGlobalVarForm.SetControlCNSatKerPTR(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_CONTROLCN_SATKERPTR,Value);
end;

procedure TGlobalVarForm.SetControlCNViewBeritaAcaraApprove(
  const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_CONTROLCN_VIEWBERITAACARAAPPROVE,Value);
end;

procedure TGlobalVarForm.SetControlCNViewBeritaAcaraControl(
  const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_CONTROLCN_VIEWBERITAACARACONTROL,Value);
end;

function TGlobalVarForm.GetFieldSizeAccountNo: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_FIELDSIZE_ACCOUNTNO, 10);
end;

function TGlobalVarForm.GetFieldSizeCustName: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_FIELDSIZE_CUSTNAME, 64);
end;

function TGlobalVarForm.GetFieldSizeOPAccountNo: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_FIELDSIZE_OPACCOUNTNO, 9);
end;

function TGlobalVarForm.GetFieldSizeOPCustName: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_FIELDSIZE_OPCUSTNAME, 64);
end;

function TGlobalVarForm.GetFieldSizeReferenceNo: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_FIELDSIZE_REFERENCENO, 16);
end;

procedure TGlobalVarForm.SetFieldSizeAccountNo(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_FIELDSIZE_ACCOUNTNO,Value);
end;

procedure TGlobalVarForm.SetFieldSizeCustName(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_FIELDSIZE_CUSTNAME,Value);
end;

procedure TGlobalVarForm.SetFieldSizeOPAccountNo(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_FIELDSIZE_OPACCOUNTNO,Value);
end;

procedure TGlobalVarForm.SetFieldSizeOPCustName(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_FIELDSIZE_OPCUSTNAME,Value);
end;

procedure TGlobalVarForm.SetFieldSizeReferenceNo(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_FIELDSIZE_REFERENCENO,Value);
end;

function TGlobalVarForm.GetControlCNLembarBeritaAcara: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_CONTROLCN_LEMBARBERITAACARA, 2);
end;

procedure TGlobalVarForm.SetControlCNLembarBeritaAcara(
  const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_CONTROLCN_LEMBARBERITAACARA,Value);
end;

function TGlobalVarForm.GetMaxAmountRTGS: Currency;
begin
  Result:=JvAppDBStorage1.ReadFloat(KEY_CONS_MAXAMOUNTRTGS, 100000000);
end;

procedure TGlobalVarForm.SetMaxAmountRTGS(const Value: Currency);
begin
  JvAppDBStorage1.WriteFloat(KEY_CONS_MAXAMOUNTRTGS,Value);
end;

function TGlobalVarForm.GetSystemReportLength: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_SYSTEM_REPORTLENGTH, 57);
end;

procedure TGlobalVarForm.SetSystemReportLength(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_SYSTEM_REPORTLENGTH,Value);
end;

function TGlobalVarForm.GetControlCNReferenceNoVisible: Boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_CONTROLCN_REFERENCENOVISIBLE, TRUE);
end;

function TGlobalVarForm.GetControlCNSatKerSystem: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_CONTROLCN_SATKERSYSTEM, '100');
end;

procedure TGlobalVarForm.SetControlCNReferenceNoVisible(
  const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_CONTROLCN_REFERENCENOVISIBLE,Value);
end;

procedure TGlobalVarForm.SetControlCNSatKerSystem(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_CONTROLCN_SATKERSYSTEM,Value);
end;

function TGlobalVarForm.GetDownloadCRCChecked: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_DOWNLOAD_CRCCHECKED, TRUE);
end;

procedure TGlobalVarForm.SetDownloadCRCChecked(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_DOWNLOAD_CRCCHECKED, VALUE);
end;

function TGlobalVarForm.GetDownloadStringCekList: string;
begin
  Result := FCipher2.DecodeString(JvAppDBStorage1.ReadString(KEY_DOWNLOAD_STRINGCEKLIST,''));
end;

procedure TGlobalVarForm.SetDownloadStringCekList(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_DOWNLOAD_STRINGCEKLIST,FCipher2.EncodeString(Value));
end;

function TGlobalVarForm.GetDownloadAltFilename: string;
begin
  Result := JvAppRegistryStorage1.ReadString(KEY_DOWNLOAD_ALTFILENAME,'');
end;

function TGlobalVarForm.GetDownloadAltSourcePath(Index: Integer): string;
begin
  Result := IncludeTrailingBackslash(JvAppRegistryStorage1.ReadString(KEY_DOWNLOAD_ALTSOURCEPATH+IntToStr(Index),''));
end;

function TGlobalVarForm.GetDownloadAltSourcePathCount: Integer;
begin
  Result := JvAppRegistryStorage1.ReadInteger(KEY_DOWNLOAD_ALTSOURCEPATHCOUNT,0);
end;

procedure TGlobalVarForm.SetDownloadAltFilename(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DOWNLOAD_ALTFILENAME,Value);
end;

procedure TGlobalVarForm.SetDownloadAltSourcePath(Index: Integer;
  const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DOWNLOAD_ALTSOURCEPATH+IntToStr(Index),Value);
end;

procedure TGlobalVarForm.SetDownloadAltSourcePathCount(
  const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_DOWNLOAD_ALTSOURCEPATHCOUNT,Value);
end;

function TGlobalVarForm.GetUploadTargetFilename: string;
begin
  Result := JvAppRegistryStorage1.ReadString(KEY_UPLOAD_TARGETFILENAME,'');
end;

function TGlobalVarForm.GetUploadTargetPath: string;
begin
  Result := IncludeTrailingBackslash(JvAppRegistryStorage1.ReadString(KEY_UPLOAD_TARGETPATH,''));
end;

procedure TGlobalVarForm.SetUploadTargetFilename(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_UPLOAD_TARGETFILENAME,Value);
end;

procedure TGlobalVarForm.SetUploadTargetPath(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_UPLOAD_TARGETPATH,Value);
end;

function TGlobalVarForm.GetIBankNameLength: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_IMPORTIBANK_BANKNAMELENGTH, 40);
end;

procedure TGlobalVarForm.SetIBankNameLength(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_IMPORTIBANK_BANKNAMELENGTH, Value);
end;

function TGlobalVarForm.GetSODTransferTables: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_SOD_TRANSFERTABLES, 1);
end;

procedure TGlobalVarForm.SetSODTransferTables(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_SOD_TRANSFERTABLES, Value);
end;

function TGlobalVarForm.GetSystemDebitEditableField: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_DEBITEDITABLEFIELD, '0;0;0;0;1;1;1;1;1;1');
end;

procedure TGlobalVarForm.SetSystemDebitEditableField(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_DEBITEDITABLEFIELD, Value);
end;

function TGlobalVarForm.GetSystemCreditEditableField: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_CREDITEDITABLEFIELD, '0;0;1;0;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;1;0');
end;

procedure TGlobalVarForm.SetSystemCreditEditableField(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_CREDITEDITABLEFIELD, Value);
end;

function TGlobalVarForm.GetPrinterTellstrook: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_PRINTER_TELLSTROOK, '--none--');
end;

procedure TGlobalVarForm.SetPrinterTellStrook(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_PRINTER_TELLSTROOK, Value);
end;

function TGlobalVarForm.GetSystemAuthorizeAllEnabled: Boolean;
begin
  Result:=JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_AUTHORIZEALLENABLED, False);
end;

procedure TGlobalVarForm.SetSystemAuthorizeAllEnabled(
  const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_AUTHORIZEALLENABLED, Value);
end;

function TGlobalVarForm.GetTPKBatchPerTransfer: Integer;
begin
  //Result:=JvAppDBStorage1.ReadInteger(KEY_TPK_BATCHPERTRANSFER,10);
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_TPK_BATCHPERTRANSFER,10);
end;

procedure TGlobalVarForm.SetTPKBatchPerTransfer(const Value: Integer);
begin
  //JvAppDBStorage1.WriteInteger(KEY_TPK_BATCHPERTRANSFER, Value);
  JvAppRegistryStorage1.WriteInteger(KEY_TPK_BATCHPERTRANSFER, Value);
end;

function TGlobalVarForm.GetDownloadTargetPath(Index: Integer): string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DOWNLOAD_TARGETPATH+IntToStr(Index),'');
end;

function TGlobalVarForm.GetDownloadTargetPathCount: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_DOWNLOAD_TARGETPATHCOUNT,0);
end;

procedure TGlobalVarForm.SetDownloadTargetPath(Index: Integer;
  const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DOWNLOAD_TARGETPATH+IntToStr(Index),Value);
end;

procedure TGlobalVarForm.SetDownloadTargetPathCount(const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_DOWNLOAD_TARGETPATHCOUNT,Value);
end;

function TGlobalVarForm.GetTPKTextFileName(Index: Integer): string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_TPK_TEXTFILENAME+IntToStr(Index),'');
  if Result='' then
  begin
    case Index of
      1  : Result:='OPERASIONAL_BANK.TXT';
      2  : Result:='OPERASIONAL_WILAYAH_KLIRING.TXT';
      3  : Result:='REF_BANK.TXT';
      4  : Result:='REF_DAFTAR_HITAM.TXT';
      5  : Result:='REF_INSTITUSI_BANK.TXT';
      6  : Result:='REF_JENIS_BANK.TXT';
      7  : Result:='REF_JENIS_NASABAH.TXT';
      8  : Result:='REF_JENIS_TRANSAKSI.TXT';
      9  : Result:='REF_JENIS_USAHA.TXT';
      10 : Result:='REF_KANTOR_BANK.TXT';
      11 : Result:='REF_KOTA.TXT';
      12 : Result:='REF_PROPINSI.TXT';
      13 : Result:='REF_STATUS_PENDUDUK.TXT';
      14 : Result:='REF_STATUS_WARGA_NEGARA.TXT';
      15 : Result:='REF_WILAYAH_KLIRING.TXT';
      16 : Result:='REF_KBI.TXT';
      17 : Result:='REF_ALASAN_PENOLAKAN.TXT';
    end;
  end;
end;

procedure TGlobalVarForm.SetTPKTextFileName(Index: Integer;
  const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_TPK_TEXTFILENAME+IntToStr(Index),Value);
end;

function TGlobalVarForm.getACKCheckFlag: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_ACK_CHECK_FLAG, '10');
end;

procedure TGlobalVarForm.setACKCheckFlag(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_ACK_CHECK_FLAG, Value);
end;

function TGlobalVarForm.GetSystemReportSignee: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_REPORTSIGNEE, 'PEJABAT YANG BERWENANG');
end;

procedure TGlobalVarForm.SetSystemReportSignee(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_REPORTSIGNEE, Value);
end;

function TGlobalVarForm.GetSystemBackupDataSuffix: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_BACKUPDATASUFFIX, 'Dat');
end;

function TGlobalVarForm.GetSystemBackupLogSuffix: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_BACKUPLOGSUFFIX, 'Log');
end;

procedure TGlobalVarForm.SetBackupDataSuffix(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_BACKUPDATASUFFIX, Value);
end;

procedure TGlobalVarForm.SetBackupLogSuffix(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_BACKUPLOGSUFFIX, Value);
end;

function TGlobalVarForm.GetDownloadAlt2Filename: string;
begin
  Result := JvAppRegistryStorage1.ReadString(KEY_DOWNLOAD_ALT2FILENAME,'');
end;

procedure TGlobalVarForm.SetDownloadAlt2Filename(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DOWNLOAD_ALT2FILENAME,Value);
end;

function TGlobalVarForm.GetDownloadAlt2SourcePath(Index: Integer): string;
begin
  Result := IncludeTrailingBackslash(JvAppRegistryStorage1.ReadString(KEY_DOWNLOAD_ALT2SOURCEPATH+IntToStr(Index),''));
end;

procedure TGlobalVarForm.SetDownloadAlt2SourcePath(Index: Integer;
  const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DOWNLOAD_ALT2SOURCEPATH+IntToStr(Index),Value);
end;

function TGlobalVarForm.GetDownloadAlt2SourcePathCount: Integer;
begin
  Result := JvAppRegistryStorage1.ReadInteger(KEY_DOWNLOAD_ALT2SOURCEPATHCOUNT,0);
end;

procedure TGlobalVarForm.SetDownloadAlt2SourcePathCount(
  const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_DOWNLOAD_ALT2SOURCEPATHCOUNT,Value);
end;

function TGlobalVarForm.GetBICreditFee: Double;
begin
	Result:= JvAppDBStorage1.ReadFloat(KEY_BANK_BI_CREDITFEE,0);
end;

function TGlobalVarForm.GetBIDebitFee: Double;
begin
	Result:= JvAppDBStorage1.ReadFloat(KEY_BANK_BI_DEBITFEE,0);
end;

function TGlobalVarForm.GetCPCCreditFee: Double;
begin
	Result:= JvAppDBStorage1.ReadFloat(KEY_BANK_CPC_CREDITFEE,0);
end;

function TGlobalVarForm.GetCPCDebitFee: Double;
begin
	Result:= JvAppDBStorage1.ReadFloat(KEY_BANK_CPC_DEBITFEE,0);
end;

procedure TGlobalVarForm.SetBICreditFee(value: Double);
begin
	JvAppDBStorage1.WriteFloat(KEY_BANK_BI_CREDITFEE,value);
end;

procedure TGlobalVarForm.SetBIDebitFee(value: Double);
begin
	JvAppDBStorage1.WriteFloat(KEY_BANK_BI_DEBITFEE,value);
end;

procedure TGlobalVarForm.SetCPCCreditFee(value: Double);
begin
	JvAppDBStorage1.WriteFloat(KEY_BANK_CPC_CREDITFEE,value);
end;

procedure TGlobalVarForm.SetCPCDebitFee(value: Double);
begin
	JvAppDBStorage1.WriteFloat(KEY_BANK_CPC_DEBITFEE,value);
end;

function TGlobalVarForm.GetDownloadSourceFileName(Index: Integer): string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DOWNLOAD_SOURCEFILENAME+IntToStr(Index),'');
end;

procedure TGlobalVarForm.SetDownloadSourceFileName(Index: Integer;
  const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DOWNLOAD_SOURCEFILENAME+IntToStr(Index), Value);
end;

function TGlobalVarForm.GetDownloadAltSourceFileName(
  Index: Integer): string;
begin
  Result := JvAppRegistryStorage1.ReadString(KEY_DOWNLOAD_ALTSOURCEFILENAME+IntToStr(Index),'');
end;

procedure TGlobalVarForm.SetDownloadAltSourceFileName(Index: Integer;
  const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DOWNLOAD_ALTSOURCEFILENAME+IntToStr(Index),Value);
end;

function TGlobalVarForm.GetUploadDBCancelRejectBatch: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_UPLOAD_DBCANCELREJECTBATCH, True);
end;

function TGlobalVarForm.GetUploadDBUpdateInSSKStatus: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_UPLOAD_DBUPDATEINSSKSTATUS, True);
end;

function TGlobalVarForm.GetUploadDBUpdateInTPKStatus: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_UPLOAD_DBUPDATEINTPKSTATUS, True);
end;

function TGlobalVarForm.GetUploadDBUpdateRejectBatch: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_UPLOAD_DBUPDATEREJECTBATCH, True);
end;

procedure TGlobalVarForm.SetUploadDBCancelRejectBatch(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_UPLOAD_DBCANCELREJECTBATCH, Value);
end;

procedure TGlobalVarForm.SetUploadDBUpdateInSSKStatus(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_UPLOAD_DBUPDATEINSSKSTATUS, Value);
end;

procedure TGlobalVarForm.SetUploadDBUpdateInTPKStatus(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_UPLOAD_DBUPDATEINTPKSTATUS, Value);
end;

procedure TGlobalVarForm.SetUploadDBUpdateRejectBatch(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_UPLOAD_DBUPDATEREJECTBATCH, Value);
end;

function TGlobalVarForm.GetUploadRTCancelRejectBatch: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_UPLOAD_RTCANCELREJECTBATCH, True);
end;

function TGlobalVarForm.GetUploadRTUpdateInSSKStatus: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_UPLOAD_RTUPDATEINSSKSTATUS, True);
end;

function TGlobalVarForm.GetUploadRTUpdateInTPKStatus: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_UPLOAD_RTUPDATEINTPKSTATUS, True);
end;

function TGlobalVarForm.GetUploadRTUpdateRejectBatch: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_UPLOAD_RTUPDATEREJECTBATCH, True);
end;

procedure TGlobalVarForm.SetUploadRTCancelRejectBatch(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_UPLOAD_RTCANCELREJECTBATCH, Value);
end;

procedure TGlobalVarForm.SetUploadRTUpdateInSSKStatus(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_UPLOAD_RTUPDATEINSSKSTATUS, Value);
end;

procedure TGlobalVarForm.SetUploadRTUpdateInTPKStatus(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_UPLOAD_RTUPDATEINTPKSTATUS, Value);
end;

procedure TGlobalVarForm.SetUploadRTUpdateRejectBatch(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_UPLOAD_RTUPDATEREJECTBATCH, Value);
end;

//---
function TGlobalVarForm.GetTPKVersion: Integer;
begin
  Result:=JvAppRegistryStorage1.ReadInteger(KEY_TPK_VERSION,1);
end;

procedure TGlobalVarForm.SetTPKVersion(const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_TPK_VERSION,Value);
end;
//--

function TGlobalVarForm.GetCommInboxPath: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_COMM_INBOXPATH,'');
end;

function TGlobalVarForm.GetCommOutboxPath: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_COMM_OUTBOXPATH,'');
end;

procedure TGlobalVarForm.SetCommInboxPath(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_COMM_INBOXPATH,Value);
end;

procedure TGlobalVarForm.SetCommOutboxPath(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_COMM_OUTBOXPATH,Value);
end;

function TGlobalVarForm.GetACKOutwardCallFunction: String;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_ACK_OUTWARD_CALL_FUNCTION,'CallUpdate');
end;

function TGlobalVarForm.GetACKOutwardCreditCallFunction: String;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_ACK_OUTWARD_CREDIT_CALL_FUNCTION,'CallUpdate');
end;

function TGlobalVarForm.GetACKOutwardDebitCallFunction: String;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_ACK_OUTWARD_DEBIT_CALL_FUNCTION,'CallUpdate');
end;

function TGlobalVarForm.GetACKOutwardDllName: String;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_ACK_OUTWARD_DLL_NAME,'eztrfex02.dll');
end;

function TGlobalVarForm.GetACKOutwardEnabled: Integer;
begin
  Result := JvAppRegistryStorage1.ReadInteger(KEY_ACK_OUTWARD_ENABLED,0);
end;

function TGlobalVarForm.GetACKReturnDllName: String;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_ACK_RETURN_DLL_NAME,'ineztrfex02.dll');
end;

function TGlobalVarForm.GetACKReturnEnabled: Integer;
begin
  Result := JvAppRegistryStorage1.ReadInteger(KEY_ACK_RETURN_ENABLED,0);
end;

procedure TGlobalVarForm.SetACKOutwardCallFunction(const Value: String);
begin
  JvAppRegistryStorage1.WriteString(KEY_ACK_OUTWARD_CALL_FUNCTION, Value);
end;

procedure TGlobalVarForm.SetACKOutwardCreditCallFunction(
  const Value: String);
begin
  JvAppRegistryStorage1.WriteString(KEY_ACK_OUTWARD_CREDIT_CALL_FUNCTION, Value);
end;

procedure TGlobalVarForm.SetACKOutwardDebitCallFunction(
  const Value: String);
begin
  JvAppRegistryStorage1.WriteString(KEY_ACK_OUTWARD_DEBIT_CALL_FUNCTION, Value);
end;

procedure TGlobalVarForm.SetACKOutwardDllName(const Value: String);
begin
  JvAppRegistryStorage1.WriteString(KEY_ACK_OUTWARD_DLL_NAME, Value);
end;

procedure TGlobalVarForm.SetACKOutwardEnabled(const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_ACK_OUTWARD_ENABLED, Value);
end;

procedure TGlobalVarForm.SetACKReturnDllName(const Value: String);
begin
  JvAppRegistryStorage1.WriteString(KEY_ACK_RETURN_DLL_NAME, Value);
end;

procedure TGlobalVarForm.SetACKReturnEnabled(const Value: Integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_ACK_RETURN_ENABLED, Value);
end;

function TGlobalVarForm.GetACKReturnCallFunction: String;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_ACK_RETURN_CALL_FUNCTION,'InCallUpdate');
end;

procedure TGlobalVarForm.SetACKReturnCallFunction(const Value: String);
begin
  JvAppRegistryStorage1.WriteString(KEY_ACK_RETURN_CALL_FUNCTION, Value);
end;

function TGlobalVarForm.GetAEOfflineVisible: Boolean;
begin
	Result:=JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_AE_OFFLINE_VISIBLE, False);
end;

function TGlobalVarForm.GetAESendACKCreditVisible: Boolean;
begin
	Result:=JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_AE_SEND_ACK_CREDIT_VISIBLE,False);
end;

function TGlobalVarForm.GetAESendACKDebitVisible: Boolean;
begin
	Result:=JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_AE_SEND_ACK_DEBIT_VISIBLE,False);
end;

procedure TGlobalVarForm.SetAEOfflineVisible(const Value: Boolean);
begin
	JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_AE_OFFLINE_VISIBLE,Value);
end;

procedure TGlobalVarForm.SetAESendACKCreditVisible(const Value: Boolean);
begin
	JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_AE_SEND_ACK_CREDIT_VISIBLE,Value);
end;

procedure TGlobalVarForm.SetAESendACKDebitVisible(const Value: Boolean);
begin
	JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_AE_SEND_ACK_DEBIT_VISIBLE,Value);
end;

function TGlobalVarForm.GetLoadDLLOnAuthorize: Integer;
begin
  Result := JvAppDBStorage1.ReadInteger(KEY_LOADDLL_ONAUTHORIZE, 0);
end;

procedure TGlobalVarForm.SetLoadDLLOnAuthorize(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_LOADDLL_ONAUTHORIZE,Value);
end;

function TGlobalVarForm.GetValueDLLOnAuthorize(Index: Integer): string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_LOADDLL_ONAUTHORIZEITEM + '\' +
      IntToStr(Index), '');
end;

procedure TGlobalVarForm.SetValueDLLOnAuthorize(Index: Integer; Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_LOADDLL_ONAUTHORIZEITEM + '\' + IntToStr(Index),
    Value);
end;

function TGlobalVarForm.GetContinueAuthorizeIfFail: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_LOADDLL_CONTINUEAUTHORIZEIFFAIL, True);
end;

procedure TGlobalVarForm.SetContinueAuthorizeIfFail(const Value: boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_LOADDLL_CONTINUEAUTHORIZEIFFAIL, Value);
end;

procedure TGlobalVarForm.SetMaxAuthorizedAmountDBPerItem(
  const Value: Currency);
begin
  JvAppDBStorage1.WriteFloat(KEY_CONS_MAXAUTHORIZEDAMOUNTDBPERITEM, Value);
end;

function TGlobalVarForm.GetMaxAuthorizedAmountDBPerItem: Currency;
begin
  Result:=JvAppDBStorage1.ReadFloat(KEY_CONS_MAXAUTHORIZEDAMOUNTDBPERITEM, 100000000000);
end;

function TGlobalVarForm.GetDownloadHostTelnetActive: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_DOWNLOAD_HOSTTELNETACTIVE, TRUE);
end;

procedure TGlobalVarForm.SetDownloadHostTelnetActive(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_DOWNLOAD_HOSTTELNETACTIVE, VALUE);
end;

function TGlobalVarForm.GetDownloadHostFTPQuote: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_DOWNLOAD_HOSTFTPQUOTE, TRUE);
end;

procedure TGlobalVarForm.SetDownloadHostFTPQuote(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_DOWNLOAD_HOSTFTPQUOTE, VALUE);
end;

function TGlobalVarForm.BuildText(ASource: string): string;
var
  TempText: string;
  TempIdent: string;
  TempFormat: string;
  ItemIdx: Integer;
  TempNum: Integer;
begin
  Result:='';
  TempText:='';
  ItemIdx:=0;
  repeat
    TempText:=GetItem(ASource,'%',ItemIdx);
    if Length(TempText)>1 then
    begin
      if TempText[1]='$' then
      begin
        TempIdent:=UpperCase(GetItem(TempText,',',0));
        TempFormat:=GetItem(TempText,',',1);
        if TempIdent='$D' then
        begin
          if TempFormat='' then TempFormat:='DD/MM/YYYY';
          TempText:=FormatDateTime(TempFormat, Date);
        end
        else if TempIdent='$T' then
        begin
          if TempFormat='' then TempFormat:='HH:NN:SS';
          TempText:=FormatDateTime(TempFormat, Time);
        end
        else if TempIdent='$S' then
        begin
          if TempFormat='' then TempFormat:='DD/MM/YYYY';
          TempText:=FormatDateTime(TempFormat, SystemToday);
        end;
      end;
      Result:=Result+TempText;
    end;
    Inc(ItemIdx);
  until TempText='';
end;

function TGlobalVarForm.GetCurrentCycle: Integer;
begin
	Result := JvAppDBStorage1.ReadInteger(KEY_SYSTEM_CURRENT_CYCLE,1);
end;

procedure TGlobalVarForm.SetCurrentCycle(const Value: Integer);
begin
	JvAppDBStorage1.WriteInteger(KEY_SYSTEM_CURRENT_CYCLE,Value);
end;

function TGlobalVarForm.GetTransferHistoryBackwardDays: Integer;
begin
  Result := JvAppDBStorage1.ReadInteger(KEY_TRANSFERHISTORY_BACKWARDDAYS, 7);
end;


function TGlobalVarForm.GetInwardActiveBranchCode: String;
begin
  Result := JvAppDBStorage1.ReadString(KEY_BANK_INWARD_ACTIVE_BRANCHCODE,'');
end;

procedure TGlobalVarForm.SetInwardActiveBranchCode(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_BANK_INWARD_ACTIVE_BRANCHCODE,Value);
end;

function TGlobalVarForm.GetInwardPromoCode: String;
begin
  Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_INWARD_PROMO_CODE,'');
end;

procedure TGlobalVarForm.SetInwardPromoCode(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_INWARD_PROMO_CODE,Value);
end;

function TGlobalVarForm.GetTransferHistoryOption: Integer;
begin
  Result := JvAppDBStorage1.ReadInteger(KEY_TRANSFERHISTORY_OPTION, TRANSFER_OPTION_BY_FLAG);
end;

procedure TGlobalVarForm.SetTransferHistoryBackwardDays(
  const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_TRANSFERHISTORY_BACKWARDDAYS, Value);
end;

procedure TGlobalVarForm.SetTransferHistoryOption(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_TRANSFERHISTORY_OPTION, Value);
end;

function TGlobalVarForm.GetFileEncryptionKey: string;
begin
  Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_INTERFACEFILE_ENCRYPTIONKEY, ''));
end;

procedure TGlobalVarForm.SetFileEncryptionKey(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_INTERFACEFILE_ENCRYPTIONKEY,FCipher.EncodeString(Value));
end;

function TGlobalVarForm.GetFileDecryptEnabled: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_INTERFACEFILE_DECRYPTENABLED, TRUE);
end;

procedure TGlobalVarForm.SetFileDecryptEnabled(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_INTERFACEFILE_DECRYPTENABLED, VALUE);
end;

function TGlobalVarForm.GetDataSnapFileManagerPort: Integer;
begin
  Result := JvAppDBStorage1.ReadInteger(KEY_DATASNAP_FILEMANAGER_PORT, 211);
end;

procedure TGlobalVarForm.SetDataSnapFileManagerPort(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_DATASNAP_FILEMANAGER_PORT, Value);
end;

function TGlobalVarForm.GetSystemAuthorizeUsergroup: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_AUTHORIZEUSERGROUP,'authorizer');
end;

procedure TGlobalVarForm.SetSystemAuthorizeUsergroup(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_AUTHORIZEUSERGROUP,Value);
end;

function TGlobalVarForm.GetInwardFileDecryptEnabled: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_INTERFACEFILE_INWARD_DECRYPTENABLED, FALSE);
end;

function TGlobalVarForm.GetFileEncryptEnabled: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_INTERFACEFILE_ENCRYPTENABLED, FALSE);
end;

procedure TGlobalVarForm.SetInwardFileDecryptEnabled(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_INTERFACEFILE_INWARD_DECRYPTENABLED, VALUE);
end;

procedure TGlobalVarForm.SetFileEncryptEnabled(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_INTERFACEFILE_ENCRYPTENABLED, VALUE);
end;

function TGlobalVarForm.GetInwardFileEncryptEnabled: Boolean;
begin
  Result := JvAppDBStorage1.ReadBoolean(KEY_INTERFACEFILE_INWARD_ENCRYPTENABLED, FALSE);
end;

procedure TGlobalVarForm.SetInwardFileEncryptEnabled(const Value: Boolean);
begin
  JvAppDBStorage1.WriteBoolean(KEY_INTERFACEFILE_INWARD_ENCRYPTENABLED, VALUE);
end;

function TGlobalVarForm.GetFeeDebetClearing: Double;
begin
	Result := JvAppDBStorage1.ReadFloat(KEY_SYSTEM_FEE_DEBET_CLEARING, 0);
end;

procedure TGlobalVarForm.SetFeeDebetClearing(const Value: Double);
begin
	JvAppDBStorage1.WriteFloat(KEY_SYSTEM_FEE_DEBET_CLEARING, Value);
end;

function TGlobalVarForm.GetXLSCabPgn: String;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_XLS_CAB_PGN,'0');
end;

function TGlobalVarForm.GetXLSJnsTxnMng: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_XLS_JNS_TXN_MNG,'');
end;

function TGlobalVarForm.GetXLSJnsTxnKlh: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_XLS_JNS_TXN_KLH,'');
end;

function TGlobalVarForm.GetTPKRprtPath: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_TPK_RPRT_PATH,'');
end;

function TGlobalVarForm.GetXLSJrnID: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_XLS_JRN_ID,'');
end;

function TGlobalVarForm.GetXLSNarasiJabo: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_XLS_NARASI_JABO,'');
end;

function TGlobalVarForm.GetXLSNarasiNonJaboKlh: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_XLS_NARASI_NONJABO_KLH,'KLH');
end;

function TGlobalVarForm.GetXLSNarasiNonJaboMng: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_XLS_NARASI_NONJABO_MNG,'MNG');
end;

function TGlobalVarForm.GetXLSNoJabo: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_XLS_NO_JABO,1);
end;

function TGlobalVarForm.GetXLSNoNonJabo: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_XLS_NO_NONJABO,1);
end;

procedure TGlobalVarForm.SetXLSCabPgn(const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_XLS_CAB_PGN,Value);
end;

procedure TGlobalVarForm.SetXLSJnsTxnMng(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_XLS_JNS_TXN_MNG,Value);
end;

procedure TGlobalVarForm.SetXLSJnsTxnKlh(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_XLS_JNS_TXN_KLH,Value);
end;

procedure TGlobalVarForm.SetTPKRprtPath(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_TPK_RPRT_PATH,Value);
end;

procedure TGlobalVarForm.SetXLSJrnID(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_XLS_JRN_ID,Value);
end;

procedure TGlobalVarForm.SetXLSNarasiJabo(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_XLS_NARASI_JABO,Value);
end;

procedure TGlobalVarForm.SetXLSNarasiNonJaboKlh(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_XLS_NARASI_NONJABO_KLH,Value);
end;

procedure TGlobalVarForm.SetXLSNarasiNonJaboMng(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_XLS_NARASI_NONJABO_MNG,Value);
end;

procedure TGlobalVarForm.SetXLSNoJabo(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_XLS_NO_JABO,Value);
end;

procedure TGlobalVarForm.SetXLSNoNonJabo(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_XLS_NO_NONJABO,Value);
end;

function TGlobalVarForm.GetReturDBName: string;
begin
  Result := JvAppRegistryStorage1.ReadString(KEY_DB_RETURDBNAME);
end;

function TGlobalVarForm.GetReturDBUserName: string;
begin
  Result := JvAppRegistryStorage1.ReadString(KEY_DB_RETURDBUSERNAME);
end;

function TGlobalVarForm.GetReturDBUserPass: string;
begin
  cmCipher.InitKey(STR_CIPHER_KEY,nil);
  Result := cmCipher.DecodeString(JvAppRegistryStorage1.ReadString(KEY_DB_RETURDBUSERPASS));
end;

function TGlobalVarForm.GetReturServerAddress: string;
begin
  Result := JvAppRegistryStorage1.ReadString(KEY_DB_RETURSERVERADDRESS);
end;

function TGlobalVarForm.GetReturServerHost: string;
begin
  Result := JvAppRegistryStorage1.ReadString(KEY_DB_RETURSERVERHOST);
end;

function TGlobalVarForm.GetReturServerPort: integer;
begin
  Result := JvAppRegistryStorage1.ReadInteger(KEY_DB_RETURSERVERPORT);
end;

procedure TGlobalVarForm.SetReturDBName(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_RETURDBNAME, Value);
end;

procedure TGlobalVarForm.SetReturDBUserName(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_RETURDBUSERNAME, Value);
end;

procedure TGlobalVarForm.SetReturDBUserPass(const Value: string);
begin
  cmCipher.InitKey(STR_CIPHER_KEY,nil);
  JvAppRegistryStorage1.WriteString(KEY_DB_RETURDBUSERPASS, cmCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetReturServerAddress(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_RETURSERVERADDRESS, Value);
end;

procedure TGlobalVarForm.SetReturServerHost(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_RETURSERVERHOST, Value);
end;

procedure TGlobalVarForm.SetReturServerPort(const Value: integer);
begin
  JvAppRegistryStorage1.WriteInteger(KEY_DB_RETURSERVERPORT, Value);
end;

function TGlobalVarForm.GetDashboardDBName: string;
begin
  Result := JvAppRegistryStorage1.ReadString(KEY_DB_DASHBOARDDBNAME);
end;

procedure TGlobalVarForm.SetDashboardDBName(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_DB_DASHBOARDDBNAME, Value);
end;

function TGlobalVarForm.GetDBMonthlyRptDBName: string;
begin
  Result:=JvAppRegistryStorage1.ReadString(KEY_DB_DAILYDBNAME, 'skn_sect') + '_rpt';
end;

procedure TGlobalVarForm.SetDBMonthlyRptDBName(const Value: string);
begin
	utilMonthlyRptDBName := Value;
end;

function TGlobalVarForm.GetTPKDebetConnectionString: string;
begin
  Result:=FCipher.DecodeString(JvAppRegistryStorage1.ReadString(KEY_TPK_DEBET_CONNECTIONSTRING,
    ''));
end;

procedure TGlobalVarForm.SetTPKDebetConnectionString(const Value: string);
begin
  JvAppRegistryStorage1.WriteString(KEY_TPK_DEBET_CONNECTIONSTRING,FCipher.EncodeString(Value));
end;

function TGlobalVarForm.GetFeeIntercity: Double;
begin
	Result := JvAppDBStorage1.ReadFloat(KEY_SYSTEM_FEE_INTERCITY, 0);
end;

procedure TGlobalVarForm.SetFeeIntercity(const Value: Double);
begin
	JvAppDBStorage1.WriteFloat(KEY_SYSTEM_FEE_INTERCITY, Value);
end;

function TGlobalVarForm.GetIntercityAccBCA: string;
begin
	Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_INTERCITY_ACC_BCA, '');
end;

procedure TGlobalVarForm.SetIntercityAccBCA(const Value: string);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_INTERCITY_ACC_BCA, Value);
end;

function TGlobalVarForm.GetDBDailyInwardDebetDBName: string;
begin
	Result:=JvAppRegistryStorage1.ReadString(KEY_DB_DAILYDBNAME,'skn_smiw')+'_in_dbt';
end;

procedure TGlobalVarForm.SetDBDailyInwardDebetDBName(const Value: string);
begin
  utilsDailyInwardDebetDBName:=Value;
end;

function TGlobalVarForm.GetSystemPortraitReportLength: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_SYSTEM_PORTRAIT_REPORTLENGTH, 63);
end;

procedure TGlobalVarForm.SetSystemPortraitReportLength(
  const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_SYSTEM_PORTRAIT_REPORTLENGTH, Value);
end;

function TGlobalVarForm.GetSystemInputFolder: string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_INPUT_FOLDER, '');
end;

function TGlobalVarForm.GetSystemOutputFolder: string;
begin
  Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_OUTPUT_FOLDER, '');
end;

procedure TGlobalVarForm.SetSystemInputFolder(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_INPUT_FOLDER, Value);
end;

procedure TGlobalVarForm.SetSystemOutputFolder(const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_OUTPUT_FOLDER, Value);
end;

function TGlobalVarForm.GetBankBIActiveBranch: string;
begin
	Result := JvAppDBStorage1.ReadString(KEY_BANK_BI_ACTIVEBRANCH, '');
end;

procedure TGlobalVarForm.SetBankBIActiveBranch(const Value: string);
begin
	JvAppDBStorage1.WriteString(KEY_BANK_BI_ACTIVEBRANCH, Value);
end;

function TGlobalVarForm.GetBankWilayahKliringAktive: string;
begin
	Result := JvAppDBStorage1.ReadString(KEY_BANK_ACTIVE_REGION, '');
end;

procedure TGlobalVarForm.SetBankWilayahKliringAktive(const Value: string);
begin
	JvAppDBStorage1.WriteString(KEY_BANK_ACTIVE_REGION, Value);
end;

function TGlobalVarForm.GetSystemAppVersion: Integer;
begin
	//Result := JvAppDBStorage1.ReadInteger(KEY_SYSTEM_APP_VERSION, APP_LITE_VERSION);
  Result := APP_FULL_VERSION;
end;

procedure TGlobalVarForm.SetSystemAppVersion(const Value: Integer);
begin
	//JvAppDBStorage1.ReadInteger(KEY_SYSTEM_APP_VERSION, APP_LITE_VERSION);
end;

function TGlobalVarForm.GetSystemApplicationPath: string;
begin
	Result := JvAppRegistryStorage1.ReadString(KEY_SYSTEM_APPLICATION_PATH, ExtractFilePath(Application.ExeName));
end;

procedure TGlobalVarForm.SetSystemApplicationPath(const Value: string);
begin
	JvAppRegistryStorage1.WriteString(KEY_SYSTEM_APPLICATION_PATH, Value);
end;

function TGlobalVarForm.GetDBSecurityInfo: Boolean;
begin
  Result:=JvAppRegistryStorage1.ReadBoolean(KEY_DB_SECURITYINFO, True);
end;

procedure TGlobalVarForm.SetDBSecurityInfo(const Value: boolean);
begin
  JvAppRegistryStorage1.WriteBoolean(KEY_DB_SECURITYINFO, Value);
end;

function TGlobalVarForm.GetInterfaceDownloadFileName(idx: Integer): string;
begin
  Result:= JvAppDBStorage1.ReadString(KEY_INTERFACE_DOWNLOAD_FILE+IntToStr(idx),'*.*');
end;

function TGlobalVarForm.GetInterfaceDownloadPath(idx: Integer): String;
begin
  Result:= JvAppDBStorage1.ReadString(KEY_INTERFACE_DOWNLOAD_PATH+IntToStr(idx),'');
end;

function TGlobalVarForm.GetInterfaceDownloadPathCount: Integer;
begin
  Result:= JvAppDBStorage1.ReadInteger(KEY_INTERFACE_DOWNLOAD_PATH_COUNT, 0);
end;

procedure TGlobalVarForm.SetInterfaceDownloadFileName(idx: Integer;
  const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_INTERFACE_DOWNLOAD_FILE+IntToStr(idx), Value);
end;

procedure TGlobalVarForm.SetInterfaceDownloadPath(idx: Integer;
  const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_INTERFACE_DOWNLOAD_PATH+IntToStr(idx), Value);
end;

procedure TGlobalVarForm.SetInterfaceDownloadPathCount(
  const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_INTERFACE_DOWNLOAD_PATH_COUNT, Value);
end;

function TGlobalVarForm.GetSandiPesertaActive: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_BANK_SANDI_PESERTA_ACTIVE, '');
end;

procedure TGlobalVarForm.SetSandiPesertaActive(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_BANK_SANDI_PESERTA_ACTIVE, Value);
end;

function TGlobalVarForm.GetTPKWSDLAddress: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_TPK_WSDL_ADDRESS, '');
end;

procedure TGlobalVarForm.SetTPKWSDLAddress(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_TPK_WSDL_ADDRESS, Value);
end;

function TGlobalVarForm.GetTPKWSDLAuthCode: String;
begin
	Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_TPK_WSDL_AUTH_CODE, ''));
end;

procedure TGlobalVarForm.SetTPKWSDLAuthCode(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_TPK_WSDL_AUTH_CODE, FCipher.EncodeString(Value));
end;

function TGlobalVarForm.GetSPKDKEType: String;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_SPK_DKE_TYPE, '1;1');
end;

procedure TGlobalVarForm.SetSPKDKEType(const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_SPK_DKE_TYPE, Value);
end;

function TGlobalVarForm.GetHostIntfDownloadFTPAddress: String;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_HI_DOWNLOAD_FTP_ADDRESS, 'localhost');
end;

function TGlobalVarForm.GetHostIntfDownloadFTPCRSourcePath: String;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_HI_DOWNLOAD_FTP_SOURCE_CR, '/');
end;

function TGlobalVarForm.GetHostIntfDownloadFTPDBSourcePath: String;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_HI_DOWNLOAD_FTP_SOURCE_DB, '/');
end;

function TGlobalVarForm.GetHostIntfDownloadFTPPassword: String;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_HI_DOWNLOAD_FTP_PASSWORD, '');
  if Result<>'' then Result:=FCipher.DecodeString(Result);
end;

function TGlobalVarForm.GetHostIntfDownloadFTPPort: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_HI_DOWNLOAD_FTP_PORT, 21);
end;

function TGlobalVarForm.GetHostIntfDownloadFTPUsername: String;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_HI_DOWNLOAD_FTP_USERNAME, '');
end;

function TGlobalVarForm.GetHostIntfDownloadProtocolType: Integer;
begin
  Result:=JvAppDBStorage1.ReadInteger(KEY_HI_DOWNLOAD_PROTOCOLTYPE, 0);
end;

procedure TGlobalVarForm.SetHostIntfDownloadFTPAddress(
  const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_HI_DOWNLOAD_FTP_ADDRESS, Value);
end;

procedure TGlobalVarForm.SetHostIntfDownloadFTPCRSourcePath(
  const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_HI_DOWNLOAD_FTP_SOURCE_CR, Value);
end;

procedure TGlobalVarForm.SetHostIntfDownloadFTPDBSourcePath(
  const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_HI_DOWNLOAD_FTP_SOURCE_DB, Value);
end;

procedure TGlobalVarForm.SetHostIntfDownloadFTPPassword(
  const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_HI_DOWNLOAD_FTP_PASSWORD, FCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetHostIntfDownloadFTPPort(const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_HI_DOWNLOAD_FTP_PORT, Value);
end;

procedure TGlobalVarForm.SetHostIntfDownloadFTPUsername(
  const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_HI_DOWNLOAD_FTP_USERNAME, Value);
end;

procedure TGlobalVarForm.SetHostIntfDownloadProtocolType(
  const Value: Integer);
begin
  JvAppDBStorage1.WriteInteger(KEY_HI_DOWNLOAD_PROTOCOLTYPE, Value);
end;

function TGlobalVarForm.GetHostInterfaceDownloadDKOFileName: String;
begin
  Result := JvAppDBStorage1.ReadString(KEY_HI_DOWNLOAD_DKO_FILENAME, '*.DKO');
end;

function TGlobalVarForm.GetHostInterfaceDownloadDPOFileName: String;
begin
  Result := JvAppDBStorage1.ReadString(KEY_HI_DOWNLOAD_DPO_FILENAME, '*.DPO');
end;

procedure TGlobalVarForm.SetHostInterfaceDownloadDKOFileName(
  const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_HI_DOWNLOAD_DKO_FILENAME, Value);
end;

procedure TGlobalVarForm.SetHostInterfaceDownloadDPOFileName(
  const Value: String);
begin
  JvAppDBStorage1.WriteString(KEY_HI_DOWNLOAD_DPO_FILENAME, Value);
end;

function TGlobalVarForm.GetSystemUsePolaSiklusForOutDebet: Boolean;
begin
	Result := JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_POLASIKLUS_OUTDB_ENABLED, True);
end;

procedure TGlobalVarForm.SetSystemUsePolaSiklusForOutDebet(
  const Value: Boolean);
begin
	JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_POLASIKLUS_OUTDB_ENABLED, Value);
end;

function TGlobalVarForm.GetHostInterfaceDownloadDKOFolder: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_HI_DOWNLOAD_DKO_FOLDER, 'C:\');
end;

function TGlobalVarForm.GetHostInterfaceDownloadDPOFolder: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_HI_DOWNLOAD_DPO_FOLDER, 'C:\');
end;

procedure TGlobalVarForm.SetHostInterfaceDownloadDKOFolder(
  const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_HI_DOWNLOAD_DKO_FOLDER, Value);
end;

procedure TGlobalVarForm.SetHostInterfaceDownloadDPOFolder(
  const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_HI_DOWNLOAD_DPO_FOLDER, Value);
end;

function TGlobalVarForm.GetSystemSandiEchanel: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_SANDI_ECHANEL, '2');
end;

procedure TGlobalVarForm.SetSystemSandiEchanel(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_SANDI_ECHANEL, Value);
end;

//Inward kedit
function TGlobalVarForm.GetSystemInwardHostInputFolder: string;
begin
  Result:=IncludeTrailingBackslash(JvAppDBStorage1.ReadString(KEY_SYSTEM_INWARD_HOST_INPUT_FOLDER,'C:\'));
end;

procedure TGlobalVarForm.SetSystemInwardHostInputFolder(
  const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_INWARD_HOST_INPUT_FOLDER,Value);
end;

function TGlobalVarForm.GetVirtualAccountAcceptPostingCode: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_DEFAULT_VIRTUALACCOUNT_ACCEPT_POSTING_CODE, '');
end;

procedure TGlobalVarForm.SetVirtualAccountAcceptPostingCode(
  const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_DEFAULT_VIRTUALACCOUNT_ACCEPT_POSTING_CODE, Value);
end;

function TGlobalVarForm.GetTSAPostingCode: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_DEFAULT_TSA_POSTING_CODE, '');
end;

procedure TGlobalVarForm.SetTSAPostingCode(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_DEFAULT_TSA_POSTING_CODE, Value);
end;


procedure TGlobalVarForm.SetGenDKIFileName(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_GEN_DKI_FILENAME, Value);
end;

procedure TGlobalVarForm.SetGenDKIFileOutFolder(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_GEN_DKI_OUTFOLDER, Value);
end;

function TGlobalVarForm.GetGenDKIFileName: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_GEN_DKI_FILENAME, '');
end;

function TGlobalVarForm.GetGenDKIFileOutFolder: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_GEN_DKI_OUTFOLDER, '');
end;

function TGlobalVarForm.GetSystemIBPrefixRef: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_IB_PREFIX_REF, 'I');
end;

procedure TGlobalVarForm.SetSystemIBPrefixRef(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_IB_PREFIX_REF, Value);
end;

function TGlobalVarForm.GetHostAddress5: string;
begin
	Result := JvAppDBStorage1.ReadString(KEY_HOST_ADDRESS5,'');
end;

function TGlobalVarForm.GetHostPassword5: string;
begin
	Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_HOST_PASSWORD5,''));
end;

function TGlobalVarForm.GetHostTargetPath5: string;
begin
	Result := JvAppDBStorage1.ReadString(KEY_HOST_TARGETPATH5,'\');
end;

function TGlobalVarForm.GetHostUserName5: string;
begin
	Result := JvAppDBStorage1.ReadString(KEY_HOST_USERNAME5,'');
end;

procedure TGlobalVarForm.SetHostAddress5(const Value: string);
begin
	JvAppDBStorage1.WriteString(KEY_HOST_ADDRESS5, Value);
end;

procedure TGlobalVarForm.SetHostPassword5(const Value: string);
begin
	JvAppDBStorage1.WriteString(KEY_HOST_PASSWORD5, FCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetHostTargetPath5(const Value: string);
begin
	JvAppDBStorage1.WriteString(KEY_HOST_TARGETPATH5, Value);
end;

procedure TGlobalVarForm.SetHostUserName5(const Value: string);
begin
	JvAppDBStorage1.WriteString(KEY_HOST_USERNAME5, Value);
end;


function TGlobalVarForm.GetSystemInwardHostInputFileName: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_INWARD_HOST_INPUT_FILENAME, 'CROUT-DKE-*.DKI');
end;

procedure TGlobalVarForm.SetSystemInwardHostInputFileName(
  const Value: string);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_INWARD_HOST_INPUT_FILENAME, Value);
end;

function TGlobalVarForm.GetSystemInwardDownloadDKIFromFTP: Boolean;
begin
	Result := JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_DOWNLOAD_DKI_FROM_FTP, False);
end;

procedure TGlobalVarForm.SetSystemInwardDownloadDKIFromFTP(
  const Value: Boolean);
begin
	JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_DOWNLOAD_DKI_FROM_FTP, Value);
end;

function TGlobalVarForm.GetOtomatisKirimFileGenDKIKeFTP: Boolean;
begin
	Result := JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_GEN_DKI_AUTO_SEND_FTP, False);
end;

procedure TGlobalVarForm.SetOtomatisKirimFileGenDKIKeFTP(
  const Value: Boolean);
begin
	JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_GEN_DKI_AUTO_SEND_FTP, Value);
end;


function TGlobalVarForm.GetSystemDefaultRejectPostingCode: string;
begin
  Result:=JvAppDBStorage1.ReadString(KEY_SYSTEM_DEFAULT_REJECT_POSTING_CODE, '');
end;

procedure TGlobalVarForm.SetSystemDefaultRejectPostingCode(
  const Value: string);
begin
  JvAppDBStorage1.WriteString(KEY_SYSTEM_DEFAULT_REJECT_POSTING_CODE, Value);
end;

function TGlobalVarForm.GetGenDKIFTPAddress: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_GEN_DKI_FTP_ADDRESS, '');
end;

function TGlobalVarForm.GetGenDKIFTPPassword: String;
begin
	Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_GEN_DKI_FTP_PASSWORD, ''));
end;

function TGlobalVarForm.GetGenDKIFTPPort: Integer;
begin
	Result := JvAppDBStorage1.ReadInteger(KEY_GEN_DKI_FTP_PORT, 21);
end;

function TGlobalVarForm.GetGenDKIFTPTargetPath: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_GEN_DKI_FTP_TARGET_PATH, '');
end;

function TGlobalVarForm.GetGenDKIFTPUsername: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_GEN_DKI_FTP_USERNAME, '');
end;

procedure TGlobalVarForm.SetGenDKIFTPAddress(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_GEN_DKI_FTP_ADDRESS, Value);
end;

procedure TGlobalVarForm.SetGenDKIFTPPassword(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_GEN_DKI_FTP_PASSWORD, FCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetGenDKIFTPPort(const Value: Integer);
begin
	JvAppDBStorage1.WriteInteger(KEY_GEN_DKI_FTP_PORT, Value);
end;

procedure TGlobalVarForm.SetGenDKIFTPTargetPath(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_GEN_DKI_FTP_TARGET_PATH, Value);
end;

procedure TGlobalVarForm.SetGenDKIFTPUsername(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_GEN_DKI_FTP_USERNAME, Value);
end;

function TGlobalVarForm.GetInDKIHostFTPAddress: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_DKI_HOST_IN_FTP_ADDRESS, '127.0.0.1');
end;

function TGlobalVarForm.GetInDKIHostFTPPassword: String;
begin
	Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_DKI_HOST_IN_FTP_PASSWORD,  ''));
end;

function TGlobalVarForm.GetInDKIHostFTPPath: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_DKI_HOST_IN_FTP_PATH,  '/');
end;

function TGlobalVarForm.GetInDKIHostFTPPort: Integer;
begin
	Result := JvAppDBStorage1.ReadInteger(KEY_DKI_HOST_IN_FTP_PORT,  21);
end;

function TGlobalVarForm.GetInDKIHostFTPUsername: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_DKI_HOST_IN_FTP_USERNAME,  '');
end;

function TGlobalVarForm.GetOutDKIHostFTPAddress: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_DKI_HOST_OUT_FTP_ADDRESS,  '127.0.0.1');
end;

function TGlobalVarForm.GetOutDKIHostFTPPassword: String;
begin
	Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_DKI_HOST_OUT_FTP_PASSWORD,  ''));
end;

function TGlobalVarForm.GetOutDKIHostFTPPath: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_DKI_HOST_OUT_FTP_PATH,  '/');
end;

function TGlobalVarForm.GetOutDKIHostFTPPort: Integer;
begin
	Result := JvAppDBStorage1.ReadInteger(KEY_DKI_HOST_OUT_FTP_PORT,  21);
end;

function TGlobalVarForm.GetOutDKIHostFTPUsername: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_DKI_HOST_OUT_FTP_USERNAME,  '');
end;

procedure TGlobalVarForm.SetInDKIHostFTPAddress(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_DKI_HOST_IN_FTP_ADDRESS,  Value);
end;

procedure TGlobalVarForm.SetInDKIHostFTPPassword(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_DKI_HOST_IN_FTP_PASSWORD,  FCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetInDKIHostFTPPath(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_DKI_HOST_IN_FTP_PATH,  Value);
end;

procedure TGlobalVarForm.SetInDKIHostFTPPort(const Value: Integer);
begin
	JvAppDBStorage1.WriteInteger(KEY_DKI_HOST_IN_FTP_PORT,  Value);
end;

procedure TGlobalVarForm.SetInDKIHostFTPUsername(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_DKI_HOST_IN_FTP_USERNAME,  Value);
end;

procedure TGlobalVarForm.SetOutDKIHostFTPAddress(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_DKI_HOST_OUT_FTP_ADDRESS,  Value);
end;

procedure TGlobalVarForm.SetOutDKIHostFTPPassword(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_DKI_HOST_OUT_FTP_PASSWORD, FCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetOutDKIHostFTPPath(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_DKI_HOST_OUT_FTP_PATH,  Value);
end;

procedure TGlobalVarForm.SetOutDKIHostFTPPort(const Value: Integer);
begin
	JvAppDBStorage1.WriteInteger(KEY_DKI_HOST_OUT_FTP_PORT,  Value);
end;

procedure TGlobalVarForm.SetOutDKIHostFTPUsername(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_DKI_HOST_OUT_FTP_USERNAME,  Value);
end;

function TGlobalVarForm.GetConvBankCode: string;
begin
	Result := JvAppDBStorage1.ReadString(KEY_KONVERSI_BANK_CODE,'');
end;

procedure TGlobalVarForm.SetConvBankCode(const Value: string);
begin
	JvAppDBStorage1.WriteString(KEY_KONVERSI_BANK_CODE,Value);
end;

function TGlobalVarForm.GetGenDPIFileName: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_GEN_DPI_FILENAME, '');
end;

function TGlobalVarForm.GetGenDPIFileOutFolder: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_SYSTEM_GEN_DPI_OUTFOLDER, '');
end;

function TGlobalVarForm.GetGenDPIFTPAddress: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_GEN_DPI_FTP_ADDRESS, '');
end;

function TGlobalVarForm.GetGenDPIFTPPassword: String;
begin
	Result := FCipher.DecodeString(JvAppDBStorage1.ReadString(KEY_GEN_DPI_FTP_PASSWORD, ''));
end;

function TGlobalVarForm.GetGenDPIFTPPort: Integer;
begin
	Result := JvAppDBStorage1.ReadInteger(KEY_GEN_DPI_FTP_PORT, 21);
end;

function TGlobalVarForm.GetGenDPIFTPTargetPath: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_GEN_DPI_FTP_TARGET_PATH, '');
end;

function TGlobalVarForm.GetGenDPIFTPUsername: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_GEN_DPI_FTP_USERNAME, '');
end;

function TGlobalVarForm.GetOtomatisKirimFileGenDPIKeFTP: Boolean;
begin
	Result := JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_GEN_DPI_AUTO_SEND_FTP, False);
end;

procedure TGlobalVarForm.SetGenDPIFileName(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_GEN_DPI_FILENAME, Value);
end;

procedure TGlobalVarForm.SetGenDPIFileOutFolder(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_SYSTEM_GEN_DPI_OUTFOLDER, Value);
end;

procedure TGlobalVarForm.SetGenDPIFTPAddress(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_GEN_DPI_FTP_ADDRESS, Value);
end;

procedure TGlobalVarForm.SetGenDPIFTPPassword(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_GEN_DPI_FTP_PASSWORD, FCipher.EncodeString(Value));
end;

procedure TGlobalVarForm.SetGenDPIFTPPort(const Value: Integer);
begin
	JvAppDBStorage1.WriteInteger(KEY_GEN_DPI_FTP_PORT, Value);
end;

procedure TGlobalVarForm.SetGenDPIFTPTargetPath(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_GEN_DPI_FTP_TARGET_PATH, Value);
end;

procedure TGlobalVarForm.SetGenDPIFTPUsername(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_GEN_DPI_FTP_USERNAME, Value);
end;

procedure TGlobalVarForm.SetOtomatisKirimFileGenDPIKeFTP(
  const Value: Boolean);
begin
	JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_GEN_DPI_AUTO_SEND_FTP, Value);
end;

function TGlobalVarForm.GetInitialCreditBatchNoSPK: Integer;
begin
	Result := JvAppDBStorage1.ReadInteger(KEY_SYSTEM_INITIAL_CR_BATCH_NO_SPK, 1);
end;

function TGlobalVarForm.GetInitialDebetBatchNoSPK: Integer;
begin
	Result := JvAppDBStorage1.ReadInteger(KEY_SYSTEM_INITIAL_DB_BATCH_NO_SPK, 1);
end;

procedure TGlobalVarForm.SetInitialCreditBatchNoSPK(const Value: Integer);
begin
	JvAppDBStorage1.WriteInteger(KEY_SYSTEM_INITIAL_CR_BATCH_NO_SPK, Value);
end;

procedure TGlobalVarForm.SetInitialDebetBatchNoSPK(const Value: Integer);
begin
	JvAppDBStorage1.WriteInteger(KEY_SYSTEM_INITIAL_DB_BATCH_NO_SPK, Value);
end;


function TGlobalVarForm.GetRTGSConvertFileName: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_CONV_RTGS2G2_FileName, '*.TXT');
end;

function TGlobalVarForm.GetRTGSConvertFolder: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_CONV_RTGS2G2_Folder, 'D:\');
end;

function TGlobalVarForm.GetRTGSConvertMultipleConvert: Boolean;
begin
	Result := JvAppDBStorage1.ReadBoolean(KEY_CONV_RTGS2G2_MultipleConvert, False);
end;

procedure TGlobalVarForm.SetRTGSConvertFileName(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_CONV_RTGS2G2_FileName, Value);
end;

procedure TGlobalVarForm.SetRTGSConvertFolder(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_CONV_RTGS2G2_Folder, Value);
end;

procedure TGlobalVarForm.SetRTGSConvertMultipleConvert(
  const Value: Boolean);
begin
	JvAppDBStorage1.WriteBoolean(KEY_CONV_RTGS2G2_MultipleConvert, Value);
end;

function TGlobalVarForm.GetRTGSListTRNConvert: String;
begin
	Result := JvAppDBStorage1.ReadString(KEY_CONV_RTGS2G2_LIST_TRN_CONVERT, '');
end;

procedure TGlobalVarForm.SetRTGSListTRNConvert(const Value: String);
begin
	JvAppDBStorage1.WriteString(KEY_CONV_RTGS2G2_LIST_TRN_CONVERT, Value);
end;


function TGlobalVarForm.GetPartialSyncOPSData: Boolean;
begin
	Result := JvAppDBStorage1.ReadBoolean(KEY_SYSTEM_PARTIAL_SYNC_OPSDATA, False);
end;

procedure TGlobalVarForm.SetPartialSyncOPSData(const Value: Boolean);
begin
	JvAppDBStorage1.WriteBoolean(KEY_SYSTEM_PARTIAL_SYNC_OPSDATA, Value);
end;

end.

