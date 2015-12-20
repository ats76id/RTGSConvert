//CIA - Clearing Interface Application [TOOLS]
unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, ADODB, ActnList, Menus, ImgList, 
  dxNavBarStyles, dxNavBarCollns, dxNavBar, ExtCtrls,
  GR32_Image, Dialogs, LMDCustomComponent, LMDContainerComponent,
  LMDBaseDialog, LMDAboutDlg, JvLabel, JvTimer, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDInformationLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, LMDCustomSimpleLabel, LMDSimpleLabel,
  JvStaticText, ARProtector, DateUtils, dxBar, cxClasses, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbon, XPMan, dxStatusBar;
const
  APP_VERSION = '1.2 B151129.1605';
  CM_LOGIN = WM_APP + 111;
  CM_REGISTER = WM_APP + 112;

  { USER ACTIVE }
  US_INACTIVE           =   0;
  US_ACTIVE             =   1;

  MAXIMUM_BAD_LOGIN     =   3;

  { USER STATUS }
  US_VALIDATED          =   1;
  US_NEW                =   2;
  US_EDITED             =   3;
  US_DELETE_FLAG        =   4;
  US_DELETED            =   5;
  US_BLOCKED            =   6;

type
  TfrmMain = class(TForm)
    ActionList: TActionList;
    actParameter: TAction;
    actExit: TAction;
    actSOD: TAction;
    actDownload: TAction;
    actGenerateFormatSKN: TAction;
    actRejectRepairDebet: TAction;
    actImportTPK: TAction;
    LMDAboutDlg1: TLMDAboutDlg;
    actOtorisasiDebet: TAction;
    actParamCabang: TAction;
    actParamCapem: TAction;
    actMonitorTransaksi: TAction;
    actManajUser: TAction;
    actBackupDB: TAction;
    actRestoreDB: TAction;
    actLaporanTransaksi: TAction;
    actCariWarkat: TAction;
    actParamWilayah: TAction;
    actRegister: TAction;
    actLogOff: TAction;
    qryProcess: TADOQuery;
    qryLogDaily: TADOQuery;
    actLogAktifitas: TAction;
    actLogUser: TAction;
    actHeaderViewLog: TAction;
    actHeaderManajemenDB: TAction;
    actManageTrx: TAction;
    actIncrDownloadDKI: TAction;
    actIncrDownloadDataHost: TAction;
    actIncrDistribusiTransaksi: TAction;
    actIncrVerifikasiTransaksi: TAction;
    actIncrOtorisasiTransaksi: TAction;
    actIncrInterfaceReturKeluar: TAction;
    actIncrUploadDataKeHost: TAction;
    actIndbDownloadDPITPK: TAction;
    actIndbDownloadBSK: TAction;
    actIndbLaporanPembuatanVoucher: TAction;
    actLaporanDetailKreditKeluar: TAction;
    actLaporanDetailDebetKeluar: TAction;
    actQueryOutward: TAction;
    actLaporanRekapitulasiOutward: TAction;
    actQueryInwardKredit: TAction;
    actLaporanDetailKreditMasuk: TAction;
    actLaporanRekapitulasiKreditMasuk: TAction;
    actInterfaceSPK: TAction;
    actLaporanKreditKeluarYgDihapus: TAction;
    actLaporanDebetKeluarYgDihapus: TAction;
    actLaporanStatusBatch: TAction;
    actLaporanKreditMasukPerKodePosting: TAction;
    actLaporanDetailDebetMasuk: TAction;
    actRejectRepairKredit: TAction;
    actOtorisasiKredit: TAction;
    actParamDownloadData: TAction;
    pnlMain: TPanel;
    imgBack: TImage32;
    pnlClear: TPanel;
    imgClear: TImage32;
    acIncrParameterImportDKI: TAction;
    actReSendSPK: TAction;
    lbInfoJam: TLMDInformationLabel;
    actParameterKodePosting: TAction;
    actParameterUserVerify: TAction;
    actParameterExportDPISPK: TAction;
    ARProtector1: TARProtector;
    dxBarManager1: TdxBarManager;
    dxBarHome: TdxBar;
    dxBarKonfigurasi: TdxBar;
    dxBarUtilitas: TdxBar;
    dxBarHelp: TdxBar;
    dxbtnLogin: TdxBarLargeButton;
    dxRibbonHome: TdxRibbonTab;
    dxRibbon: TdxRibbon;
    dxRibbonKonfig: TdxRibbonTab;
    dxRibbonUtilitas: TdxRibbonTab;
    dxRibbonHelp: TdxRibbonTab;
    cxLargeImages: TcxImageList;
    dxbtnSOD: TdxBarLargeButton;
    dxbtnExit: TdxBarLargeButton;
    XPManifest1: TXPManifest;
    dxbtnParameterSistem: TdxBarLargeButton;
    dxbtnParameterWilayah: TdxBarLargeButton;
    dxbtnParameterCabang: TdxBarLargeButton;
    dxbtnParameterCapem: TdxBarLargeButton;
    dxBarKonfiguriasLain: TdxBar;
    dxbtnImportTabelDimensi: TdxBarLargeButton;
    dxbtnParamKonversiRTGS: TdxBarLargeButton;
    dxbtnManajemenUser: TdxBarLargeButton;
    dxbtnBackupDB: TdxBarLargeButton;
    dxbtnRestoreDB: TdxBarLargeButton;
    dxBarLogs: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxRibbonKonversi: TdxRibbonTab;
    dxBarKonversi: TdxBar;
    dxbtnKonversiRTGSSKN: TdxBarLargeButton;
    actKonversiRTGSSKN: TAction;
    actLapKonvPerProses: TAction;
    actLapKonvFormatSKN: TAction;
    actLapKonvFormatREMM: TAction;
    dxBarSubLapKonversi: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    actParamKonvRTGS: TAction;
    dxbtnAbout: TdxBarLargeButton;
    actAbout: TAction;
    dxbtnRegister: TdxBarLargeButton;
    dxbtnSearchKonversi: TdxBarLargeButton;
    actFindKonversi: TAction;
    dxbtnKonversiRTGSSwift: TdxBarLargeButton;
    actKonversiRTGSSwift: TAction;
    imgLitle: TImageList;
    StatusBar: TdxStatusBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    actParamKonvRTGSSwift: TAction;
    actDaftarTTC: TAction;
    actDaftarRekening: TAction;
    actDaftarRekeningPajak: TAction;
    actGenerateSwift: TAction;
    actKonversiSattlement: TAction;
    actGenerateLaporanSettlement: TAction;
    actLapKonvSwift: TAction;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    procedure Exit1Click(Sender: TObject);
    procedure actParameterExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSODExecute(Sender: TObject);
    procedure actDownloadExecute(Sender: TObject);
    procedure actGenerateFormatSKNExecute(Sender: TObject);
    procedure actRejectRepairDebetExecute(Sender: TObject);
    procedure actImportTPKExecute(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure LMDAboutDlg1CustomClick(Sender: TObject);
    procedure ManajemenUser1Click(Sender: TObject);
    procedure actParamWilayahExecute(Sender: TObject);
    procedure actParamCabangExecute(Sender: TObject);
    procedure actParamCapemExecute(Sender: TObject);
    procedure actOtorisasiDebetExecute(Sender: TObject);
    procedure actMonitorTransaksiExecute(Sender: TObject);
    procedure actCariWarkatExecute(Sender: TObject);
    procedure actLaporanTransaksiExecute(Sender: TObject);
    procedure actRegisterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogOffExecute(Sender: TObject);
    procedure actManajUserExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actBackupDBExecute(Sender: TObject);
    procedure actRestoreDBExecute(Sender: TObject);
    procedure actLogAktifitasExecute(Sender: TObject);
    procedure actLogUserExecute(Sender: TObject);
    procedure mxProtectorExpiration(Sender: TObject);
    procedure mxProtectorInvalidSystemTime(Sender: TObject);
    procedure actManageTrxExecute(Sender: TObject);
    procedure WallPaperMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actLaporanDetailKreditKeluarExecute(Sender: TObject);
    procedure actQueryOutwardExecute(Sender: TObject);
    procedure actLaporanDetailDebetKeluarExecute(Sender: TObject);
    procedure actLaporanKreditKeluarYgDihapusExecute(Sender: TObject);
    procedure actLaporanDebetKeluarYgDihapusExecute(Sender: TObject);
    procedure actLaporanStatusBatchExecute(Sender: TObject);
    procedure actLaporanRekapitulasiOutwardExecute(Sender: TObject);
    procedure actIndbDownloadDPITPKExecute(Sender: TObject);
    procedure actIndbDownloadBSKExecute(Sender: TObject);
    procedure actLaporanDetailDebetMasukExecute(Sender: TObject);
    procedure actIndbLaporanPembuatanVoucherExecute(Sender: TObject);
    procedure actIncrDownloadDKIExecute(Sender: TObject);
    procedure actIncrDownloadDataHostExecute(Sender: TObject);
    procedure actIncrDistribusiTransaksiExecute(Sender: TObject);
    procedure actIncrVerifikasiTransaksiExecute(Sender: TObject);
    procedure actIncrOtorisasiTransaksiExecute(Sender: TObject);
    procedure actIncrInterfaceReturKeluarExecute(Sender: TObject);
    procedure actIncrUploadDataKeHostExecute(Sender: TObject);
    procedure actQueryInwardKreditExecute(Sender: TObject);
    procedure actLaporanDetailKreditMasukExecute(Sender: TObject);
    procedure actLaporanKreditMasukPerKodePostingExecute(Sender: TObject);
    procedure actLaporanRekapitulasiKreditMasukExecute(Sender: TObject);
    procedure actRejectRepairKreditExecute(Sender: TObject);
    procedure actOtorisasiKreditExecute(Sender: TObject);
    procedure actInterfaceSPKExecute(Sender: TObject);
    procedure actParamDownloadDataExecute(Sender: TObject);
    procedure acIncrParameterImportDKIExecute(Sender: TObject);
    procedure actReSendSPKExecute(Sender: TObject);
    procedure actParameterKodePostingExecute(Sender: TObject);
    procedure actParameterUserVerifyExecute(Sender: TObject);
    procedure actParameterExportDPISPKExecute(Sender: TObject);
    procedure ARProtector1Idle(Sender: TObject);
    procedure actKonversiRTGSSKNExecute(Sender: TObject);
    procedure actLapKonvPerProsesExecute(Sender: TObject);
    procedure actLapKonvFormatSKNExecute(Sender: TObject);
    procedure actLapKonvFormatREMMExecute(Sender: TObject);
    procedure actParamKonvRTGSExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actFindKonversiExecute(Sender: TObject);
    procedure actKonversiRTGSSwiftExecute(Sender: TObject);
    procedure actKonversiSattlementExecute(Sender: TObject);
    procedure actParamKonvRTGSSwiftExecute(Sender: TObject);
    procedure actDaftarRekeningxecute(Sender: TObject);
    procedure actDaftarRekeningPajakExecute(Sender: TObject);
    procedure actDaftarTTCExecute(Sender: TObject);
    procedure actGenerateLaporanSettlementExecute(Sender: TObject);
    procedure actLapKonvSwiftExecute(Sender: TObject);
  protected
  	procedure CMLogin(var Message:TMessage); message CM_LOGIN;
  	procedure CMRegister(var Message:TMessage); message CM_REGISTER;
  private
    DLLHandle: Cardinal;

  	AContinue: Boolean;
    ReleaseCodeString: string;
    SerialNumber: Longint;
    FUserName,
    FGroupName:string;
    FboExpire:Boolean;
    FConfigFile:String;
    fDLLinst:HINST;
    FParam:String;
    FHasLogin : Boolean;
    FUserPassword:String;

    procedure SetStatusBar;
    function DoRegister: Boolean;
    procedure InitializeFormatDateTime;
    procedure DoLogout;
    procedure UnsetUserActive;
    procedure SetExpandedNavBarGroup(boValue: Boolean);
    procedure SetConfigFile(const Value: String);
    //function ExecDLL(ApplicationHandle:THandle;fFileName,fprocname,fparam:string): integer;
    function ExecLibrary(libType:Integer): integer;
    function ExecRTGSSwiftLibrary(funCall: String): integer;
    { Private declarations }
  public
    { Public declarations }
    FApplicationPath:string;
    //function CompactAndRepair(DB: string): boolean;
    function CheckRegister(boShowMessage:Boolean): Boolean;
    property UserName:string read FUserName Write FUserName;
    property UserPassword:string read FUserPassword Write FUserPassword;
    property ConfigFile:String read FConfigFile write SetConfigFile;
    function DoWriteLog(strUserName: string; intModule: Integer;
      strActivity: string): Integer;
    property HasLogin:Boolean Read FHasLogin write FHasLogin;
  end;

  function GetReg(ApplicationHandle:THandle):boolean; external 'siklib.dll';


var
  frmMain: TfrmMain;

implementation

uses fGlobalVar, fGlobalVarDM, fChangeLog, reg_main, uni_RegCommon, StrUtils, fLogon, fConst,
  fManageUser, fNewGroup, fNewUser, fOptions, fUserMain,
  fRules, fUserLib, fUMCResStr, fLogActivities, futils, fAboutNew, fLocked,
  fTanggalSistem;

{$R *.dfm}

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
	Application.Terminate;
end;

procedure TfrmMain.actParameterExecute(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmKonfigurasi, frmKonfigurasi);
	try
  	frmKonfigurasi.ShowModal;
  finally
  	frmKonfigurasi.Free;
  end;
*)
  ExecLibrary(LIB_PARAM_SISTEM);
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
	Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  FHasLogin := False;

  if qryProcess.Active then
  	qryProcess.Close;
  qryProcess.Connection := GlobalVarDM.MainADOConn;

  if qryLogDaily.Active then
  	qryLogDaily.Close;
  qryLogDaily.Connection := GlobalVarDM.DailyADOConn;

	FApplicationPath:= IncludeTrailingPathDelimiter(GlobalVarForm.SystemApplicationPath);


	if CheckRegister(False) then
  begin
  	actRegister.Enabled := False;
    dxbtnRegister.Enabled := False;
  end
  else begin
  	actRegister.Enabled := True;
    dxbtnRegister.Enabled := True;
  end;

  lbInfoJam.Caption := Format('%s,', [HARI_ID[DayOfWeek(Date)]]);
  //lblProfile.Caption := GlobalVarDM.GetProfileInfo;
