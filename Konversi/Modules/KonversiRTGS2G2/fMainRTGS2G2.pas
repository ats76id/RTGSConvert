unit fMainRTGS2G2;

interface

{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ActnList, JclStrings, 
  StdCtrls, Buttons, ExtCtrls, OverbyteIcsWndControl, 
  JvExStdCtrls, JvCombobox, DB, JvMemoryDataset,
  ADODB, frxClass, frxDBSet, AdvToolBar, AdvToolBarStylers,
  AdvGlowButton, XPMan;

const
  BANK_USER_NAME       = 'BNI';
  CURRENCY_CODE        = 'IDR';
  SUPPLIER_NAME_IN     = 'BI CREDIT NOTES';
  SUSPENSE_ACCOUNT_NO  = '9999999999999999';

type
  TDKEKredit = record
    TanggalKliring             : TDate;
    NoReff                     : String;
    NamaPengirim               : String;
    NamaPenerima               : String;
    NoRekPenerima              : String;
    Diskripsi                  : String;
    Nominal                    : Integer;
    SandiBankPenerima          : String;
    SandiKliringKBIAsal        : String;
    SandiPenyelenggaraAsal     : String;
    SandiTransaksi             : String;
    JenisBank                  : Integer;
    StatusPenduduk             : Integer;
    StatusWargaNegara          : Integer;
    SandiPropinsi              : String;
    KodeKota                   : String;
    SandiPenyelenggaraPenerima : String;
    SandiKliringAsal           : String;
    SOR                        : String;
    NamaPenerimaICONS          : String;
    KodeCabang                 : String;
  end;

  TRTGS = record
  	HRecordType:string;
    HMemberCode:String;
    HCreationDate:string;
    BatchReference:string;
    HSDD:string;
    HMM:string;
    HCCC:string;
    HMessageType:string;
    HBatchType:string;
    RecordType:string;
    TransactionCode:string;
    FromMember:string;
    ToMember:string;
    ReceivingBank:string;
    TRN:string;
    relref:string;
    Amount:string;
    ValueDate:string;
    SendersRefNo:string;
    ReceiversRefNo:string;
    DealCode:string;
    ToAccountNumber:string;
    ToAccountName:string;
    FromAccountNumber:string;
    FromAccountName:string;
    PaymentDetails:string;
    MemberInfo:string;
    OriginatingName:string;
    UltimateBeneAccount:string;
    UltimateBeneName:string;
    Currency:string;
    ExchangeRate:string;
    Interest:string;
    Period:string;
    SAKTINumber:string;
    FileName:string;
    SandiCabang:String;
    SandiKotaAsal:String;
    HCreditCount:String;
    HCreditAmount:String;
  end;

  {01  CEMTEX-IN-RECORD.}
  TDKEHeader = record //03  CTX-HEADER.
    RecordType     : String;  //05  RECORD-TYPE           PIC X. Set to "0".
    Filler1        : String;  //05  FILLER                PIC X(19).
    UserName       : String;  //05  USER-NAME             PIC X(3). Set to "BNI".
    Filler2        : String;  //05  FILLER                PIC X(7).
    SupplierNameIn : String;  //05  SUPPLIER-NAME-IN      PIC X(26). Set to name of supplier.
    SupplierNo     : Integer; //05  SUPPLIER-NO           PIC 9(6). Set to zero.
    TapeType       : String;  //05  TAPE-TYPE             PIC X(12).
    DateToBePosted : TDate;   //05  DATE-TO-BE-POSTED     PIC 9(8). Set to posting date (DDMMYYYY).
    TapeCurrency   : String;  //05  TAPE-CURRENCY         PIC XXX. Set to "IDR".
    Filler3        : String;  //05  FILLER                PIC X(75).
  end;

  {Detail records (one for each debit or credit)}
  TDKEDetail = record //03  CTX-DETAIL.
    RecordType      : String;   //05  RECORD-TYPE           PIC X. Set to "1".
    Filler1         : String;   //05  FILLER                PIC X(3).
    CTXPromoNo      : String;   //05  CTX-PROMO-NO          PIC X(2). Set to applicable promo code.
    Filler2         : String;   //05  FILLER                PIC X.
    CTXTranType     : Integer;  //05  CTX-TRAN-TYPE         PIC 9. Set to zero.
    CTXAcctNo       : Integer;  //05  CTX-ACCT-NO           PIC 9(17). Set to customer account number
    Filler3         : String;   //05  FILLER                PIC X.
    TransactionCode : Integer;  //05  TRANSACTION-CODE      PIC 99. Set to "05" for credit, "13" for debit
    InputOutput     : Currency; //05  INPUT-AMOUNT          PIC 9(14)V999. Set to transaction amount.
    Reference       : String;   //05  REFERENCE             PIC X(50). Free format statement reference.
    Filler4         : String;   //05  FILLER                PIC X(49).
    CTXTransDate    : TDate;    //05  CTX-TRAN-DATE         PIC 9(8). Set to effective date (DDMMYYYY)
    Filler5         : String;   //05  FILLER                PIC XX.
    CTXProcBranch   : Integer;  //05  CTX-PROC-BRCH         PIC 9(5). Set to branch code.
    Filler6         : String;   //05  FILLER                PIC X.
  end;

  {Trailer record (1 only)}
  TDKETrailer = record  //03  CTX-TRAILER.
    RecordType      : String;    //05  RECORD-TYPE           PIC X. Set to "7".
    Filler1         : String;    //05  FILLER                PIC X(19).
    NetTotal        : Currency;  //05  NET-TOTAL             PIC 9(14)V999. Set to net total
    CreditTotal     : Currency;  //05  CREDIT-TOTAL          PIC 9(14)V999. Set to total credit
    DebitTotal      : Currency;  //05  DEBIT-TOTAL           PIC 9(14)V999. Set to total debit
    Filler2         : String;    //05  FILLER                PIC X(24).
    DetailRecCount  : Integer;   //05  DETAIL-REC-COUNT      PIC 9(6). Set to file item count
    Filler3         : String;    //05  FILLER                PIC X(59).
  end;

  TfrmMain = class(TForm)
    StatusBar: TStatusBar;
    StatusView: TMemo;
    dlgOpenFile: TOpenDialog;
    memData: TJvMemoryData;
    popReportMenu: TPopupMenu;
    test1: TMenuItem;
    qryRptMaster: TADOQuery;
    qryRptDetail: TADOQuery;
    dsRptMaster: TDataSource;
    dsRptDetail: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    pageMain: TAdvToolBarPager;
    AdvToolBarPager11: TAdvPage;
    AdvToolBarPager12: TAdvPage;
    AdvToolBarPager13: TAdvPage;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    BitBtn2: TBitBtn;
    AdvToolBar1: TAdvToolBar;
    AdvGlowButton1: TAdvGlowButton;
    AdvToolBar2: TAdvToolBar;
    AdvGlowButton2: TAdvGlowButton;
    AdvToolBar3: TAdvToolBar;
    AdvGlowButton3: TAdvGlowButton;
    XPManifest1: TXPManifest;
    procedure ExitActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
  private
    { Private declarations }
    FSession:Integer;
    FConvertType:Integer; //1=SKNG2, 2=REMM
    FExportDateTime: TDateTime;
    IntSiklus : Integer;
    FUserName : String;
    FAutoMode : Boolean;
    FListTRNConvert:TStringList;
    procedure AddLog(LogString:String);
    function convertNumericToText(const strString : String; intLength : Integer; blnDecimal : Boolean = False) : String;
    function convertStringToText(const strString : String; intLength : Integer) : String;
    function fillSpace(const intCount: Integer; const blnSpace: Boolean = True): String;
    procedure WriteToLog(strLog:String);
    procedure FillPeriode;
    procedure ProcessFile(SourceFile: string;idxFile:Integer);
    function GetKonversiTC(strTRN: string): string;
    //procedure WriteToLog2(strLog:String);
    procedure InsertData(intStatus, intSession:Integer; FileConvert, AlasanReject:String);
    function GetSession:Integer;
    function GetSandiKotaBySandiCabangInternal(strSandiCabang:String):String;
    procedure ProcessFile2(SourceFile: string; idxFile: Integer);
    procedure ProcessData(SourceFile: string; idxFile: Integer);
    procedure DoConvert;
    function IsExistingNoReffByDate(NoReff: string;
      ConvertType:Integer;DateConv: TDateTime): Boolean;
  public
    { Public declarations }
    property UserName : String read FUserName write FUserName;
    property AutoMode : Boolean read FAutoMode write FAutoMode;
  end;

var
  frmMain: TfrmMain;

implementation

uses fMainDM, futils, fcrc16, fGlobalVar, fGlobalVarDM,
  StrUtils, fConst, fParamRTGS;

{$R *.dfm}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
procedure TfrmMain.AddLog(LogString: string);
begin
  if not FAutoMode then
    begin
    (*
    with StatusView.Items.Add do
    begin
      Caption:=FormatDateTime('[DD/MM/YYYY HH:NN:SS:ZZZ] ',Now)+LogString;
    end;
    *)
    StatusView.Lines.Add(FormatDateTime('[DD/MM/YYYY HH:NN:SS:ZZZ] ',Now)+LogString)
  end;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
procedure TfrmMain.ExitActionExecute(Sender: TObject);
begin
  Close;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function TfrmMain.convertNumericToText(const strString: String;
  intLength : Integer; blnDecimal: Boolean = False): String;
var
  i: Integer;
begin
  Result := strString;
  if blnDecimal then Result := IntToStr(Round(StrToFloat(Result)*100));
  for i:=Length(Result) to intLength-1 do
    Result := '0' + Result;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function TfrmMain.convertStringToText(
  const strString: String; intLength : Integer): String;
var
  i         : Integer;
  strResult : String;
begin
  if Length(strString) >= intLength then
    Result := Copy(strString,1,intLength)
  else
  begin
    strResult := strString;
    for i:=Length(strString) to intLength-1 do
      strResult := strResult + ' ';
    Result := strResult;
  end;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
procedure TfrmMain.FormCreate(Sender: TObject);
begin
	FAutoMode := False;
  FListTRNConvert := TStringList.Create;
  (*
  if not GlobalVarDM.IsDailyInwardDBExists(GlobalVarForm.SystemInwardToday) then
  begin
    MessageBox(Handle,'Database harian tidak ditemukan, atau belum proses awal hari.',
    'Pesan Kesalahan',MB_ICONERROR);
    CoolBar.Enabled := False;
    StatusBar.Panels[0].Text := 'Error';
    StatusBar.Panels[1].Text := 'Tabel Inward Tidak Ditemukan';
    StatusBar.Panels[2].Text := 'Harap jalankan ulang program ini';
  end;
  *)
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function TfrmMain.fillSpace(
  const intCount: Integer; const blnSpace: Boolean = True): String;
var
  strTemp: String;
  i      : Integer;
begin
  strTemp := '';
  for i:=1 to intCount do
    strTemp := strTemp + ' ';
  Result := strTemp;
end;

procedure TfrmMain.WriteToLog(strLog: String);
begin
	//SaveLog('INWARD::[Upload] ' + strLog, FUserName);
  GlobalVarDM.DoWriteLogDaily(FUserName, MDL_KONVERSI_RTGS, '[KONVERSIRTGS]' + strLog);
end;

procedure TfrmMain.FillPeriode;
var
  i:Integer;
begin

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  IntSiklus := 0;
	FillPeriode;
  FListTRNConvert.Clear;
  FListTRNConvert.DelimitedText := GlobalVarForm.RTGSListTRNConvert;