//  PostMessage(Handle, CM_REGISTER, 0, 0);

  //  WallPaper.AdvImage.LoadFromFile(ExtractFilePath(Application.ExeName) + 'wall.jpg');
  PostMessage(Handle, CM_LOGIN, 0, 0);
end;

procedure TfrmMain.SetStatusBar;
var
	strCaption:string;
begin
  (*
  lblPresentDate.Caption := FormatDateTime('"Tanggal Kliring : " dd mmmm yyyy', apokPresentWorkDate);
  case apoksysstatus of
    1: sbStatus.Panels[0].Text := 'STATUS: BUKA';
    0: sbStatus.Panels[0].Text := 'STATUS: TUTUP';
    else
      sbStatus.Panels[0].Text := 'STATUS: --';
  end;
  lblLeftCorner.Caption := '';
  lblLeftCorner.Caption := '[' + apokActiveWilKliring + '] ' + apokNamaWilKliring;
  lblLeftCorner.Visible := True;

  tmTimer.Enabled := True;
  sbStatus.OnDrawPanel := sbStatusDrawPanel;
  sbStatus.Repaint;
  *)

	(* Jika pake SOD/EOD
  strCaption := Format(' Tanggal: %s', [FormatDateTime('DD/MM/YYYY', GlobalVarForm.SystemToday)]);
  case GlobalVarForm.SystemStatus of
  	SYS_STATUS_OPENED : strCaption := strCaption + ', Status: Buka';
  	SYS_STATUS_CLOSED : strCaption := strCaption + ', Status: Tutup';
    Else
    	strCaption := strCaption + ', Status: -- ';
  end;
  *)
  strCaption := Format(' Tanggal: %s', [FormatDateTime('DD/MM/YYYY', Now)]);

	StatusBar.Panels[1].Text := strCaption;
	StatusBar.Panels[2].Text := Format('  User: %s [%s]',[FUserName, FGroupName]);
  //StatusBar.Repaint;
  StatusBar.Refresh;
  Application.ProcessMessages;
end;

procedure TfrmMain.actSODExecute(Sender: TObject);
begin
	(*
  Application.CreateForm(TfrmSOD, frmSOD);
	try
  	frmSOD.ShowModal;
    if frmSOD.ModalResult = mrOK then
    begin
    	SetStatusBar;
    end;
  finally
  	frmSOD.Free;
  end;
  *)

  (*
  ExecLibrary(LIB_SOD);
  GlobalVarForm.InitConfig;
  SetStatusBar;
  *)

  Application.CreateForm(TfrmDateActive, frmDateActive);
	try
  	frmDateActive.ShowModal;
    if frmDateActive.ModalResult = mrOK then
    begin
      GlobalVarForm.SystemToday := frmDateActive.dtpSystemDate.Date;
      GlobalVarForm.SystemStatus:= SYS_STATUS_OPENED;

      //GlobalVarForm.InitConfig;
    	SetStatusBar;
    end;
  finally
  	frmDateActive.Free;
  end;

end;

procedure TfrmMain.actDownloadExecute(Sender: TObject);
begin
(*
	if not CheckRegister(True) then
  	Exit;

	if GlobalVarForm.SystemStatus = SYS_STATUS_CLOSED then
  begin
  	MessageDlg('Aplikasi belum awal hari.'#13#10'Proses dibatalkan', mtWarning, [mbOK], 0);
  	Exit;
  end;

	Application.CreateForm(TfrmDownload, frmDownload);
	try
  	frmDownload.ShowModal;
  finally
  	frmDownload.Free;
  end;
*)
  ExecLibrary(LIB_DOWNLOAD_BIMC);

end;

procedure TfrmMain.actGenerateFormatSKNExecute(Sender: TObject);
begin
(*
	if not CheckRegister(True) then
  	Exit;

	if GlobalVarForm.SystemStatus = SYS_STATUS_CLOSED then
  begin
  	MessageDlg('Aplikasi belum awal hari.'#13#10'Proses dibatalkan', mtWarning, [mbOK], 0);
  	Exit;
  end;

	Application.CreateForm(TfrmUpload, frmUpload);
	Application.CreateForm(TfrmReUpload, frmReUpload);
	try
  	frmUpload.ShowModal;
  finally
    frmReUpload.Free;
  	frmUpload.Free;
  end;
*)
  ExecLibrary(LIB_GENERATE_DPO);

end;

procedure TfrmMain.actRejectRepairDebetExecute(Sender: TObject);
begin
(*
	if not CheckRegister(True) then
  	Exit;

	if GlobalVarForm.SystemStatus = SYS_STATUS_CLOSED then
  begin
  	MessageDlg('Aplikasi belum awal hari.'#13#10'Proses dibatalkan', mtWarning, [mbOK], 0);
  	Exit;
  end;

	Application.CreateForm(TfrmCorrection, frmCorrection);
  Application.CreateForm(TfrmCorrectionDetail, frmCorrectionDetail);
	try
    frmCorrection.AuthorizeMode := False;
  	frmCorrection.DoOpenAndRepair;
  finally
  	frmCorrectionDetail.Free;
  	frmCorrection.Free;
  end;
*)
  ExecLibrary(LIB_REJECT_REPAIR_DEBET);

end;

procedure TfrmMain.actImportTPKExecute(Sender: TObject);
begin
(*
  Application.CreateForm(TfrmImportDBTPK, frmImportDBTPK);
	try
  	GlobalVarForm.InitDBTPK;
  	frmImportDBTPK.ShowModal;
  finally
  	frmImportDBTPK.Free;
  end;
*)
  ExecLibrary(LIB_TABEL_DIMENSI);
end;

procedure TfrmMain.About1Click(Sender: TObject);
begin
(*
 if CheckRegister(False) then
 	LMDAboutDlg1.Version := APP_VERSION + ' - Registered'
 else
 	LMDAboutDlg1.Version := APP_VERSION + ' - Unregistered';

 LMDAboutDlg1.Execute;
*)
	AboutBox.ShowModal;
end;

(*
function TfrmMain.CompactAndRepair(DB: string) : boolean;
var
  v: OLEvariant;
begin { CompactAndRepair }
  Result := True;
  try
    v := CreateOLEObject('JRO.JetEngine');
    try
      v.CompactDatabase('Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB,
                        'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB +
                        'x;Jet OLEDB:Engine type=5');
      DeleteFile(DB);
      RenameFile(DB + 'x', DB)
    finally
      v := Unassigned
    end; { try }

  except
    Result := False
  end; { try }
end; { CompactAndRepair }
*)
procedure TfrmMain.LMDAboutDlg1CustomClick(Sender: TObject);
begin
  Application.CreateForm(TfrmChangeLog, frmChangeLog);
	try
  	frmChangeLog.ShowModal;
  finally
  	frmChangeLog.Free;
  end;
end;

procedure TfrmMain.ManajemenUser1Click(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmKonfigurasi, frmKonfigurasi);
	try
  	frmKonfigurasi.ShowModal;
  finally
  	frmKonfigurasi.Free;
  end;
*)
end;

procedure TfrmMain.actParamWilayahExecute(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmRegionMain, frmRegionMain);
	Application.CreateForm(TfrmRegionAdd, frmRegionAdd);
	try
  	frmRegionMain.ShowModal;
  finally
		frmRegionAdd.Free;
		frmRegionMain.Free;
  end;
*)
	ExecLibrary(LIB_PARAM_WILAYAH);
end;

procedure TfrmMain.actParamCabangExecute(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmiBranchMain, frmiBranchMain);
	Application.CreateForm(TfrmiBranchAdd, frmiBranchAdd);
	try
   	frmiBranchMain.ShowModal;
  finally
		frmiBranchAdd.Free;
		frmiBranchMain.Free;
  end;
*)
	ExecLibrary(LIB_PARAM_CABANG);
end;

procedure TfrmMain.actParamCapemExecute(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmISubBranchMain, frmISubBranchMain);
	Application.CreateForm(TfrmISubBranchAdd, frmISubBranchAdd);
	try
   	frmISubBranchMain.ShowModal;
  finally
		frmISubBranchAdd.Free;
		frmISubBranchMain.Free;
  end;
*)
	ExecLibrary(LIB_PARAM_CAPEM);
end;

procedure TfrmMain.actOtorisasiDebetExecute(Sender: TObject);
begin
(*
	if not CheckRegister(True) then
  	Exit;

	if GlobalVarForm.SystemStatus = SYS_STATUS_CLOSED then
  begin
  	MessageDlg('Aplikasi belum awal hari.'#13#10'Proses dibatalkan', mtWarning, [mbOK], 0);
  	Exit;
  end;

	Application.CreateForm(TfrmCorrection, frmCorrection);
  Application.CreateForm(TfrmCorrectionDetail2, frmCorrectionDetail2);
  Application.CreateForm(TfrmAuthReasson, frmAuthReasson);
	try
  	frmCorrection.AuthorizeMode := True;
  	frmCorrection.DoOpenAndRepair;
  finally
  	frmAuthReasson.Free;
  	frmCorrectionDetail2.Free;
  	frmCorrection.Free;
  end;
*)
	ExecLibrary(LIB_AUTHORIZE_TRX_DEBET);
end;

procedure TfrmMain.actMonitorTransaksiExecute(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmMonitoring, frmMonitoring);
	try
  	frmMonitoring.ShowModal;
  finally
  	frmMonitoring.Free;
  end;
*)
	ExecLibrary(LIB_MONITORING_TRX);
end;

procedure TfrmMain.actCariWarkatExecute(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmCari, frmCari);
	try
  	frmCari.ShowModal;
  finally
  	frmCari.Free;
  end;
*)
	ExecLibrary(LIB_CARI_WARKAT);
end;

procedure TfrmMain.actLaporanTransaksiExecute(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmRptDetail, frmRptDetail);
	try
  	frmRptDetail.ShowModal;
  finally
  	frmRptDetail.Free;
  end;
*)
	ExecLibrary(LIB_REPORT_DETAIL);
end;

procedure TfrmMain.CMLogin(var Message: TMessage);
var
  //sobAccess: setofbyte;
  intI: Integer;