  pageMain.ActivePageIndex := 1;
end;

procedure TfrmMain.Keluar1Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmMain.ProcessFile(SourceFile:string;idxFile:Integer);
var
  listData,
  listNewData,
  listREMM:TStringList;
  //strHeaderBICPengirimPenerus:String;
  //strHeaderTanggalTransaksi:String;
  strHeaderSandiKotaAsal:String;
  strTemp,
  strTemp2,
  strTemp3:String;
  strBICPenerimaPenerus:string;
  strNominal:String;
  intTotalItem:Integer;
  currTotalAmount:Currency;
	strAllDetail:String;
  intBatchNo:Integer;
  crcSKN : TCRC16;
  crcTemp : word;
  boProses:Boolean;
  idx : Integer;
  strNewFile:String;
  intTotalAllItem:Integer;
  //strTRN:String;
  strNoRekTujuan,
  strTC,
  strNamaNasabahTujuan,
  strNoRekPengirim,
  strNamaNasabahPengirim,
  strRemark,
  strNoRef,
  strAmount,
  strBICPenerima,
  strBICPengirimAsal :string;
  strSandiKliringPenerima:String;
  strSandiIBank:string;

  strHRecordType,
  strHMemberCode,
  strHCreationDate,
  strBatchReference,
  strHSDD,
  strHMM,
  strHCCC,
  strHMessageType,
  strHBatchType,
  strHCreditCount,
  strHCreditAmount : string;
  RTGSField:TRTGS;
  boProcessed:Boolean;
  intStatus:Integer;
begin
	listData := TStringList.Create;

  if Not memData.Active then
  	memData.Open;
  memData.EmptyTable;

  listData.Clear;
  listData.LoadFromFile(SourceFile);

  intTotalAllItem := 0;
  intTotalItem := 0;
  currTotalAmount := 0;
  strAllDetail:='';
  intBatchNo := 0;
  boProses := True;

  StatusBar.Panels[1].Text := Format(' 0 / %d', [listData.Count]);
  StatusBar.Refresh;
  AddLog(Format('Init Data : %s ....', [ExtractFileName(SourceFile)]));

  (* Get TOtal item and mount footer *)
  for idx:= 0 to listData.Count-1 do
  begin
    if Copy(listData[idx],1,1)= '9' then
    begin
    	strHCreditCount := RemoveZero(Trim(Copy(listData[idx],2,5)));
      strHCreditAmount:= RemoveZero(Trim(Copy(listData[idx],7,18)));
    end;
  end;

  for idx:= 0 to listData.Count-1 do
  begin
    boProcessed := False;
    StatusBar.Panels[1].Text := Format(' %d / %d', [idx+1, listData.Count]);
    StatusBar.Refresh;

  	strTemp := listData[idx];

    if Copy(strTemp,1,1)= '0' then
    begin
      Inc(intBatchNo);

      strHRecordType			:= Trim(Copy(strTemp,1,1));
      strHMemberCode			:= Trim(Copy(strTemp,2,17));
      strHCreationDate		:= Trim(Copy(strTemp,19,8));
      strBatchReference		:= Trim(Copy(strTemp,27,3));
      strTemp2        		:= Trim(Copy(strTemp,30,10));
      strHSDD							:= Trim(Copy(strTemp2,1,3));
      strHMM							:= Trim(Copy(strTemp2,4,2));
      strHCCC							:= Trim(Copy(strTemp2,6,5));
      strHMessageType			:= Trim(Copy(strTemp,37,1));
      strHBatchType				:= Trim(Copy(strTemp,38,1));
			//strHeaderSandiKotaAsal := GlobalVarDM.GetSandiKotaBySandiCabangInternal(GlobalVarForm.BankActiveBranch);//'0391';

    end
    else if Copy(strTemp,1,1) = '1' then
    begin
      //Detail
      with RTGSField do
      begin
        HRecordType			:= strHRecordType;
        HMemberCode			:= strHMemberCode;
        HCreationDate		:= strHCreationDate;
        BatchReference	:= strBatchReference;
        HSDD						:= strHSDD;
        HMM							:= strHMM;
        HCCC						:= strHCCC;
        HMessageType		:= strHMessageType;
        HBatchType			:= strHBatchType;
        RecordType			:= Trim(Copy(strTemp,1,1));
        TransactionCode	:= Trim(Copy(strTemp,2,3));
        FromMember			:= Trim(Copy(strTemp,5,17));
        ToMember				:= Trim(Copy(strTemp,22,17));
        ReceivingBank		:= Trim(Copy(strTemp,39,6));
        TRN							:= Trim(Copy(strTemp,45,8));
        relref					:= Trim(Copy(strTemp,53,16));
        Amount					:= Trim(Copy(strTemp,69,17));
        ValueDate				:= Trim(Copy(strTemp,86,8));
        SendersRefNo		:= Trim(Copy(strTemp,94,16));
        ReceiversRefNo	:= Trim(Copy(strTemp,110,16));
        DealCode				:= Trim(Copy(strTemp,126,16));
        ToAccountNumber	:= Trim(Copy(strTemp,142,24));
        ToAccountName		:= Trim(Copy(strTemp,166,140));
        FromAccountNumber:= Trim(Copy(strTemp,306,24));
        FromAccountName	:= Trim(Copy(strTemp,330,140));
        PaymentDetails	:= Trim(Copy(strTemp,470,96));
        MemberInfo			:= Trim(Copy(strTemp,566,96));
        OriginatingName	:= Trim(Copy(strTemp,662,140));
        UltimateBeneAccount:= Trim(Copy(strTemp,802,24));
        UltimateBeneName:= Trim(Copy(strTemp,826,140));
        Currency				:= Trim(Copy(strTemp,966,3));
        ExchangeRate		:= Trim(Copy(strTemp,969,7));
        Interest				:= Trim(Copy(strTemp,976,7));
        Period					:= Trim(Copy(strTemp,983,3));
        SAKTINumber			:= Trim(Copy(strTemp,985,20));
        FileName				:= SourceFile;
        SandiCabang			:= PaddedZero(Copy(relref, 4,3),3) + '00';
        SandiKotaAsal 	:= GetSandiKotaBySandiCabangInternal(SandiCabang);
        HCreditCount 		:= strHCreditCount;
        HCreditAmount		:= strHCreditAmount;

      	memData.AppendRecord([
      		HRecordType
          ,HMemberCode
          ,HCreationDate
          ,HSDD
          ,HMM
          ,HCCC
          ,HMessageType
          ,HBatchType
          ,RecordType
          ,TransactionCode
          ,FromMember
          ,ToMember
          ,ReceivingBank
          ,TRN
          ,relref
          ,Amount
          ,ValueDate
          ,SendersRefNo
          ,ReceiversRefNo
          ,DealCode
          ,ToAccountNumber
          ,ToAccountName
          ,FromAccountNumber
          ,FromAccountName
          ,PaymentDetails
          ,MemberInfo
          ,OriginatingName
          ,UltimateBeneAccount
          ,UltimateBeneName
          ,Currency
          ,ExchangeRate
          ,Interest
          ,Period
          ,SAKTINumber
          ,FileName
          ,SandiKotaAsal
          ,SandiCabang
          ,FConvertType
          ,StrToIntDef(strHCreditCount,-1)
          ,StrToCurrDef(strHCreditAmount,0)/100
          ]);
      end;