begin
  ARProtector1.Enabled := False;
	FHasLogin := False;
  //lblLeftCorner.Caption := '';
  //lblLeftCorner.Visible := True;
  //lblPresentDate.Caption := '';
  //Panel3.Caption := '';
  //tmTimer.Enabled := False;
  StatusBar.Panels[0].Text := '';
  StatusBar.Panels[1].Text := '';
  StatusBar.Panels[2].Text := '';
  StatusBar.Panels[3].Text := '';
  //Read the configuration from the database
  frmUserLib.usrLoadDBConfiguration;
  //sbStatus.OnDrawPanel := nil;
  StatusBar.Refresh;

  if frmLogin.ShowModal=mrOK then
  begin

    //Self.Menu := menuBNISY;
    pnlClear.SendToBack;
    pnlMain.BringToFront;
    //pnlClear.Visible := False;
    //pnlMain.Visible := True;
    Application.ProcessMessages;

    GlobalVarForm.SystemToday := Date;
    GlobalVarForm.SystemStatus := SYS_STATUS_OPENED;

    frmUserLib.usrUserModuleAccess(frmLogin.UserName);

    for intI:=0 to ActionList.ActionCount-1 do
    begin
      if TAction(ActionList.Actions[intI]).Name <> 'actRegister' then
      begin
        if TAction(ActionList.Actions[intI]).Tag<>0 then
          TAction(ActionList.Actions[intI]).Enabled := frmUserLib.usrCheckRights(TAction(ActionList.Actions[intI]).Tag)
        else
          TAction(ActionList.Actions[intI]).Enabled := True;
      end;
    end;

    (*
    if not frmUserLib.usrCheckRights(actHeaderManajemenDB.Tag) then
    begin
      dxbtnManajemenUser.Enabled := False;
      actHeaderManajemenDB.Enabled := False;
      actBackupDB.Enabled := False;
      actRestoreDB.Enabled := False;
    end;
    *)
    (*
    if not frmUserLib.usrCheckRights(actHeaderViewLog.Tag) then
    begin
      dxBarLogs.Enabled := False;
      actHeaderViewLog.Enabled := False;
      actLogAktifitas.Enabled := False;
      actLogUser.Enabled := False;
    end;
    *)
    (*
    if not usrCheckRights(acHeaderEkspor.Tag) then
    begin
      acCLS.Visible := False;
      acTransaksi.Visible := False;
      acEksporSortPattern.Visible := False;
      acSandiBank.Visible := False;
      acInwardPerBank.Visible := False;
    end;
    *)
    (*
    if not apokcheckRights(acHeaderFileInterface.Tag) then
    begin
      acImportTableDimensi.Visible := False;
      acHeaderEkspor.Visible := False;
      acCLS.Visible := False;
      acTransaksi.Visible := False;
      acEksporSortPattern.Visible := False;
      acSandiBank.Visible := False;
      acInwardPerBank.Visible := False;
    end;
    *)
    (*
    if not apokcheckRights(acHeaderKonfigurasi.Tag) then
    begin
      acMasterUmum.Visible := False;
      acMasterBank.Visible := False;
      acMasterKBI.Visible := False;
      acMasterWilayah.Visible := False;
      acMasterCabang.Visible := False;
      acBankPengalihan.Visible := False;
      acLiburNasional.Visible := False;
      acLiburWilayah.Visible := False;
      acSortPattern.Visible := False;
      acParaBackupRestore.Visible := False;
    end;
    *)
    (*
    if not apokCheckRights(acHeaderMDB.Tag) then
    begin
      acBackupDB.Visible := False;
      acRestoreDB.Visible := False;
    end;
    *)

    FUserName := frmLogin.UserName;
    FUserPassword := frmLogin.edPass.Text;
    FGroupName := frmLogin.GroupName;
    FParam := FConfigFile + ';' + FUserName + ';' + FGroupName;
    SetStatusBar;


    //SetExpandedNavBarGroup(True);
    //DoRefresh;
    //UpdateInfoPanel;

    dxRibbonHome.Active := True;
    dxRibbon.ShowTabGroups := True;

    FHasLogin := True;
    //ARProtector1.Enabled := True;
    Application.ProcessMessages;
    //sbStatus.Repaint;
  end
  else begin
    //If user cancel the login form, close the application
    ModalResult := mrOK;
    Close;
  end;
end;

procedure TfrmMain.CMRegister(var Message: TMessage);
var
	strBranch:string;
  boNewRegister:Boolean;
  dtExpire:TDateTime;
begin
  boNewRegister := False;
  GetRegistrationInformation(ReleaseCodeString, SerialNumber);
  AContinue:= False;
  AContinue:=IsReleaseCodeValid(ReleaseCodeString, SerialNumber,dtExpire);

  if not AContinue then
  begin
    AContinue:= regMain.ShowModal=mrOK;
    if AContinue then
    	boNewRegister := True;
  end;

  if AContinue then
  begin
    if boNewRegister then
    begin
  		strBranch := RightStr(regMain.edtSerial.Text, 5);
    	GlobalVarForm.BankActiveBranch := strBranch;
    end;
  	ModalResult := mrOK;
  	//Application.Run;
  end
  else
  begin
    MessageDlg('Invalid release code. Cannot continue.', mtError, [mbOK], 0);
    Application.Terminate;
  end;
end;

function TfrmMain.CheckRegister(boShowMessage:Boolean):Boolean;
var
	RegistrationInfo : TStringList;
  strTemp, strTemp2:string;
  boRsl:Boolean;
  dtExpire:TDateTime;
  boExpire:Boolean;