      Inc(intTotalAllItem);
    end;

  end;

end;

procedure TfrmMain.ProcessData(SourceFile:string;idxFile:Integer);
var
  listNewData,
  listREMM:TStringList;
  strHeaderBICPengirimPenerus:String;
  strHeaderTanggalTransaksi:String;
  strHeaderSandiKotaAsal:String;
  strTemp,
  strTemp2,
  strTemp3:String;
  strBICPenerimaPenerus:string;
  strNominal:String;
  intTotalItem:Integer;
  currTotalAmount,
  currTotalAmountProcessed:Currency;
	strAllDetail:String;
  intBatchNo:Integer;
  crcSKN : TCRC16;
  crcTemp : word;
  boProses:Boolean;
  idx : Integer;
  strNewFile:String;
  intTotalAllItem,
  intTotalAllItemProcessed:Integer;
  //strTRN:String;
  strNoRekTujuan,
  strTC,
  strNamaNasabahTujuan,
  strNoRekPengirim,
  strNamaNasabahPengirim,
  strRemark,
  strNoRef,
  strAmount,
  strBICPenerima,
  strBICPengirimAsal :string;
  strSandiKliringPenerima:String;
  strSandiIBank:string;

  strHRecordType,
  strHMemberCode,
  strHCreationDate,
  strBatchReference,
  strHSDD,
  strHMM,
  strHCCC,
  strHMessageType,
  strHBatchType : string;
  boProcessed:Boolean;
  intStatus:Integer;
  FileKonversiREMM,
  FileKonversiDKOI,
  FileKonversi:String;
  boConvert:Boolean;
begin
  listNewData := TStringList.Create;
  listREMM := TStringList.Create;

  listNewData.Clear;
  listREMM.Clear;

  intTotalAllItem := 0;
  intTotalItem := 0;
  currTotalAmount := 0;
  strAllDetail:='';
  intBatchNo := 0;
  intTotalAllItemProcessed := 0;
  currTotalAmountProcessed := 0;
  boProses := True;

	memData.SortOnFields('SandiCabang;SandiKotaAsal');


  StatusBar.Panels[1].Text := Format(' 0 / %d', [memData.RecordCount]);
  StatusBar.Refresh;
  AddLog(Format('Store Data : %s ....', [ExtractFileName(SourceFile)]));

  memData.First;
  strHeaderTanggalTransaksi := memData.FieldByName('HCreationDate').AsString;
	strHeaderBICPengirimPenerus := memData.FieldByName('HMemberCode').AsString;

  FileKonversiDKOI := ChangeFileExt(SourceFile, '.DKOI');
  FileKonversiREMM := ExtractFilePath(SourceFile) +  Format('REMMEXTR.JKT.%s.%s.%d', [strHeaderTanggalTransaksi, FormatDateTime('HHNN', Now), idxFile]);

  if FConvertType = 1 then
  	FileKonversi := ExtractFileName(FileKonversiDKOI)
  else
  	FileKonversi := ExtractFileName(FileKonversiREMM);

  while Not memData.Eof do
  begin
    boProcessed := False;
    StatusBar.Panels[1].Text := Format(' %d / %d', [intTotalAllItem+1, memData.RecordCount]);
    StatusBar.Refresh;

    strSandiIBank						:= memData.FieldByName('SandiCabang').AsString;
    strHeaderSandiKotaAsal	:= memData.FieldByName('SandiKotaAsal').AsString;
    boConvert := True;

    if FListTRNConvert.IndexOf(Trim(memData.FieldByName('TRN').AsString)) >= 0 then
    begin
      if IsExistingNoReffByDate(memData.FieldByName('relref').AsString,
            FConvertType, FExportDateTime) then
      begin
        AddLog(Format('No.Ref: %s sudah ada.', [memData.FieldByName('relref').AsString]));
        WriteToLog(Format('No.Ref: %s sudah ada.', [memData.FieldByName('relref').AsString]));

        InsertData(2, FSession, '', Format('No.Ref: %s sudah ada.', [memData.FieldByName('relref').AsString]));
        Inc(intTotalAllItem);
        memData.Next;
      end
      else if Trim(memData.FieldByName('SandiKotaAsal').AsString)='' then
      begin
        AddLog(Format('Sandi kota asal cabang %s tidak terdaftar.', [memData.FieldByName('SandiCabang').AsString]));
        WriteToLog(Format('Sandi kota asal cabang %s tidak terdaftar.', [memData.FieldByName('SandiCabang').AsString]));

        InsertData(0, FSession, '', Format('Sandi kota asal cabang %s tidak terdaftar.', [memData.FieldByName('SandiCabang').AsString]));
        Inc(intTotalAllItem);
        memData.Next;
      end
      else begin
        InsertData(1, FSession, FileKonversi, '');

        strNoRekTujuan 					:= Trim(memData.FieldByName('UltimateBeneAccount').AsString);
        strTC 									:= GetKonversiTC(Trim(memData.FieldByName('TRN').AsString));
        strAmount 							:= Trim(memData.FieldByName('Amount').AsString);
        strNamaNasabahTujuan		:= LeftStr(memData.FieldByName('UltimateBeneName').AsString,70);
        strNoRekPengirim 				:= memData.FieldByName('FromAccountNumber').AsString;
        strNamaNasabahPengirim 	:= LeftStr(memData.FieldByName('OriginatingName').AsString,70);
        strRemark 							:= memData.FieldByName('PaymentDetails').AsString;
        strNoRef 								:= memData.FieldByName('relref').AsString;
        strBICPenerima 					:= LeftStr(memData.FieldByName('ToMember').AsString,8);
        strBICPengirimAsal			:= LeftStr(memData.FieldByName('FromMember').AsString,8);
        strSandiKliringPenerima := GlobalVarDM.GetSandiKliringByBIC(strBICPenerima);
        currTotalAmount 				:= currTotalAmount + (StrToCurr(strAmount)/100);
        currTotalAmountProcessed:= currTotalAmountProcessed + (StrToCurr(strAmount)/100);

        if (UpperCase(strBICPenerima) = 'INDOIDJA') then
        begin
          //if (Trim(strNamaNasabahTujuan)='') then
            strNamaNasabahTujuan := LeftStr(memData.FieldByName('ToAccountName').AsString,70);

          if (Trim(strNoRekTujuan)='') then
            strNoRekTujuan := memData.FieldByName('ToAccountNumber').AsString;
        end;

        (* Format DKOI *)
        if FConvertType = 1 then
        begin
          //Tipe dan Kode DKE
          strTemp2 := '11';
          //BIC Pengirim Asal
          strTemp2 := strTemp2 + insertSpaceRight(strBICPengirimAsal, 8);
          //Sandi Kota Asal
          strTemp2 := strTemp2 + PaddedZero(strHeaderSandiKotaAsal, 4);
          //Nama NAsabah Pengirim
          strTemp2 := strTemp2 + insertSpaceRight(CleanString(strNamaNasabahPengirim,[]), 70);
          //No.Rek Nasabah Pengirim
          strTemp2 := strTemp2 + insertSpaceRight(strNoRekPengirim, 34);
          //Alamat Nasabah Pengirim
          strTemp2 := strTemp2 + insertSpaceRight(CleanString('', []), 140);
          //Jenis NAsabah Pengirim
          strTemp2 := strTemp2 + insertSpaceLeft('1', 1);
          //Status Penduduk Pengirim
          strTemp2 := strTemp2 + insertSpaceLeft('1', 1);
          //Identitas Nasabah Pengirim
          strTemp2 := strTemp2 + insertSpaceRight('', 35);
          //BIC Penerima Penerus
          strTemp2 := strTemp2 + insertSpaceRight(strBICPenerima, 8);
          //BIC Penerima Akhir (disamakan dengan penerima penerus)
          strTemp2 := strTemp2 + insertSpaceRight(strBICPenerima, 8);
          //Sandi Kota Tujuan
          strTemp2 := strTemp2 + insertSpaceLeft(GlobalVarDM.GetSandiKotaByBIC(strBICPenerimaPenerus),4);
          //Nama Nasabah Penerima
          strTemp2 := strTemp2 + insertSpaceRight(CleanString(strNamaNasabahTujuan,[]), 70);
          //No.Rek Nasabah Penerima
          strTemp2 := strTemp2 + insertSpaceRight(strNoRekTujuan, 34);
          //Alamat Nasabah Penerima
          strTemp2 := strTemp2 + insertSpaceRight(CleanString('',[]), 140);
          //Jenis Nasabah Penerima
          strTemp2 := strTemp2 + insertSpaceLeft('1', 1);
          //Status Penduduk Nasabah Penerima
          strTemp2 := strTemp2 + insertSpaceLeft('1', 1);
          //Identitasa nasabah penerima
          strTemp2 := strTemp2 + insertSpaceRight('', 35);
          //Jenis Transaksi
          strTemp2 := strTemp2 + insertSpaceLeft(strTC, 4);
          //Jenis sarana transaksi
          strTemp2 := strTemp2 + insertSpaceLeft('1', 4);
          //Nominal
          strNominal := strAmount;
          Insert(',', strNominal, Length(strNominal)-1);
          strTemp2 := strTemp2 + insertSpaceLeft(strNominal, 18);
          //No.Urut
          strTemp2 := strTemp2 + insertSpaceLeft(IntToStr(intTotalItem+1), 3);
          //No.Ref
          strTemp2 := strTemp2 + insertSpaceRight(strNoRef, 35);
          //No.Ref Ori
          strTemp2 := strTemp2 + insertSpaceRight('', 35);
          //Beban Biaya
          strTemp2 := strTemp2 + 'SLEV';
          //Keterangan
          strTemp2 := strTemp2 + insertSpaceRight(StraightenText(CleanString(strRemark,[])), 140);
          //SOR
          strTemp2 := strTemp2 + insertSpaceRight('', 35);
          //Periode Confirm
          strTemp2 := strTemp2 + insertSpaceLeft('0', 1);

          strAllDetail := strAllDetail + strTemp2;

          listNewData.Add(strTemp2);
        end;

        (* Format REMM *)
        if FConvertType = 2 then
        begin
          //SAndi CAbang
          strTemp3 := insertSpaceRight(GlobalVarForm.BankActiveBranch,5);
          //Tanggal Transaksi
          strTemp3 := strTemp3 + insertSpaceRight(strHeaderTanggalTransaksi,8);
          //Tag
          strTemp3 := strTemp3 + 'D';
          //No.Cheque
          strTemp3 := strTemp3 + insertSpaceRight('',6);
          //Sandi kliring Penerima
          strTemp3 := strTemp3 + insertSpaceRight(strSandiKliringPenerima, 7);
          //No.Rek NAsabah Penerima
          strTemp3 := strTemp3 + insertSpaceRight(LeftStr(strNoRekTujuan,16), 16);
          //Jenis Transaksi
          strTemp3 := strTemp3 + insertSpaceRight(strTC,2);
          //Nominal
          strTemp3 := strTemp3 + PaddedZero(strAmount, 17);
          //Nama Nasabah Penerima
          strTemp3 := strTemp3 + insertSpaceRight(strNamaNasabahTujuan, 70);
          //No.Rek Pengirim
          strTemp3 := strTemp3 + insertSpaceRight(LeftStr(strNoRekPengirim,16), 16);
          //Nama NAsabah pengirim
          strTemp3 := strTemp3 + insertSpaceRight(strNamaNasabahPengirim, 70);
          //Keterangan
          strTemp3 := strTemp3 + insertSpaceRight(strRemark, 140);
          //status
          strTemp3 := strTemp3 + PaddedZero('0', 4);
          //BatchID
          strTemp3 := strTemp3 + PaddedZero('1', 3);
          //Flag
          strTemp3 := strTemp3 + 'Y';
          //NoRef
          strTemp3 := strTemp3 + insertSpaceRight(LeftStr(strNoRef,16), 16);
          //BranchCode + KODE SUB BRANCH
          //strTemp3 := strTemp3 + insertSpaceRight(GlobalVarForm.BankActiveBranch,5);
          strTemp3 := strTemp3 + insertSpaceRight(strSandiIBank,5);
          //Identitas NAsabah Pengirim
          strTemp3 := strTemp3 + insertSpaceRight('', 24);
          //Alamat Pengirim
          strTemp3 := strTemp3 + insertSpaceRight('', 60);
          //Jenis Nasabah Pengirim
          strTemp3 := strTemp3 + '1';
          //status penduduk pengirim
          strTemp3 := strTemp3 + '1';
          //BIC Penerima Akhir
          strTemp3 := strTemp3 + insertSpaceRight(strBICPenerima, 8);
          //Alamat Penerima
          strTemp3 := strTemp3 + insertSpaceRight('', 80);
          //Jenis Nasabah Penerima
          strTemp3 := strTemp3 + '1';
          //identitas nasabah penerima
          strTemp3 := strTemp3 + insertSpaceRight('', 24);
          //status penduduk penerima
          strTemp3 := strTemp3 + '1';
          //Jenis sarana trabsaksi
          strTemp3 := strTemp3 + PaddedZero('1', 4);
          //Periode
          strTemp3 := strTemp3 + '0';

          listREMM.Add(strTemp3);
        end;

        Inc(intTotalAllItem);
        Inc(intTotalItem);
        Inc(intTotalAllItemProcessed);

        memData.Next;

        //Footer DKOI
        if FConvertType = 1 then
        begin
          if (Trim(strHeaderSandiKotaAsal) <> Trim(memData.FieldByName('SandiKotaAsal').AsString)) OR
             (Trim(strSandiIBank) <> Trim(memData.FieldByName('SandiCabang').AsString)) or (memData.Eof)then
          begin
            //Header
            Inc(intBatchNo);
            strTemp := '01';
            strTemp := strTemp + PaddedZero(IntToStr(intBatchNo), 5);
            strTemp := strTemp + FormatDateTime('YYYY-MM-DD',FExportDateTime) + 'T' +
                                 FormatDateTime('hh:nn:ss.zzz', FExportDateTime) + '+07:00';
            strTemp := strTemp + PaddedZero(IntToStr(intTotalItem), 3);
            strTemp := strTemp + insertSpaceLeft(StringReplace(FormatCurr('#.00', currTotalAmount), '.', ',', [rfReplaceAll, rfIgnoreCase]),18);
            strTemp := strTemp + Copy(strHeaderTanggalTransaksi,1,4) + '-' +
                                 Copy(strHeaderTanggalTransaksi,5,2) + '-' +
                                 Copy(strHeaderTanggalTransaksi,7,2);
            strTemp := strTemp + 'CLRG';
            strTemp := strTemp + insertSpaceRight(strHeaderBICPengirimPenerus,8);
            strTemp := strTemp + insertSpaceLeft(strHeaderSandiKotaAsal,4);

            listNewData.Insert(listNewData.Count-intTotalItem, strTemp);

            //Footer
            crcSKN := TCRC16.Create(0);
            try
              crcTemp := crcSKN.getCRC(strAllDetail);
              strTemp := '31';
              strTemp := strTemp + FormatFloat('00000', crcTemp);
              listNewData.Add(strTemp);
            finally
              crcSKN.Free;
            end;


            intTotalItem 		:= 0;
            currTotalAmount := 0;
            strAllDetail 		:= '';
          end;
        end;
      end;
    end
    else begin
    	AddLog(Format('%s, TRN bukan yg dikonversi.', [Trim(memData.FieldByName('TRN').AsString)]));
    	WriteToLog(Format('%s, TRN bukan yg dikonversi.', [Trim(memData.FieldByName('TRN').AsString)]));

			InsertData(0, FSession, '', 'TRN bukan yg dikonversi');

      Inc(intTotalAllItem);
    	memData.Next;
    end;

	end;

  //Footer REMM
  if FConvertType = 2 then
  begin
    if listREMM.Count > 0 then
    begin
      (* REMM *)
      //Footer
      //Sandi cabang
      strTemp3 := insertSpaceRight(GlobalVarForm.BankActiveBranch, 5);
      //Tanggal transaksi
      strTemp3 := strTemp3 + insertSpaceRight(strHeaderTanggalTransaksi, 8);
      //Tag
      strTemp3 := strTemp3 + 'H';
      //Type
      strTemp3 := strTemp3 + '1';
      //NoBatch
      strTemp3 := strTemp3 + PaddedZero('1', 4);
      //Jumlah item
      strTemp3 := strTemp3 + PaddedZero(IntToStr(intTotalAllItemProcessed), 6);
      //Jumlah nominal
      strNominal := FormatCurr('#.00', currTotalAmountProcessed);
      strNominal := StringReplace(strNominal, '.', '', [rfReplaceAll, rfIgnoreCase]);
      strNominal := StringReplace(strNominal, ',', '', [rfReplaceAll, rfIgnoreCase]);
      strTemp3 := strTemp3 + PaddedZero(strNominal,17);
      //status
      strTemp3 := strTemp3 + PaddedZero('0', 4);
      //TPK No
      strTemp3 := strTemp3 + PaddedZero('0', 3);
      //Keterangan
      strTemp3 := strTemp3 + insertSpaceRight('', 32);
      //BatchID
      strTemp3 := strTemp3 + PaddedZero('1', 3);

      listREMM.Add(strTemp3);
    end;
	end;

  if (listREMM.Count > 0) or (listNewData.Count > 0) then
  begin
  	ForceDirectories(ExtractFilePath(SourceFile) + 'Moved');

    if (FConvertType=1) AND (listNewData.Count > 0) then
    begin
      //strNewFile := ChangeFileExt(SourceFile, '.DKOI');
      if FileExists(FileKonversiDKOI) then
        DeleteFile(FileKonversiDKOI);
      listNewData.SaveToFile(FileKonversiDKOI);
      AddLog(Format('Konversi File %s -> %s', [ExtractFileName(SourceFile), ExtractFileName(FileKonversiDKOI)]));
      WriteToLog(Format('Konversi File %s -> %s', [ExtractFileName(SourceFile), ExtractFileName(FileKonversiDKOI)]));
    end;