begin
  Result := True;
	boRsl := True;
  boExpire := False;
  try
    if FileExists(FApplicationPath + 'registration.dat') then
    begin
      RegistrationInfo := TStringList.Create;
      try
        try
          RegistrationInfo.LoadFromFile(FApplicationPath + 'registration.dat');
          strTemp := RegistrationInfo.Strings[0];
          strTemp2:= Format('%d', [StrToInt(Trim(GlobalVarForm.BankCode) + Trim(GlobalVarForm.BankActiveBranch))]);
          if CompareStr(strTemp, strTemp2) <> 0 then
          begin
            boRsl := False;
          end;
        finally
          RegistrationInfo.Free;
        end;
      except
        boRsl := False;
      end;
    end
    else begin
      boRsl := False;
    end;

    SetApplicationPath(FApplicationPath);
    if boRsl then
    begin
      GetRegistrationInformation(ReleaseCodeString, SerialNumber);
      boRsl := False;
      boRsl := IsReleaseCodeValid(ReleaseCodeString, SerialNumber, dtExpire);
    end;

    if boRsl then
    begin
      if IsAppExpired(ReleaseCodeString) then
        boRsl := False
      else begin
        boRsl := True;
        boExpire := GetReg(Application.Handle);
        if boExpire then
        	boRsl := False;
      end;

      if (not (boRsl)) and  (boShowMessage) then
      begin
      	if boExpire then
        	MessageDlg( 'Your system time is invalid.'#13#10'Please contact your vendor.', mtError, [ mbOK ], 0 )
        else
        	MessageDlg('Aplikasi sudah kedaluarsa.'#13#10'Silahkan lakukan register aplikasi', mtError, [mbOK], 0);
      end;
    end
    else begin
      if boShowMessage then
        MessageDlg('Aplikasi tidak teregister dengan benar.'#13#10'Silahkan lakukan register aplikasi', mtError, [mbOK], 0);
    end;

    Result := boRsl;
    //if (not (Result)) and  (boShowMessage) then
    //	MessageDlg('Aplikasi tidak teregister dengan benar.'#13#10'Silahkan lakukan register aplikasi', mtError, [mbOK], 0);
  except
  	On E:Exception do
    begin
    	MessageDlg('Error On Register : ' + E.Message, mtError, [mbOK], 0);
      Result := False;
    end;
  end;
end;


function TfrmMain.DoRegister:Boolean;
var
	strBranch:string;
  boNewRegister:Boolean;
  dtExpire:TDateTime;
begin
	Result := False;

  boNewRegister := False;
  GetRegistrationInformation(ReleaseCodeString, SerialNumber);
  AContinue:= False;
  AContinue:=IsReleaseCodeValid(ReleaseCodeString, SerialNumber, dtExpire);

  if not AContinue then
  begin
    AContinue:= regMain.ShowModal=mrOK;
    if AContinue then
    	boNewRegister := True;
  end;

  if AContinue then
  begin
    if boNewRegister then
    begin
  		strBranch := RightStr(regMain.edtSerial.Text, 5);
    	GlobalVarForm.BankActiveBranch := strBranch;
    end;
  	Result := True;
  end
  else
  begin
    MessageDlg('Invalid release code. Cannot continue.', mtError, [mbOK], 0);
  end;
end;

procedure TfrmMain.actRegisterExecute(Sender: TObject);
begin
	if DoRegister then
  	Application.Terminate;

	if CheckRegister(False) then
  begin
  	actRegister.Enabled := False;
    dxbtnRegister.Enabled := False;
  end
  else begin
  	actRegister.Enabled := True;
    dxbtnRegister.Enabled := True;
  end;
end;

procedure TfrmMain.InitializeFormatDateTime;

  function LocalGetLocaleStr(LocaleType, Index: Integer): string;
  begin
    Result := GetLocaleStr(LANG_INDONESIAN, LocaleType, '');
  end;

var
  I, Day: Integer;
begin
  for I := 1 to 12 do
  begin
    LongMonthNames[I] := LocalGetLocaleStr(LOCALE_SMONTHNAME1 + I - 1,
      I - Low(LongMonthNames));
  end;

  for I := 1 to 7 do
  begin
    Day := (I + 5) mod 7;
    LongDayNames[I] := LocalGetLocaleStr(LOCALE_SDAYNAME1 + Day,
      I - Low(LongDayNames));
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
	bgFile,bgFile2:String;
begin
	DoubleBuffered := True;

  ARProtector1.Enabled := False;
  
  ShortDateFormat := SDF_ENGLISH_US;
  DateSeparator   := '/';

  bgfile := ExtractFilePath(Application.ExeName) + 'bgMain.bmp';
  if FileExists(bgFile) then
  	imgBack.Bitmap.LoadFromFile(bgFile);

  bgFile2 := ExtractFilePath(Application.ExeName) + 'bgLogin.bmp';
  if FileExists(bgFile2) then
  	imgClear.Bitmap.LoadFromFile(bgFile2);

  FboExpire := False;
	InitializeFormatDateTime;
  SetExpandedNavBarGroup(False);
  LMDAboutDlg1.Version := APP_VERSION;
  FUserName := '';
  FGroupName := '';

  Self.Menu := nil;
  pnlMain.SendToBack;
  pnlClear.BringToFront;
  //pnlClear.Visible := True;
  //pnlMain.Visible := False;
  Application.ProcessMessages;

  dxRibbon.ShowTabGroups := False;
end;

procedure TfrmMain.DoLogout;
begin
  //tmTimer.Enabled := False;

  //ClearListView;

  SetExpandedNavBarGroup(False);

  //UnsetUserActive;
  //Display the fmLogin form
  dxRibbon.ShowTabGroups := False;

  PostMessage(Handle, CM_LOGIN, 0, 0);
end;

procedure TfrmMain.UnsetUserActive;
begin
  //Logoff the user from database record
  with qryProcess do
  begin
    //Find the user record in the Users table
    if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT user_active FROM ' + DB_TABLE_USER + ' WHERE user_name=''' + frmUserLib.encUser(frmLogin.UserName) + '''');
    Open;
    try
      if RecordCount=0 then
      begin
      end
      else begin
        Edit;
        //Set the user active flag to inactive
        FieldByName('user_active').AsBoolean := Boolean(US_INACTIVE);
        Post;
      end;
      frmUserLib.usrLogWrite(frmLogin.UserName, MDL_LOGIN, 'User log out.');
      //Write the log
      //cdsLogWrite(fmLogin.UserID, ET_MMC, fmLogin.UserID, ACT_LOGOFF, INFO_LOGIN+' : '+Format(SEC_LOGOUT,[fmLogin.CurrentTerminal]));
    finally
      if Active then
      	Close;
    end;
  end;
end;

procedure TfrmMain.actLogOffExecute(Sender: TObject);
begin
  FHasLogin := False;

  pnlMain.SendToBack;
  Self.Menu := Nil;
  pnlClear.BringToFront;
  //pnlClear.Visible := True;
  //pnlMain.Visible := False;
	Application.ProcessMessages;

	DoLogout;
end;

procedure TfrmMain.actManajUserExecute(Sender: TObject);
var
	intI : Integer;
begin
	intI := ruleInitModule(GlobalVarDM.MainADOConn);
	Application.CreateForm(TfrmMainUser, frmMainUser);
  Application.CreateForm(TfmOptions, fmOptions);
  Application.CreateForm(TfmNewGroup, fmNewGroup);
  Application.CreateForm(TfmManageUser, fmManageUser);
  Application.CreateForm(TfmNewUser, fmNewUser);
  try
		frmMainUser.UserName := FUserName;
    frmMainUser.ShowModal;
  finally
    fmOptions.Free;
    fmNewGroup.Free;
    fmManageUser.Free;
    fmNewUser.Free;
    frmMainUser.Free;
    ruleDeInitModule;
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //If the ModalResult is set to mrOk (by CMLogin) then the form can be closed
  if ModalResult=mrOK then
    CanClose := True
  else begin
    CanClose := False;
    //Ask for user confirmation to logoff from the application
    if MessageDlg(MSG_LOGOUT, mtConfirmation, [mbYes,mbNo], 0)=mrYes then
    begin
      // Close
      Application.Terminate;
    end;
  end;
end;

procedure TfrmMain.actBackupDBExecute(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmBackup, frmBackup);
  try
  	frmBackup.ShowModal;
  finally
  	frmBackup.Free;
  end;
*)
  ExecLibrary(LIB_BACKUP_DB);
end;

procedure TfrmMain.actRestoreDBExecute(Sender: TObject);
begin
(*
	Application.CreateForm(TfrmRestore, frmRestore);
  try
  	frmRestore.ShowModal;
    if frmRestore.ModalResult = mrOK then
    	Application.Terminate;
  finally
  	frmRestore.Free;
  end;
*)
  ExecLibrary(LIB_RESTORE_DB);
end;

function TfrmMain.DoWriteLog(strUserName: string; intModule: Integer; strActivity: string): Integer;
begin
  Result := -1;
  try
    try
      with qryLogDaily do
      begin
        if Active then
          Close;
        SQL.Clear;
        SQL.Add('INSERT INTO ' + DB_TABLE_TRX_LOGS + '(log_date, log_user, log_module, log_desc)');
        if GlobalVarForm.DBType = 1 then
        	SQL.Add('VALUES (Now()')
        else
        	SQL.Add('VALUES (GetDate()');
        SQL.Add(', ' + QuotedStr(frmUserLib.encUser(strUserName)) + ', ' + IntToStr(intModule) + ', ' + QuotedStr(strActivity)  + ')');
        ExecSQL;
      end;
      Result:=0;
    except
      on excE: Exception do
      begin
        MessageBox(0, PChar(excE.Message), PChar('Write Log'), MB_ICONERROR);
      end;
    end;
  finally
  end;
end;

procedure TfrmMain.actLogAktifitasExecute(Sender: TObject);
begin
	Application.CreateForm(TfrmAppLog, frmAppLog);
  try
  	frmAppLog.LogType := ltTrx;
  	frmAppLog.ShowModal;
  finally
  	frmAppLog.Free;
  end;
end;

procedure TfrmMain.actLogUserExecute(Sender: TObject);
begin
	Application.CreateForm(TfrmAppLog, frmAppLog);
  try
  	frmAppLog.LogType := ltUser;
  	frmAppLog.ShowModal;
  finally
  	frmAppLog.Free;
  end;
end;

procedure TfrmMain.SetExpandedNavBarGroup(boValue: Boolean);
var
  btI: Byte;
begin
  (*
  for btI := 0 to NavBarMenu.Groups.Count-1 do
  begin
    NavBarMenu.Groups[btI].Expanded := boValue;
  end;
  *)
end;

procedure TfrmMain.mxProtectorExpiration(Sender: TObject);
begin
	FboExpire := True;
end;

procedure TfrmMain.mxProtectorInvalidSystemTime(Sender: TObject);
begin
	FboExpire := True;
end;

procedure TfrmMain.actManageTrxExecute(Sender: TObject);
begin
(*
	if not CheckRegister(True) then
  	Exit;

	if GlobalVarForm.SystemStatus = SYS_STATUS_CLOSED then
  begin
  	MessageDlg('Aplikasi belum awal hari.'#13#10'Proses dibatalkan', mtWarning, [mbOK], 0);
  	Exit;
  end;

	Application.CreateForm(TfrmManagTrx, frmManagTrx);
	try
  	frmManagTrx.ShowModal;
  finally
  	frmManagTrx.Free;
  end;
*)
  ExecLibrary(LIB_MANAGE_TRX);
end;

procedure TfrmMain.WallPaperMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	SecretSpot : TPoint;
begin
	SecretSpot.x := 1; {little under and little to the right}
  SecretSpot.y := 1; {from the top left corner of a form}
  if (X=SecretSpot.x) and (Y=SecretSpot.y) then
    ShowMessage('Created @2013, by atsSoft - ats76id@gmail.com');
end;

procedure TfrmMain.SetConfigFile(const Value: String);
begin
  FConfigFile := Value;
end;

(*
function TfrmMain.ExecDLL(ApplicationHandle:THandle;fFileName,fprocname,fparam:string): integer;
var
  tempStr:  PChar;
  fDLLproc: function(ApplicationHandle: THandle; Param: PChar): integer;
begin
  Result := -1;
  if fDLLinst = 0 then
  begin
    fDLLinst := LoadLibrary(PChar(ffilename));
    if fDLLinst <> 0 then
    begin
      fDLLProc := GetProcAddress(fDLLinst, PChar(fprocname));
    end
    else
    begin
      raise Exception.Create('Failed to load DLL : ' + ffilename);
    end;
  end;

  if (fDLLinst = 0) or not (Assigned(fDLLProc)) then
  begin
    raise Exception.Create('Failed to load DLL : ' + ffilename +
      ', function : ' + fprocname + ', Code : ' + IntToStr(GetLastError));
  end
  else
  begin
    //fReturnStr := '';
    //Windows.MessageBox(0,PChar(fparam),'Parameters',MB_ICONINFORMATION);
    tempStr    := StrPCopy(StrAlloc(256), fparam);
    try
      Result := fDLLproc(Application.Handle, tempStr);
      if StrPas(tempStr) <> fparam then
        fReturnStr := StrPas(tempStr);
    finally
      StrDispose(tempStr);
      FreeLibrary(fDLLinst);
      fDLLinst := 0;
    end;
  end;
end;
*)
function TfrmMain.ExecLibrary(libType:Integer): integer;
var
  libFile,
  libFunc:string;
begin
	Result := -1;
  case libType of
  	LIB_SOD:
    	begin
      	libFile := GetItem(DLL_CALL_SOD,';',0);
        libFunc := GetItem(DLL_CALL_SOD,';',1);
      end;
  	LIB_PARAM_SISTEM:
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_SYS,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_SYS,';',1);
      end;
  	LIB_PARAM_WILAYAH:
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_WILAYAH,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_WILAYAH,';',1);
      end;
  	LIB_PARAM_CABANG:
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_CABANG,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_CABANG,';',1);
      end;
  	LIB_PARAM_CAPEM:
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_CAPEM,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_CAPEM,';',1);
      end;
  	LIB_BACKUP_DB:
    	begin
      	libFile := GetItem(DLL_CALL_BACKUP_DB,';',0);
        libFunc := GetItem(DLL_CALL_BACKUP_DB,';',1);
      end;
  	LIB_RESTORE_DB:
    	begin
      	libFile := GetItem(DLL_CALL_RESTORE_DB,';',0);
        libFunc := GetItem(DLL_CALL_RESTORE_DB,';',1);
      end;
  	LIB_TABEL_DIMENSI:
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_DBTPK,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_DBTPK,';',1);
      end;
		LIB_DOWNLOAD_BIMC :
    	begin
      	libFile := GetItem(DLL_CALL_DOWNLOAD_BIMC,';',0);
        libFunc := GetItem(DLL_CALL_DOWNLOAD_BIMC,';',1);
      end;
		LIB_REJECT_REPAIR_DEBET :
    	begin
      	libFile := GetItem(DLL_CALL_REJECT_REPAIR,';',0);
        libFunc := GetItem(DLL_CALL_REJECT_REPAIR,';',1);
      end;
		LIB_REJECT_REPAIR_CREDIT :
    	begin
      	libFile := GetItem(DLL_CALL_REJECT_REPAIR_CREDIT,';',0);
        libFunc := GetItem(DLL_CALL_REJECT_REPAIR_CREDIT,';',1);
      end;
    LIB_AUTHORIZE_TRX_DEBET :
    	begin
      	libFile := GetItem(DLL_CALL_AUTH_REPAIR_DEBET,';',0);
        libFunc := GetItem(DLL_CALL_AUTH_REPAIR_DEBET,';',1);
      end;
    LIB_AUTHORIZE_TRX_CREDIT :
    	begin
      	libFile := GetItem(DLL_CALL_AUTH_REPAIR_CREDIT,';',0);
        libFunc := GetItem(DLL_CALL_AUTH_REPAIR_CREDIT,';',1);
      end;
    LIB_GENERATE_DPO :
    	begin
      	libFile := GetItem(DLL_CALL_GENERATE_DPO,';',0);
        libFunc := GetItem(DLL_CALL_GENERATE_DPO,';',1);
      end;
    LIB_MONITORING_TRX :
    	begin
      	libFile := GetItem(DLL_CALL_MONITORING_TRX,';',0);
        libFunc := GetItem(DLL_CALL_MONITORING_TRX,';',1);
      end;
    LIB_MANAGE_TRX :
    	begin
      	libFile := GetItem(DLL_CALL_MANAGE_TRX,';',0);
        libFunc := GetItem(DLL_CALL_MANAGE_TRX,';',1);
      end;
    LIB_CARI_WARKAT :
    	begin
      	libFile := GetItem(DLL_CALL_CARI_WARKAT,';',0);
        libFunc := GetItem(DLL_CALL_CARI_WARKAT,';',1);
      end;
    LIB_INTERFACE_SPK :
    	begin
      	libFile := GetItem(DLL_CALL_INTERFACE_SPK,';',0);
        libFunc := GetItem(DLL_CALL_INTERFACE_SPK,';',1);
      end;
  	LIB_PARAM_DOWNLOAD_DATA_HOST:
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_DOWNLOAD_DATA_HOST,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_DOWNLOAD_DATA_HOST,';',1);
      end;
  	LIB_PARAM_IMPORT_DKI:
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_IMPORT_DKI,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_IMPORT_DKI,';',1);
      end;
  	LIB_IMPORT_DKI:
    	begin
      	libFile := GetItem(DLL_CALL_IMPORT_DKI,';',0);
        libFunc := GetItem(DLL_CALL_IMPORT_DKI,';',1);
      end;
  	LIB_IMPORT_DKIHOST:
    	begin
      	libFile := GetItem(DLL_CALL_IMPORT_DKIHOST,';',0);
        libFunc := GetItem(DLL_CALL_IMPORT_DKIHOST,';',1);
      end;
		LIB_RESEND_SPK:
    	begin
      	libFile := GetItem(DLL_CALL_RESEND_SPK,';',0);
        libFunc := GetItem(DLL_CALL_RESEND_SPK,';',1);
      end;
		LIB_PARAM_KODE_POSTING:
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_KODE_POSTING,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_KODE_POSTING,';',1);
      end;
		LIB_DISTRIBUSI_KREDIT_MASUK:
    	begin
      	libFile := GetItem(DLL_CALL_DISTRIBUSI_KREDIT_MASUK,';',0);
        libFunc := GetItem(DLL_CALL_DISTRIBUSI_KREDIT_MASUK,';',1);
      end;
    LIB_PARAM_USER_VERIFY :
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_USER_VERIFY,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_USER_VERIFY,';',1);
      end;
		LIB_VERIFIKASI_KREDIT_MASUK:
    	begin
      	libFile := GetItem(DLL_CAL_VERIFIKASI_KREDIT_MASUK,';',0);
        libFunc := GetItem(DLL_CAL_VERIFIKASI_KREDIT_MASUK,';',1);
      end;
		LIB_OTORISASI_KREDIT_MASUK:
    	begin
      	libFile := GetItem(DLL_CAL_OTORISASI_KREDIT_MASUK,';',0);
        libFunc := GetItem(DLL_CAL_OTORISASI_KREDIT_MASUK,';',1);
      end;
  	LIB_UPLOAD_DKI:
    	begin
      	libFile := GetItem(DLL_CALL_UPLOAD_DKI,';',0);
        libFunc := GetItem(DLL_CALL_UPLOAD_DKI,';',1);
      end;
    LIB_CARI_WARKAT_INCR :
    	begin
      	libFile := GetItem(DLL_CALL_CARI_WARKAT_INCR,';',0);
        libFunc := GetItem(DLL_CALL_CARI_WARKAT_INCR,';',1);
      end;
		LIB_INTF_RETUR_KREDIT_KELUAR:
    	begin
      	libFile := GetItem(DLL_CALL_INTF_RETUR_KREDIT_KELUAR,';',0);
        libFunc := GetItem(DLL_CALL_INTF_RETUR_KREDIT_KELUAR,';',1);
      end;
		LIB_EXPORT_DPI:
    	begin
      	libFile := GetItem(DLL_CALL_EXPORT_DPI,';',0);
        libFunc := GetItem(DLL_CALL_EXPORT_DPI,';',1);
      end;
		LIB_PARAM_EXPORT_DPISPK:
    	begin
      	libFile := GetItem(DLL_CALL_PARAM_EXPORT_DPISPK,';',0);
        libFunc := GetItem(DLL_CALL_PARAM_EXPORT_DPISPK,';',1);
      end;

		(* Report *)
    LIB_DB_LAPORAN_DETAIL:
    	begin
      	libFile := GetItem(DLL_CALL_DB_LAPORAN_DETAIL,';',0);
        libFunc := GetItem(DLL_CALL_DB_LAPORAN_DETAIL,';',1);
      end;
    LIB_DB_LAPORAN_DELETED:
    	begin
      	libFile := GetItem(DLL_CALL_DB_LAPORAN_DELETED,';',0);
        libFunc := GetItem(DLL_CALL_DB_LAPORAN_DELETED,';',1);
      end;
    LIB_KR_LAPORAN_DETAIL:
    	begin
      	libFile := GetItem(DLL_CALL_KR_LAPORAN_DETAIL,';',0);
        libFunc := GetItem(DLL_CALL_KR_LAPORAN_DETAIL,';',1);
      end;
    LIB_KR_LAPORAN_DELETED:
    	begin
      	libFile := GetItem(DLL_CALL_KR_LAPORAN_DELETED,';',0);
        libFunc := GetItem(DLL_CALL_KR_LAPORAN_DELETED,';',1);
      end;
    LIB_LAPORAN_SUMMARY:
    	begin
      	libFile := GetItem(DLL_CALL_LAPORAN_SUMMARY,';',0);
        libFunc := GetItem(DLL_CALL_LAPORAN_SUMMARY,';',1);
      end;
    LIB_REPORT_STATUS_BATCH:
    	begin
      	libFile := GetItem(DLL_CALL_REPORT_STATUS_BATCH,';',0);
        libFunc := GetItem(DLL_CALL_REPORT_STATUS_BATCH,';',1);
      end;
		LIB_REPORT_INCR_DETAIL:
    	begin
      	libFile := GetItem(DLL_CALL_REPORT_INCR_DETAIL,';',0);
        libFunc := GetItem(DLL_CALL_REPORT_INCR_DETAIL,';',1);
      end;
		LIB_REPORT_INCR_PER_KODE_POSTING:
    	begin
      	libFile := GetItem(DLL_CALL_REPORT_INCR_PER_KODE_POSTING,';',0);
        libFunc := GetItem(DLL_CALL_REPORT_INCR_PER_KODE_POSTING,';',1);
      end;
		LIB_REPORT_INCR_REKAP:
    	begin
      	libFile := GetItem(DLL_CALL_REPORT_INCR_REKAP,';',0);
        libFunc := GetItem(DLL_CALL_REPORT_INCR_REKAP,';',1);
      end;
		LIB_INDB_LAPORAN_DETAIL:
    	begin
      	libFile := GetItem(DLL_CALL_INDB_LAPORAN_DETAIL,';',0);
        libFunc := GetItem(DLL_CALL_INDB_LAPORAN_DETAIL,';',1);
      end;
    (* End Report *)

    (* Tools *)
    LIB_TOOLS_CONVERT_RTGS2G2INDV:
    	begin
      	libFile := GetItem(DLL_CALL_TOOLS_CONVERT_RTGS2G2INDV,';',0);
        libFunc := GetItem(DLL_CALL_TOOLS_CONVERT_RTGS2G2INDV,';',1);
      end;
    LIB_TOOLS_PARAM_CONVERT_RTGS2SKN:
    	begin
      	libFile := GetItem(DLL_CALL_TOOLS_PARAM_CONVERT_RTGS2SKN,';',0);
        libFunc := GetItem(DLL_CALL_TOOLS_PARAM_CONVERT_RTGS2SKN,';',1);
      end;
    LIB_TOOLS_CARI_KONVERSI:
    	begin
      	libFile := GetItem(DLL_CALL_TOOLS_CARI_KONVERSI,';',0);
        libFunc := GetItem(DLL_CALL_TOOLS_CARI_KONVERSI,';',1);
      end;
    LIB_REPORT_CONVERT_PER_FILE:
    	begin
      	libFile := GetItem(DLL_CALL_REPORT_CONVERT_PER_FILE,';',0);
        libFunc := GetItem(DLL_CALL_REPORT_CONVERT_PER_FILE,';',1);
      end;
    LIB_REPORT_CONVERT_DKOI:
    	begin
      	libFile := GetItem(DLL_CALL_REPORT_CONVERT_DKOI,';',0);
        libFunc := GetItem(DLL_CALL_REPORT_CONVERT_DKOI,';',1);
      end;
    LIB_REPORT_CONVERT_REMM:
    	begin
      	libFile := GetItem(DLL_CALL_REPORT_CONVERT_REMM,';',0);
        libFunc := GetItem(DLL_CALL_REPORT_CONVERT_REMM,';',1);
      end;

    (* End Tools *)
  end;

  libFile := ChangeFileExt(libFile, '.dll');
  ExecDLL2(Application.Handle, libFile, libFunc, FParam, FUserName);
  Result := 0;
end;

function TfrmMain.ExecRTGSSwiftLibrary(funCall:String): integer;
begin
  Result := -1;
  ExecDLL2(Application.Handle, 'RTGSDLL.dll', funCall, GlobalVarDM.DailyADOConn.ConnectionString, frmUserLib.encUser(FUserName),1);
  Result := 0;
end;

procedure TfrmMain.actLaporanDetailKreditKeluarExecute(Sender: TObject);
begin
	ExecLibrary(LIB_KR_LAPORAN_DETAIL);
end;

procedure TfrmMain.actQueryOutwardExecute(Sender: TObject);
begin
  ExecLibrary(LIB_CARI_WARKAT);
end;

procedure TfrmMain.actLaporanDetailDebetKeluarExecute(Sender: TObject);
begin
	ExecLibrary(LIB_DB_LAPORAN_DETAIL);
end;

procedure TfrmMain.actLaporanKreditKeluarYgDihapusExecute(Sender: TObject);
begin
	ExecLibrary(LIB_KR_LAPORAN_DELETED);
end;

procedure TfrmMain.actLaporanDebetKeluarYgDihapusExecute(Sender: TObject);
begin
	ExecLibrary(LIB_DB_LAPORAN_DELETED);
end;

procedure TfrmMain.actLaporanStatusBatchExecute(Sender: TObject);
begin
	ExecLibrary(LIB_REPORT_STATUS_BATCH);