    if (FConvertType=2) AND (listREMM.Count > 0) then
    begin
      //strNewFile := ExtractFilePath(SourceFile) +  Format('REMMEXTR.JKT.%s.%s.%d', [strHeaderTanggalTransaksi, FormatDateTime('HHNN', Now), idxFile]);
      if FileExists(FileKonversiREMM) then
        DeleteFile(FileKonversiREMM);
      listREMM.SaveToFile(FileKonversiREMM);
      AddLog(Format('Konversi File %s -> %s', [ExtractFileName(SourceFile), ExtractFileName(FileKonversiREMM)]));
      WriteToLog(Format('Konversi File %s -> %s', [ExtractFileName(SourceFile), ExtractFileName(FileKonversiREMM)]));
    end;

    MoveFileEx(PChar(SourceFile), PChar(ExtractFilePath(SourceFile) + 'Moved\' + ExtractFileName(SourceFile)), MOVEFILE_COPY_ALLOWED or MOVEFILE_REPLACE_EXISTING or MOVEFILE_WRITE_THROUGH);
  end
  else begin
  	ForceDirectories(ExtractFilePath(SourceFile) + 'Trash');
    MoveFileEx(PChar(SourceFile), PChar(ExtractFilePath(SourceFile) + 'Trash\' + ExtractFileName(SourceFile)), MOVEFILE_COPY_ALLOWED or MOVEFILE_REPLACE_EXISTING or MOVEFILE_WRITE_THROUGH);

    AddLog(Format('Konversi %s gagal.', [ExtractFileName(SourceFile)]));
  end;


  AddLog(Format('Total item                   : %d', [memData.RecordCount]));
  AddLog(Format('Total item berhasil konversi : %d', [intTotalAllItemProcessed]));
  AddLog(Format('Total item gagal konversi    : %d', [memData.RecordCount - intTotalAllItemProcessed]));

  WriteToLog(Format('Total item                   : %d', [memData.RecordCount]));
  WriteToLog(Format('Total item berhasil konversi : %d', [intTotalAllItemProcessed]));
  WriteToLog(Format('Total item gagal konversi    : %d', [memData.RecordCount - intTotalAllItemProcessed]));
end;

procedure TfrmMain.ProcessFile2(SourceFile:string;idxFile:Integer);
var
  listData,
  listNewData,
  listREMM:TStringList;
  //strHeaderBICPengirimPenerus:String;
  //strHeaderTanggalTransaksi:String;
  strHeaderSandiKotaAsal:String;
  strTemp,
  strTemp2,
  strTemp3:String;
  strBICPenerimaPenerus:string;
  strNominal:String;
  intTotalItem:Integer;
  currTotalAmount:Currency;
	strAllDetail:String;
  intBatchNo:Integer;
  crcSKN : TCRC16;
  crcTemp : word;
  boProses:Boolean;
  idx : Integer;
  strNewFile:String;
  intTotalAllItem:Integer;
  //strTRN:String;
  strNoRekTujuan,
  strTC,
  strNamaNasabahTujuan,
  strNoRekPengirim,
  strNamaNasabahPengirim,
  strRemark,
  strNoRef,
  strAmount,
  strBICPenerima,
  strBICPengirimAsal :string;
  strSandiKliringPenerima:String;
  strSandiIBank:string;

  strHRecordType,
  strHMemberCode,
  strHCreationDate,
  strBatchReference,
  strHSDD,
  strHMM,
  strHCCC,
  strHMessageType,
  strHBatchType : string;
  RTGSField:TRTGS;
  boProcessed:Boolean;
  intStatus:Integer;
begin
	listData := TStringList.Create;
  listNewData := TStringList.Create;
  listREMM := TStringList.Create;

  listData.Clear;
  listNewData.Clear;
  listREMM.Clear;
  listData.LoadFromFile(SourceFile);

  intTotalAllItem := 0;
  intTotalItem := 0;
  currTotalAmount := 0;
  strAllDetail:='';
  intBatchNo := 0;
  boProses := True;

  StatusBar.Panels[1].Text := Format(' 0 / %d', [listData.Count]);
  StatusBar.Refresh;
  AddLog(Format('Konversi File: %s ....', [ExtractFileName(SourceFile)]));

  for idx:= 0 to listData.Count-1 do
  begin
    boProcessed := False;
    StatusBar.Panels[1].Text := Format(' %d / %d', [idx+1, listData.Count]);
    StatusBar.Refresh;

  	strTemp := listData[idx];

    if Copy(strTemp,1,1)= '0' then
    begin
      Inc(intBatchNo);

      strHRecordType			:= Trim(Copy(strTemp,1,1));
      strHMemberCode			:= Trim(Copy(strTemp,2,17));
      strHCreationDate		:= Trim(Copy(strTemp,19,8));
      strBatchReference		:= Trim(Copy(strTemp,27,3));
      strTemp2        		:= Trim(Copy(strTemp,30,10));
      strHSDD							:= Trim(Copy(strTemp2,1,3));
      strHMM							:= Trim(Copy(strTemp2,4,2));
      strHCCC							:= Trim(Copy(strTemp2,6,5));
      strHMessageType			:= Trim(Copy(strTemp,37,1));
      strHBatchType				:= Trim(Copy(strTemp,38,1));
			strHeaderSandiKotaAsal := GlobalVarDM.GetSandiKotaBySandiCabangInternal(GlobalVarForm.BankActiveBranch);//'0391';

      (*
      strHeaderBICPengirimPenerus := Trim(Copy(strTemp, 2,17));
      strHeaderTanggalTransaksi 	:= Trim(Copy(strTemp, 19,8));
      strHeaderSandiKotaAsal 			:= GlobalVarDM.GetSandiKotaBySandiCabangInternal(GlobalVarForm.BankActiveBranch);//'0391';
      *)
    end
    else if Copy(strTemp,1,1) = '1' then
    begin
      //Detail
      with RTGSField do
      begin
        HRecordType			:= strHRecordType;
        HMemberCode			:= strHMemberCode;
        HCreationDate		:= strHCreationDate;
        BatchReference	:= strBatchReference;
        HSDD						:= strHSDD;
        HMM							:= strHMM;
        HCCC						:= strHCCC;
        HMessageType		:= strHMessageType;
        HBatchType			:= strHBatchType;
        RecordType			:= Trim(Copy(strTemp,1,1));
        TransactionCode	:= Trim(Copy(strTemp,2,3));
        FromMember			:= Trim(Copy(strTemp,5,17));
        ToMember				:= Trim(Copy(strTemp,22,17));
        ReceivingBank		:= Trim(Copy(strTemp,39,6));
        TRN							:= Trim(Copy(strTemp,45,8));
        relref					:= Trim(Copy(strTemp,53,16));
        Amount					:= Trim(Copy(strTemp,69,17));
        ValueDate				:= Trim(Copy(strTemp,86,8));
        SendersRefNo		:= Trim(Copy(strTemp,94,16));
        ReceiversRefNo	:= Trim(Copy(strTemp,110,16));
        DealCode				:= Trim(Copy(strTemp,126,16));
        ToAccountNumber	:= Trim(Copy(strTemp,142,24));
        ToAccountName		:= Trim(Copy(strTemp,166,140));
        FromAccountNumber:= Trim(Copy(strTemp,306,24));
        FromAccountName	:= Trim(Copy(strTemp,330,140));
        PaymentDetails	:= Trim(Copy(strTemp,470,96));
        MemberInfo			:= Trim(Copy(strTemp,566,96));
        OriginatingName	:= Trim(Copy(strTemp,662,140));
        UltimateBeneAccount:= Trim(Copy(strTemp,802,24));
        UltimateBeneName:= Trim(Copy(strTemp,826,140));
        Currency				:= Trim(Copy(strTemp,966,3));
        ExchangeRate		:= Trim(Copy(strTemp,969,7));
        Interest				:= Trim(Copy(strTemp,976,7));
        Period					:= Trim(Copy(strTemp,983,3));
        SAKTINumber			:= Trim(Copy(strTemp,985,20));
        FileName				:= SourceFile;
      end;

      //strTRN := Trim(Copy(strTemp,45,8));
      if FListTRNConvert.IndexOf(RTGSField.TRN) >= 0 then
      begin
        strNoRekTujuan 					:= RTGSField.UltimateBeneAccount;//Trim(Copy(strTemp,802,24));
        strTC 									:= GetKonversiTC(RTGSField.TRN);
        strAmount 							:= RTGSField.Amount; //Trim(Copy(strTemp,69,17));
        strNamaNasabahTujuan		:= LeftStr(RTGSField.UltimateBeneName,70);
        strNoRekPengirim 				:= RTGSField.FromAccountNumber; //Trim(Copy(strTemp,306,24));
        strNamaNasabahPengirim 	:= LeftStr(RTGSField.OriginatingName,70);
        strRemark 							:= RTGSField.PaymentDetails;// Trim(Copy(strTemp, 470,96));
        strNoRef 								:= RTGSField.relref;// Trim(Copy(strTemp, 53,16));
        strBICPenerima 					:= LeftStr(RTGSField.ToMember,8);
        strBICPengirimAsal			:= LeftStr(RTGSField.FromMember,8);
        strSandiKliringPenerima := GlobalVarDM.GetSandiKliringByBIC(strBICPenerima);
        currTotalAmount 				:= currTotalAmount + (StrToCurr(strAmount)/100);
        strSandiIBank						:= Copy(strNoRef, 4,3) + '00';

        //if (UpperCase(strTRN) = 'BIRSA501') and (Trim(strNamaNasabahTujuan)='') then
        if (UpperCase(strBICPenerima) = 'INDOIDJA') then
        begin
          //if (Trim(strNamaNasabahTujuan)='') then
        		strNamaNasabahTujuan := LeftStr(RTGSField.ToAccountName,70);

          if (Trim(strNoRekTujuan)='') then
          	strNoRekTujuan := RTGSField.ToAccountNumber;
        end;

        (* Format DKOI *)
        //Tipe dan Kode DKE
        strTemp2 := '11';
        //BIC Pengirim Asal
        strTemp2 := strTemp2 + insertSpaceRight(strBICPengirimAsal, 8);
        //Sandi Kota Asal
        strTemp2 := strTemp2 + PaddedZero(strHeaderSandiKotaAsal, 4);
        //Nama NAsabah Pengirim
        strTemp2 := strTemp2 + insertSpaceRight(CleanString(strNamaNasabahPengirim,[]), 70);
        //No.Rek Nasabah Pengirim
        strTemp2 := strTemp2 + insertSpaceRight(strNoRekPengirim, 34);
        //Alamat Nasabah Pengirim
        strTemp2 := strTemp2 + insertSpaceRight(CleanString('', []), 140);
        //Jenis NAsabah Pengirim
        strTemp2 := strTemp2 + insertSpaceLeft('1', 1);
        //Status Penduduk Pengirim
        strTemp2 := strTemp2 + insertSpaceLeft('1', 1);
        //Identitas Nasabah Pengirim
        strTemp2 := strTemp2 + insertSpaceRight('', 35);
        //BIC Penerima Penerus
        strTemp2 := strTemp2 + insertSpaceRight(strBICPenerima, 8);
        //BIC Penerima Akhir (disamakan dengan penerima penerus)
        strTemp2 := strTemp2 + insertSpaceRight(strBICPenerima, 8);
        //Sandi Kota Tujuan
        strTemp2 := strTemp2 + insertSpaceLeft(GlobalVarDM.GetSandiKotaByBIC(strBICPenerimaPenerus),4);
        //Nama Nasabah Penerima
        strTemp2 := strTemp2 + insertSpaceRight(CleanString(strNamaNasabahTujuan,[]), 70);
        //No.Rek Nasabah Penerima
        strTemp2 := strTemp2 + insertSpaceRight(strNoRekTujuan, 34);
        //Alamat Nasabah Penerima
        strTemp2 := strTemp2 + insertSpaceRight(CleanString('',[]), 140);
        //Jenis Nasabah Penerima
        strTemp2 := strTemp2 + insertSpaceLeft('1', 1);
        //Status Penduduk Nasabah Penerima
        strTemp2 := strTemp2 + insertSpaceLeft('1', 1);
        //Identitasa nasabah penerima
        strTemp2 := strTemp2 + insertSpaceRight('', 35);
        //Jenis Transaksi
        strTemp2 := strTemp2 + insertSpaceLeft(strTC, 4);
        //Jenis sarana transaksi
        strTemp2 := strTemp2 + insertSpaceLeft('1', 4);
        //Nominal
        strNominal := strAmount;
        Insert(',', strNominal, Length(strNominal)-1);
        strTemp2 := strTemp2 + insertSpaceLeft(strNominal, 18);
        //No.Urut
        Inc(intTotalItem);
        strTemp2 := strTemp2 + insertSpaceLeft(IntToStr(intTotalItem), 3);
        //No.Ref
        strTemp2 := strTemp2 + insertSpaceRight(strNoRef, 35);
        //No.Ref Ori
        strTemp2 := strTemp2 + insertSpaceRight('', 35);
        //Beban Biaya
        strTemp2 := strTemp2 + 'SLEV';
        //Keterangan
        strTemp2 := strTemp2 + insertSpaceRight(StraightenText(CleanString(strRemark,[])), 140);
        //SOR
        strTemp2 := strTemp2 + insertSpaceRight('', 35);
        //Periode Confirm
        strTemp2 := strTemp2 + insertSpaceLeft('0', 1);

        (* Format REMM *)
        //SAndi CAbang
        strTemp3 := insertSpaceRight(GlobalVarForm.BankActiveBranch,5);
        //Tanggal Transaksi
        strTemp3 := strTemp3 + insertSpaceRight(RTGSField.ValueDate,8);
        //Tag
        strTemp3 := strTemp3 + 'D';
        //No.Cheque
        strTemp3 := strTemp3 + insertSpaceRight('',6);
        //Sandi kliring Penerima
        strTemp3 := strTemp3 + insertSpaceRight(strSandiKliringPenerima, 7);
        //No.Rek NAsabah Penerima
        strTemp3 := strTemp3 + insertSpaceRight(LeftStr(strNoRekTujuan,16), 16);
        //Jenis Transaksi
        strTemp3 := strTemp3 + insertSpaceRight(strTC,2);
        //Nominal
        strTemp3 := strTemp3 + PaddedZero(strAmount, 17);
        //Nama Nasabah Penerima
        strTemp3 := strTemp3 + insertSpaceRight(strNamaNasabahTujuan, 70);
        //No.Rek Pengirim
        strTemp3 := strTemp3 + insertSpaceRight(LeftStr(strNoRekPengirim,16), 16);
        //Nama NAsabah pengirim
        strTemp3 := strTemp3 + insertSpaceRight(strNamaNasabahPengirim, 70);
        //Keterangan
        strTemp3 := strTemp3 + insertSpaceRight(strRemark, 140);
        //status
        strTemp3 := strTemp3 + PaddedZero('0', 4);
        //BatchID
        strTemp3 := strTemp3 + PaddedZero(IntToStr(intBatchNo), 3);
        //Flag
        strTemp3 := strTemp3 + 'Y';
        //NoRef
        strTemp3 := strTemp3 + insertSpaceRight(LeftStr(strNoRef,16), 16);
        //BranchCode + KODE SUB BRANCH
        //strTemp3 := strTemp3 + insertSpaceRight(GlobalVarForm.BankActiveBranch,5);
        strTemp3 := strTemp3 + insertSpaceRight(strSandiIBank,5);
        //Identitas NAsabah Pengirim
        strTemp3 := strTemp3 + insertSpaceRight('', 24);
        //Alamat Pengirim
        strTemp3 := strTemp3 + insertSpaceRight('', 60);
        //Jenis Nasabah Pengirim
        strTemp3 := strTemp3 + '1';
        //status penduduk pengirim
        strTemp3 := strTemp3 + '1';
        //BIC Penerima Akhir
        strTemp3 := strTemp3 + insertSpaceRight(strBICPenerima, 8);
        //Alamat Penerima
        strTemp3 := strTemp3 + insertSpaceRight('', 80);
        //Jenis Nasabah Penerima
        strTemp3 := strTemp3 + '1';
        //identitas nasabah penerima
        strTemp3 := strTemp3 + insertSpaceRight('', 24);
        //status penduduk penerima
        strTemp3 := strTemp3 + '1';
        //Jenis sarana trabsaksi
        strTemp3 := strTemp3 + PaddedZero('1', 4);
        //Periode
        strTemp3 := strTemp3 + '0';

        strAllDetail := strAllDetail + strTemp2;
        Inc(intTotalAllItem);

        listNewData.Add(strTemp2);
        listREMM.Add(strTemp3);
      end;
    end
    else if Copy(strTemp,1,1)='9' then
    begin
      if intTotalItem > 0 then
      begin
        (* DKOI *)
        //Header
        strTemp := '01';
        strTemp := strTemp + PaddedZero(IntToStr(intBatchNo), 5);
        strTemp := strTemp + FormatDateTime('YYYY-MM-DD',FExportDateTime) + 'T' +
                             FormatDateTime('hh:nn:ss.zzz', FExportDateTime) + '+07:00';
        strTemp := strTemp + PaddedZero(IntToStr(intTotalItem), 3);
        strTemp := strTemp + insertSpaceLeft(StringReplace(FormatCurr('#.00', currTotalAmount), '.', ',', [rfReplaceAll, rfIgnoreCase]),18);
        strTemp := strTemp + Copy(strHCreationDate,1,4) + '-' +
                             Copy(strHCreationDate,5,2) + '-' +
                             Copy(strHCreationDate,7,2);
        strTemp := strTemp + 'CLRG';
        strTemp := strTemp + insertSpaceRight(strHMemberCode,8);
        strTemp := strTemp + insertSpaceLeft(strHeaderSandiKotaAsal,4);

        listNewData.Insert(listNewData.Count-intTotalItem, strTemp);

        //Footer
        crcSKN := TCRC16.Create(0);
        try
          crcTemp := crcSKN.getCRC(strAllDetail);
          strTemp := '31';
          strTemp := strTemp + FormatFloat('00000', crcTemp);
          listNewData.Add(strTemp);
        finally
          crcSKN.Free;
        end;
      end;

      (* REMM *)
      //Footer
      //Sandi cabang
      strTemp3 := insertSpaceRight(GlobalVarForm.BankActiveBranch, 5);
      //Tanggal transaksi
      strTemp3 := strTemp3 + insertSpaceRight(RTGSField.ValueDate, 8);
      //Tag
      strTemp3 := strTemp3 + 'H';
      //Type
      strTemp3 := strTemp3 + '1';
      //NoBatch
      strTemp3 := strTemp3 + PaddedZero(IntToStr(intBatchNo), 4);
      //Jumlah item
      strTemp3 := strTemp3 + PaddedZero(IntToStr(intTotalItem), 6);
      //Jumlah nominal
      strNominal := FormatCurr('#.00', currTotalAmount);
      strNominal := StringReplace(strNominal, '.', '', [rfReplaceAll, rfIgnoreCase]);
      strNominal := StringReplace(strNominal, ',', '', [rfReplaceAll, rfIgnoreCase]);
			strTemp3 := strTemp3 + PaddedZero(strNominal,17);
      //status
      strTemp3 := strTemp3 + PaddedZero('0', 4);
      //TPK No
      strTemp3 := strTemp3 + PaddedZero('0', 3);
      //Keterangan
      strTemp3 := strTemp3 + insertSpaceRight('', 32);
      //BatchID
      strTemp3 := strTemp3 + PaddedZero(IntToStr(intBatchNo), 3);


      listREMM.Add(strTemp3);

      intTotalItem 		:= 0;
      currTotalAmount := 0;
      strAllDetail 		:= '';
      boProcessed := True;
    end
    else begin
      boProses := False;
      AddLog(Format('Konversi file ''%s'' gagal. Record Type tidak sesuai [%d]', [ExtractFileName(Sourcefile), Idx+1]));
      Break;
    end;

    if Copy(strTemp,1,1) = '1' then
    begin
      if boProcessed then
        intStatus := 1
      else
        intStatus := 0;

      //InsertData(intStatus, FSession, RTGSField);
    end;
  end;

  if (boProses) AND (listNewData.Count > 0) then
  begin
    ForceDirectories(ExtractFilePath(SourceFile) + 'Moved');
    strNewFile := ChangeFileExt(SourceFile, '.DKOI');
    if FileExists(strNewFile) then
      DeleteFile(strNewFile);
    listNewData.SaveToFile(strNewFile);

    strNewFile := ExtractFilePath(SourceFile) +  Format('REMMEXTR.JKT.%s.%s.%d', [strHCreationDate, FormatDateTime('HHNN', Now), idxFile]);
    if FileExists(strNewFile) then
      DeleteFile(strNewFile);
    listREMM.SaveToFile(strNewFile);

    MoveFileEx(PChar(SourceFile), PChar(ExtractFilePath(SourceFile) + 'Moved\' + ExtractFileName(SourceFile)), MOVEFILE_COPY_ALLOWED or MOVEFILE_REPLACE_EXISTING or MOVEFILE_WRITE_THROUGH);
    AddLog(Format('Total item hasil konversi %s: %d', [ExtractFileName(SourceFile), intTotalAllItem]));
  end
  else
    AddLog(Format('Konversi %s gagal.', [ExtractFileName(SourceFile)]));
end;

function TfrmMain.GetKonversiTC(strTRN:string):string;
begin
  Result := '50';
	with MainDM.qryTemp do
  begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('SELECT TOP 1 TC_BARU FROM ' + DB_TABLE_REF_KONVERSI_TC);
    SQL.Add('WHERE TC_LAMA=' + QuotedStr(strTRN));
    Open;

    if Not Fields[0].IsNull then
    	Result := Fields[0].AsString;

    if Active then CLose;
  end;
end;

procedure TfrmMain.InsertData(intStatus, intSession:Integer; FileConvert, AlasanReject:String);
var
  intSeq:Integer;
begin
	with MainDM.qryTemp do
  begin
    if Active then Close;
    SQL.Clear;
    (*
    SQL.Add('DECLARE @SeqNo Integer');
    SQL.Add('SET @SeqNo = (Select MAX(SeqNumber) FROM RTGSG1History)');
    SQL.Add('if @SeqNo IS NULL');
    SQL.Add('  Set @SeqNo=1');
    SQL.Add('else');
    SQL.Add('  Set @SeqNo = @SeqNo +1');
    *)
    SQL.Add('Select MAX(SeqNumber) FROM ' + DB_TABLE_RTGS2SKN_HISTORY);
    Open;
    if Not Fields[0].IsNull then
    	intSeq := Fields[0].AsInteger + 1
    else
    	intSeq := 1;

    if Active then Close;
    SQL.Clear;
		SQL.Add('INSERT INTO ' + DB_TABLE_RTGS2SKN_HISTORY);
    SQL.Add('([ConvertType],[DateProcess],[HRecordType],[HMemberCode],[HCreationDate],[HSDD]');
    SQL.Add(',[HMM],[HCCCC],[HMessageType],[HBatchType],[HSessionNumber],[RecordType]');
    SQL.Add(',[TransactionCode],[FromMember],[ToMember],[ReceivingBank],[TRN],[relref]');
    SQL.Add(',[Amount],[CAmount],[ValueDate],[SenderRefNo],[ReceiverRefNo],[DealCode],[ToAccountNumber]');
    SQL.Add(',[ToAccountName],[FromAccountNumber],[FromAccountName],[PaymentDetails],[MemberInfo]');
    SQL.Add(',[OriginatingName],[UltimateBeneAccount],[UltimateBeneName],[Currency],[ExchangeRate]');
    SQL.Add(',[Interest],[Period],[SAKTINumber],[SeqNumber],[Status],[Keterangan],[FileName],[SandiCabang], [SandiKotaAsal]');
    SQL.Add(',[HCreditCount], [HCreditAmount], [G1File] )');

    SQL.Add('VALUES(:ConvertType, :DateProcess,:HRecordType,:HMemberCode,:HCreationDate,:HSDD');
    SQL.Add(',:HMM,:HCCCC,:HMessageType,:HBatchType,:HSessionNumber,:RecordType,:TransactionCode');
    SQL.Add(',:FromMember,:ToMember,:ReceivingBank,:TRN,:relref,:Amount,:CAmount,:ValueDate,:SenderRefNo');
    SQL.Add(',:ReceiverRefNo,:DealCode,:ToAccountNumber,:ToAccountName,:FromAccountNumber,:FromAccountName');
    SQL.Add(',:PaymentDetails,:MemberInfo,:OriginatingName,:UltimateBeneAccount,:UltimateBeneName');
    SQL.Add(',:Currency,:ExchangeRate,:Interest,:Period,:SAKTINumber, :SeqNumber,:Status,:Keterangan,:FileName,:SandiCabang, :SandiKotaAsal');
    SQL.Add(',:HCreditCount,:HCreditAmount,:G1File )');

    Parameters.ParamByName('ConvertType').Value := FConvertType;
    Parameters.ParamByName('HRecordType').Value := memData.FieldByName('HRecordType').AsString;
    Parameters.ParamByName('HMemberCode').Value := memData.FieldByName('HMemberCode').AsString;
    Parameters.ParamByName('HCreationDate').Value := memData.FieldByName('HCreationDate').AsString;
    Parameters.ParamByName('HSDD').Value := memData.FieldByName('HSDD').AsString;
    Parameters.ParamByName('HMM').Value := memData.FieldByName('HMM').AsString;
    Parameters.ParamByName('HCCCC').Value := memData.FieldByName('HCCCC').AsString;
    Parameters.ParamByName('HMessageType').Value := memData.FieldByName('HMessageType').AsString;
    Parameters.ParamByName('HBatchType').Value := memData.FieldByName('HBatchType').AsString;
    Parameters.ParamByName('HSessionNumber').Value := intSession;
    Parameters.ParamByName('RecordType').Value := memData.FieldByName('RecordType').AsString;
    Parameters.ParamByName('TransactionCode').Value := memData.FieldByName('TransactionCode').AsString;
    Parameters.ParamByName('FromMember').Value := memData.FieldByName('FromMember').AsString;
    Parameters.ParamByName('ToMember').Value := memData.FieldByName('ToMember').AsString;
    Parameters.ParamByName('ReceivingBank').Value := memData.FieldByName('ReceivingBank').AsString;
    Parameters.ParamByName('TRN').Value := memData.FieldByName('TRN').AsString;
    Parameters.ParamByName('relref').Value := memData.FieldByName('relref').AsString;
    Parameters.ParamByName('Amount').Value := memData.FieldByName('Amount').AsString;
    try
      Parameters.ParamByName('CAmount').Value := StrToCurr(memData.FieldByName('Amount').AsString)/100;
    except
      Parameters.ParamByName('CAmount').Value := 0;
    end;
    Parameters.ParamByName('ValueDate').Value := memData.FieldByName('ValueDate').AsString;
    Parameters.ParamByName('SenderRefNo').Value := memData.FieldByName('SenderRefNo').AsString;
    Parameters.ParamByName('ReceiverRefNo').Value := memData.FieldByName('ReceiverRefNo').AsString;
    Parameters.ParamByName('DealCode').Value := memData.FieldByName('DealCode').AsString;
    Parameters.ParamByName('ToAccountNumber').Value := memData.FieldByName('ToAccountNumber').AsString;
    Parameters.ParamByName('ToAccountName').Value := memData.FieldByName('ToAccountName').AsString;
    Parameters.ParamByName('FromAccountNumber').Value := memData.FieldByName('FromAccountNumber').AsString;
    Parameters.ParamByName('FromAccountName').Value := memData.FieldByName('FromAccountName').AsString;
    Parameters.ParamByName('PaymentDetails').Value := memData.FieldByName('PaymentDetails').AsString;
    Parameters.ParamByName('MemberInfo').Value := memData.FieldByName('MemberInfo').AsString;
    Parameters.ParamByName('OriginatingName').Value := memData.FieldByName('OriginatingName').AsString;
    Parameters.ParamByName('UltimateBeneAccount').Value := memData.FieldByName('UltimateBeneAccount').AsString;
    Parameters.ParamByName('UltimateBeneName').Value := memData.FieldByName('UltimateBeneName').AsString;
    Parameters.ParamByName('Currency').Value := memData.FieldByName('Currency').AsString;
    Parameters.ParamByName('ExchangeRate').Value := memData.FieldByName('ExchangeRate').AsString;
    Parameters.ParamByName('Interest').Value := memData.FieldByName('Interest').AsString;
    Parameters.ParamByName('Period').Value := memData.FieldByName('Period').AsString;
    Parameters.ParamByName('Status').Value := intStatus;
    if intStatus = 1 then
    	Parameters.ParamByName('Keterangan').Value := 'Data Sudah dikonversi'
    else
    	Parameters.ParamByName('Keterangan').Value := AlasanReject;
    Parameters.ParamByName('FileName').Value := FileConvert;
    Parameters.ParamByName('SeqNumber').Value := intSeq;
    Parameters.ParamByName('DateProcess').DataType := ftDateTime;
    Parameters.ParamByName('DateProcess').Value 	 := FExportDateTime;
    Parameters.ParamByName('SAKTINumber').Value := memData.FieldByName('SAKTINumber').AsString;
    Parameters.ParamByName('SandiCabang').Value := memData.FieldByName('SandiCabang').AsString;
    Parameters.ParamByName('SandiKotaAsal').Value := memData.FieldByName('SandiKotaAsal').AsString;
    Parameters.ParamByName('HCreditCount').Value := memData.FieldByName('HCreditCount').AsInteger;
    Parameters.ParamByName('HCreditAmount').Value := memData.FieldByName('HCreditAmount').AsCurrency;
    Parameters.ParamByName('G1File').Value := ExtractFileName(memData.FieldByName('FileName').AsString);
    ExecSQL;
  end;

end;

function TfrmMain.GetSession: Integer;
begin
  Result := 1;
	with MainDM.qryTemp do
  begin
    if Active then CLose;
    SQL.Clear;
    SQL.Add('SELECT MAX(HSessionNumber) FROM ' + DB_TABLE_RTGS2SKN_HISTORY);
    SQL.Add(Format('WHERE ConvertType=%d', [FConvertType]));
    Open;
    if Not Fields[0].IsNull then
    	Result := Fields[0].AsInteger + 1;

    if Active then Close;
  end;
end;

function TfrmMain.GetSandiKotaBySandiCabangInternal(
  strSandiCabang: String): String;
begin
  Result := '0391';
	with MainDM.qryTemp do
  begin
    if Active then CLose;
    SQL.Clear;
    SQL.Add('SELECT ib_city_code FROM ' + DB_TABLE_IBRANCH);
    SQL.Add('WHERE ib_code=' + QuotedStr(strSandiCabang));
    Open;
    if Not Fields[0].IsNull then
    	Result := Fields[0].AsString;

    if Active then Close;
  end;

end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
  with BitBtn2.ClientToScreen(point(0, BitBtn2.Height)) do
    popReportMenu.Popup(X, Y);
end;

procedure TfrmMain.test1Click(Sender: TObject);
begin
	with qryRptMaster do
  begin
  	if Active then Close;
    SQL.Clear;
    SQL.Add('SELECT FIleName, SUM(IIF(Status=1, 1,0)) as TotalBerhasil, SUM(IIF(Status=0, 1,0)) as TotalGagal ');
    SQL.Add('FROM ' + DB_TABLE_RTGS2SKN_HISTORY);
    SQL.Add('Group by FIleName ');
    Open;
  end;

  with qryRptDetail do
  begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + DB_TABLE_RTGS2SKN_HISTORY);
    SQL.Add('WHERE FileName=:FileName ');
    Open;
  end;


end;

procedure TfrmMain.DoConvert;
var
	strFileName:string;
  SearchRec1: TSearchRec;
  SearchStatus: Integer;
  NumberOfFiles: Integer;
	strFullFile:String;
begin
  StatusBar.Panels[0].Text :=  'Sibuk';
  if FConvertType = 1 then
  begin
  	AddLog('Konversi RTGS->SKN: MULAI');
    WriteToLog('Konversi RTGS->SKN: MULAI');
  end
  else if FConvertType = 2 then
  begin
  	AddLog('Konversi RTGS->REMM: MULAI');
    WriteToLog('Konversi RTGS->REMM: MULAI');
  end
  else begin
  	AddLog('Konversi RTGS: MULAI');
    WriteToLog('Konversi RTGS: MULAI');
	end;

  FExportDateTime := Now;
  FSession := GetSession;
  try
    try
      if GlobalVarForm.RTGSConvertMultipleConvert then
      begin
        strFullFile := IncludeTrailingPathDelimiter(GlobalVarForm.RTGSConvertFolder) + GlobalVarForm.RTGSConvertFileName;
        SearchStatus := FindFirst(strFullFile, faAnyFile-faDirectory, SearchRec1);
        if SearchStatus = 0 then
        begin
          try
            NumberOfFiles := 0;
            while SearchStatus = 0 do
            begin
              if ((SearchRec1.Attr and faDirectory) = 0) then
              begin
                try
                    AddLog('Konversi File: ' + ExtractFileName(SearchRec1.Name));
                    WriteToLog('Konversi File ' + ExtractFileName(SearchRec1.Name));
                    ProcessFile(ExtractFilePath(strFullFile) + SearchRec1.Name, NumberOfFiles+1);
                    ProcessData(ExtractFilePath(strFullFile) + SearchRec1.Name, NumberOfFiles+1);
                finally
                    Inc(NumberOfFiles);
                end;
              end;

              SearchStatus := FindNext(SearchRec1);
            end;
          finally
            SysUtils.FindClose(SearchRec1);
            AddLog(Format('Path [%s], %d file diproses.', [GlobalVarForm.RTGSConvertFolder, NumberOfFiles]));
            WriteToLog(Format('Path [%s], %d file diproses.', [GlobalVarForm.RTGSConvertFolder, NumberOfFiles]));
          end;
        end
        else begin
          AddLog('File tidak ada atau folder kosong.');
          WriteToLog('File tidak ada atau folder kosong.');
        end;
      end
      else
      begin
        //'FIle Text|*.TXT'
        dlgOpenFile.DefaultExt 	:= '*' + ExtractFileExt(GlobalVarForm.RTGSConvertFileName);
        dlgOpenFile.FileName 		:= ExtractFileName(GlobalVarForm.RTGSConvertFileName);
        dlgOpenFile.Filter 			:= '*' + ExtractFileExt(GlobalVarForm.RTGSConvertFileName) + '|*' + ExtractFileExt(GlobalVarForm.RTGSConvertFileName);
        dlgOpenFile.InitialDir 	:= GlobalVarForm.RTGSConvertFolder;

        if dlgOpenFile.Execute then
        begin
          //try
            StatusBar.Panels[0].Text :=  'Sibuk';
            //AddLog('Konversi RTGS: MULAI');
            //FExportDateTime := Now;
            strFileName := dlgOpenFile.FileName;


            ProcessFile(strFileName, 1);
            ProcessData(strFileName, 1);
          (*finally
            AddLog('Konversi RTGS: Selesai');
            StatusBar.Panels[0].Text :=  'Siap';
            StatusBar.Panels[1].Text :=  '';
          end;
          *)
        end;
      end;
    except
      on E:Exception do
      begin
        AddLog('Error Konversi: ' + E.Message);
        WriteToLog('Error Konversi: ' + E.Message);
      end;
    end;
  finally
    if FConvertType = 1 then
    begin
    	AddLog('Konversi RTGS->SKN: Selesai');
			WriteToLog('Konversi RTGS->SKN: Selesai');
    end
    else begin
    	AddLog('Konversi RTGS->REMM: Selesai');
    	WriteToLog('Konversi RTGS->REMM: Selesai');
    end;
    StatusBar.Panels[0].Text :=  'Siap';
    StatusBar.Panels[1].Text :=  '';
  end;
end;
procedure TfrmMain.AdvGlowButton1Click(Sender: TObject);
begin
	frmParamRTGSConvert.ShowModal;
  if frmParamRTGSConvert.ModalResult = mrOK then
  begin
    FListTRNConvert.Clear;
    FListTRNConvert.DelimitedText := GlobalVarForm.RTGSListTRNConvert;
  end;

end;

procedure TfrmMain.AdvGlowButton2Click(Sender: TObject);
begin
	FConvertType := 1;
  DoConvert;
end;

procedure TfrmMain.AdvGlowButton3Click(Sender: TObject);
begin
	FConvertType := 2;
  DoConvert;
end;

function TfrmMain.IsExistingNoReffByDate(NoReff:string;ConvertType:Integer;DateConv:TDateTime):Boolean;
begin
  Result := False;
	with MainDM.qryTemp do
  begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('SELECT Count(*) FROM ' + DB_TABLE_RTGS2SKN_HISTORY);
    SQL.Add('WHERE relref=' + QuotedStr(NoReff));
    SQL.Add('AND CONVERT(VARCHAR(10), DateProcess, 101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', DateConv)));
    SQL.Add(FOrmat('AND ConvertType=%d', [ConvertType]));
    //ShowMessage(SQL.Text);
    Open;

    Result := Fields[0].AsInteger > 0;
  end;
end;

end.