end;

procedure TfrmMain.actLaporanRekapitulasiOutwardExecute(Sender: TObject);
begin
	ExecLibrary(LIB_LAPORAN_SUMMARY);
end;

procedure TfrmMain.actIndbDownloadDPITPKExecute(Sender: TObject);
begin
	ExecLibrary(LIB_EXPORT_DPI);
end;

procedure TfrmMain.actIndbDownloadBSKExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.actLaporanDetailDebetMasukExecute(Sender: TObject);
begin
	ExecLibrary(LIB_INDB_LAPORAN_DETAIL);
end;

procedure TfrmMain.actIndbLaporanPembuatanVoucherExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.actIncrDownloadDKIExecute(Sender: TObject);
begin
	ExecLibrary(LIB_IMPORT_DKI);
end;

procedure TfrmMain.actIncrDownloadDataHostExecute(Sender: TObject);
begin
	ExecLibrary(LIB_IMPORT_DKIHOST);
end;

procedure TfrmMain.actIncrDistribusiTransaksiExecute(Sender: TObject);
begin
	ExecLibrary(LIB_DISTRIBUSI_KREDIT_MASUK);
end;

procedure TfrmMain.actIncrVerifikasiTransaksiExecute(Sender: TObject);
begin
	ExecLibrary(LIB_VERIFIKASI_KREDIT_MASUK);
end;

procedure TfrmMain.actIncrOtorisasiTransaksiExecute(Sender: TObject);
begin
	ExecLibrary(LIB_OTORISASI_KREDIT_MASUK);
end;

procedure TfrmMain.actIncrInterfaceReturKeluarExecute(Sender: TObject);
begin
	ExecLibrary(LIB_INTF_RETUR_KREDIT_KELUAR);
end;

procedure TfrmMain.actIncrUploadDataKeHostExecute(Sender: TObject);
begin
	ExecLibrary(LIB_UPLOAD_DKI);
end;

procedure TfrmMain.actQueryInwardKreditExecute(Sender: TObject);
begin
  ExecLibrary(LIB_CARI_WARKAT_INCR);
end;

procedure TfrmMain.actLaporanDetailKreditMasukExecute(Sender: TObject);
begin
  ExecLibrary(LIB_REPORT_INCR_DETAIL);
end;

procedure TfrmMain.actLaporanKreditMasukPerKodePostingExecute(
  Sender: TObject);
begin
	ExecLibrary(LIB_REPORT_INCR_PER_KODE_POSTING);
end;

procedure TfrmMain.actLaporanRekapitulasiKreditMasukExecute(
  Sender: TObject);
begin
	ExecLibrary(LIB_REPORT_INCR_REKAP);
end;

procedure TfrmMain.actRejectRepairKreditExecute(Sender: TObject);
begin
  ExecLibrary(LIB_REJECT_REPAIR_CREDIT);
end;

procedure TfrmMain.actOtorisasiKreditExecute(Sender: TObject);
begin
	ExecLibrary(LIB_AUTHORIZE_TRX_CREDIT);
end;

procedure TfrmMain.actInterfaceSPKExecute(Sender: TObject);
begin
	ExecLibrary(LIB_INTERFACE_SPK);
end;

procedure TfrmMain.actParamDownloadDataExecute(Sender: TObject);
begin
	ExecLibrary(LIB_PARAM_DOWNLOAD_DATA_HOST);
end;

procedure TfrmMain.acIncrParameterImportDKIExecute(Sender: TObject);
begin
	ExecLibrary(LIB_PARAM_IMPORT_DKI);
end;

procedure TfrmMain.actReSendSPKExecute(Sender: TObject);
begin
	ExecLibrary(LIB_RESEND_SPK);
end;

procedure TfrmMain.actParameterKodePostingExecute(Sender: TObject);
begin
	ExecLibrary(LIB_PARAM_KODE_POSTING);
end;

procedure TfrmMain.actParameterUserVerifyExecute(Sender: TObject);
begin
	ExecLibrary(LIB_PARAM_USER_VERIFY);
end;

procedure TfrmMain.actParameterExportDPISPKExecute(Sender: TObject);
begin
	ExecLibrary(LIB_PARAM_EXPORT_DPISPK);
end;

procedure TfrmMain.ARProtector1Idle(Sender: TObject);
begin
  //bugfix
  if (MinutesBetween(now,StartOfTheDay(Tomorrow)) < 1) then begin
    exit;
  end;

	if FHasLogin then
  begin
	  FrmLocked.edPassword.Text := '';
    FrmLocked.lbUserID.Caption := FUserName;
  	FrmLocked.ShowModal;
  end;

end;

procedure TfrmMain.actKonversiRTGSSKNExecute(Sender: TObject);
begin
	ExecLibrary(LIB_TOOLS_CONVERT_RTGS2G2INDV);
end;

procedure TfrmMain.actLapKonvPerProsesExecute(Sender: TObject);
begin
	ExecLibrary(LIB_REPORT_CONVERT_PER_FILE);
end;

procedure TfrmMain.actLapKonvFormatSKNExecute(Sender: TObject);
begin
	ExecLibrary(LIB_REPORT_CONVERT_DKOI);
end;

procedure TfrmMain.actLapKonvFormatREMMExecute(Sender: TObject);
begin
	ExecLibrary(LIB_REPORT_CONVERT_REMM);
end;

procedure TfrmMain.actParamKonvRTGSExecute(Sender: TObject);
begin
	ExecLibrary(LIB_TOOLS_PARAM_CONVERT_RTGS2SKN);
end;

procedure TfrmMain.actAboutExecute(Sender: TObject);
begin
	AboutBox.ShowModal;
end;

procedure TfrmMain.actFindKonversiExecute(Sender: TObject);
begin
	ExecLibrary(LIB_TOOLS_CARI_KONVERSI);
end;

procedure TfrmMain.actKonversiRTGSSwiftExecute(Sender: TObject);
var
  DLLName: string;
  ShowNavbarForm: procedure(FParam:PChar); stdcall;
  MydxInitialize: procedure; stdcall;
  MydxFinalize: procedure; stdcall;
  tempStr    : PChar;
begin
  ExecRTGSSwiftLibrary('CallKonversiSwift');
	//MessageDlg('Under Contruction...', mtInformation, [mbOK], 0);
(*
  DLLHandle := 0;
  DLLName := 'Project6.Dll';
  DLLHandle := LoadLibrary(PChar(DLLName));
  try
    if DLLHandle <> 0 then
    begin
      ShowNavbarForm := GetProcAddress(DLLHandle, 'ShowNavbarForm');
      MydxInitialize := GetProcAddress(DLLHandle, 'dxInitialize');
      if Assigned(MydxInitialize) then
      	MydxInitialize();

      if Assigned(ShowNavbarForm) then
      begin
    		tempStr    := StrPCopy(StrAlloc(256), 'TEST');
      	ShowNavbarForm(tempStr);
      end;
    end;
  finally
      StrDispose(tempStr);
      MydxFinalize := GetProcAddress(DLLHandle, 'dxFinalize');
      if Assigned(MydxFinalize) then
      	MydxFinalize();
      FreeLibrary(DLLHandle);
      DLLHandle := 0;
  end;
	//ShoWMessage('Konversi RTGS-Swift');
*)
end;

procedure TfrmMain.actKonversiSattlementExecute(Sender: TObject);
begin
  ExecRTGSSwiftLibrary('CallSettlementKonversi');
end;

procedure TfrmMain.actParamKonvRTGSSwiftExecute(Sender: TObject);
begin
  ExecRTGSSwiftLibrary('CallParameter');
end;

procedure TfrmMain.actDaftarRekeningxecute(Sender: TObject);
begin
  ExecRTGSSwiftLibrary('CallMapRekening');
end;

procedure TfrmMain.actDaftarRekeningPajakExecute(Sender: TObject);
begin
  ExecRTGSSwiftLibrary('CallMapRekPajak');
end;

procedure TfrmMain.actDaftarTTCExecute(Sender: TObject);
begin
  ExecRTGSSwiftLibrary('CallMapTTC');
end;

procedure TfrmMain.actGenerateLaporanSettlementExecute(Sender: TObject);
begin
	ExecRTGSSwiftLibrary('CallSettlementGenerator');
end;

procedure TfrmMain.actLapKonvSwiftExecute(Sender: TObject);
begin
  ExecRTGSSwiftLibrary('CallReport');
end;

end.
