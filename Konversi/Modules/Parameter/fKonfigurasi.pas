unit fKonfigurasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,
  CEnterAsTab, 

  Registry, LMDCustomComponent, LMDWndProcComponent,
  LMDFormShadow, LMDContainerComponent, LMDBaseDialog, LMDDirDlg, ExtCtrls,
  OleDB, ComObj, ActiveX, AdvPanel, AdvOfficePager,
  AdvOfficePagerStylers, AdvEdit, 
  AdvOfficeButtons, FolderDialog, AdvEdBtn, AdvDirectoryEdit,
  JvGradientCaption, DB, ADODB, JvExControls, JvDBLookup, JvExStdCtrls,
  JvEdit, JvValidateEdit,
  JvCombobox, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomGroupBox, LMDCustomButtonGroup,
  LMDCustomCheckGroup, LMDCheckGroup, TaskDialog, JvSpin,
  JvExMask, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmKonfigurasi = class(TForm)
    DirDlg: TLMDDirDlg;
    EnterAsTab1: TEnterAsTab;
    pgcStyler: TAdvOfficePagerOfficeStyler;
    AdvPanelStyler1: TAdvPanelStyler;
    FolderDialog1: TFolderDialog;
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    pageControl: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    AdvOfficePager12: TAdvOfficePage;
    lbDBPath: TLabel;
    lbDBUser: TLabel;
    lbDBPass: TLabel;
    EnterAsTab2: TEnterAsTab;
    lMDAC: TLabel;
    Label3: TLabel;
    edDBPATH: TAdvEdit;
    edDBUser: TAdvEdit;
    edtTPKConnection: TAdvEdit;
    tblRefWilayah: TADOTable;
    dsRefWilayah: TDataSource;
    Label9: TLabel;
    edtRetensiDatabase: TJvValidateEdit;
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    lmeSandiBank: TAdvEdit;
    lmeSandiCabang: TAdvEdit;
    lmeSandiBI: TAdvEdit;
    lmeNamaBank: TAdvEdit;
    RegionLookup: TJvDBLookupCombo;
    Label11: TLabel;
    dirFolderBackup: TAdvDirectoryEdit;
    edDBPass: TEdit;
    AdvGlowButton1: TBitBtn;
    btnOpenDir: TBitBtn;
    Label12: TLabel;
    cbDBType: TJvComboBox;
    Label13: TLabel;

    dirShareBackup: TAdvDirectoryEdit;
    Label14: TLabel;
    lmeSandiPeserta: TAdvEdit;
    Label15: TLabel;
    edtWSDLTPK: TAdvEdit;
    Label16: TLabel;
    edtWSDLAuthCode: TAdvEdit;
    Label17: TLabel;
    edtFolderDKE: TAdvDirectoryEdit;
    AdvOfficePage2: TAdvOfficePage;
    cbxUseTanggalPolaSiklus: TAdvOfficeCheckBox;
    qryGelarSingkatan: TADOQuery;
    dsGelarSingkatan: TDataSource;
    dlgInputGalar: TAdvInputTaskDialog;
    qryTemp: TADOQuery;
    dsAlasan: TDataSource;
    qryAlasan: TADOQuery;
    qryKodePosting: TADOQuery;
    dsKodePosting: TDataSource;
    lblKodePostingTerima: TLabel;
    lblKodePostingReject: TLabel;
    cbxParsialSyncOpsData: TAdvOfficeCheckBox;
    btnGeneralEdit: TcxButton;
    btnGeneralSave: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure btnOpenDirClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
    procedure btnGeneralSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbDBTypeClick(Sender: TObject);
    procedure TitlesAddButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FoldSandiBank,
    FoldSandiCabang,
    FoldNamaBank,
    FoldDBPATH,
    FoldDBUser,
    FoldDBPass,
    FoldTPKConnection,
    FoldInputFolder,
    FoldOutputFolder,
    FoldRegionCode,
    FoldSandiBI,
    FoldFolderBackup,
    FoldShareBackup,
    FoldBankBIActiveBranch : string;
    FoldRetensiDatabase : Integer;
		FoldDebitEditableField,
    FoldCreditEditableField :TStringList;
    FoldDBType:Integer;

    FoldSandipeserta,
    FoldWSDLAddress,
    FoldWSDLAuthCode,
    FoldFolderDKE,
    FoldKodePromo: String;
    FoldGunakanTanggalPolaSiklus:Boolean;
    FoldKodePostingTerima,
    FoldKodePostingReject : String;
    FoldSiklusAktif:Integer;
    FoldGroupVerifikasi,
    FoldKodeCabangAktif:String;
    FoldPartialSyncOPSData:Boolean;

    function ADOConnectionString(ParentHandle: THandle; InitialString: WideString;
        out NewString: string): Boolean;
    procedure KeepOldData;
    procedure WriteToLog(strContent: string);
  public
    { Public declarations }
    //property CURDBTYPE:Integer read FOldDBType write FOldDBType;
  end;

  function GetMDACVersion():string;
  function GetNextString(xstring:string; strToFind:string; CharUntil:char):string;

var
  frmKonfigurasi: TfrmKonfigurasi;

implementation

uses fGlobalVar, fGlobalVarDM, fConst, uSetting;

{$R *.dfm}

function GetNextString(xstring:string; strToFind:string; CharUntil:char):string;
var poss, id : integer;
begin
  if (strToFind='') and (xstring <> '') then //mulai dari posisi 1
    poss := 1
  else
    poss := pos(lowercase(strToFind),lowercase(xstring));

  setlength(result,length(xString)); //set Maksimal
  id := 1;
  if  poss <> 0 then begin
    poss := poss+length(strToFind);
    while (poss <= length(xstring)) do begin
        if (xstring[poss]=CharUntil) then
          break
        else begin
          result[id] := xstring[poss];
          inc(poss);
          inc(id);
        end;
    end;
  end;
  setlength(result,id-1);
  setlength(xstring,length(result));
end;


function GetMDACVersion():string;
var
  reg : TRegistry;
begin
  try
    reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('SOFTWARE\microsoft\DataAccess', false);
    result := reg.ReadString('Version');
    result := GetNextString(result,'','.')+'.'+GetNextString(result,'.','.');
    reg.CloseKey;
    reg.free;
  except
    result := '';
  end;
end;

procedure TfrmKonfigurasi.WriteToLog(strContent:string);
begin
	GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, strContent);
end;

procedure TfrmKonfigurasi.FormShow(Sender: TObject);
var
	I:Integer;
  tmpint:Integer;
begin
//  FOldDBType := GlobalVarForm.DBType;

	pageControl.ActivePageIndex := 0;
	tblRefWilayah.Open;

  lMDAC.Caption := 'MDAC Version ' + GetMDACVersion;
  try
    if StrToFloat(StringReplace(GetMDACVersion,'.',DecimalSeparator,[])) < 2.80 then
      lMDAC.Caption := lMDAC.Caption + ' , mohon DOWNLOAD versi yang lebih baru'
    else
      lMDAC.Caption := lMDAC.Caption + ', OK ';
  except
    lMDAC.Caption := lMDAC.Caption + ' , mohon download versi yang lebih baru';
  end;
  
  KeepOldData;

	lmeSandiBank.Text := GlobalVarForm.BankCode;
  lmeSandiCabang.Text := GlobalVarForm.BankActiveBranch;
  lmeNamaBank.Text := GlobalVarForm.BankName;
  lmeSandiBI.Text := GlobalVarForm.BankBIActiveBranch;
	lmeSandiPeserta.Text := GlobalVarForm.SandiPesertaActive;
  RegionLookup.Value := GlobalVarForm.BankWilayahKliringAktive;

  edDBPATH.Text := GlobalVarForm.DBDataSource;
  edDBUser.Text := GlobalVarForm.DBUsername;
  edDBPass.Text := GlobalVarForm.DBPassword;
  edtTPKConnection.Text := GlobalVarForm.TPKConnectionString;
  dirFolderBackup.Text := GlobalVarForm.DBBackupFolder;
  dirShareBackup.Text := GlobalVarForm.DBSharedBackupFolder;
  edtRetensiDatabase.Value := GlobalVarForm.DBTrxLifeCycle;
  edtWSDLTPK.Text := GlobalVarForm.TPKWSDLAddress;
  edtWSDLAuthCode.Text := GlobalVarForm.TPKWSDLAuthCode;
  edtFolderDKE.Text := GlobalVarForm.TPKRootFolder;

  //edtInputFolder.Text := GlobalVarForm.SystemInputFolder;
  //edtOutputFolder.Text := GlobalVarForm.SystemOutputFolder;
  cbDBType.ItemIndex := GlobalVarForm.DBType - 1;
  btnOpenDir.Enabled := cbDBType.ItemIndex = 0;

	cbxUseTanggalPolaSiklus.Checked := GlobalVarForm.SystemPolaSiklusOutDebetEnable;
  cbxParsialSyncOpsData.Checked := GlobalVarForm.PartialSyncOPSData;

  (*
  cbNoReferensi.Checked 		:= Copy(GlobalVarForm.SystemDebitEditableField,1,1)='1';
  cbSerial.Checked 					:= Copy(GlobalVarForm.SystemDebitEditableField,2,1)='1';
  cbSandiBank.Checked 			:= Copy(GlobalVarForm.SystemDebitEditableField,3,1)='1';
  cbSandiKantor.Checked 		:= Copy(GlobalVarForm.SystemDebitEditableField,4,1)='1';
  cbRekening.Checked 				:= Copy(GlobalVarForm.SystemDebitEditableField,5,1)='1';
  cbSandiTransaksi.Checked	:= Copy(GlobalVarForm.SystemDebitEditableField,6,1)='1';
  cbNominal.Checked					:= Copy(GlobalVarForm.SystemDebitEditableField,7,1)='1';
*)

	(* Gelar Singkatan *)
  with qryGelarSingkatan do
  begin
  	if Active then Close;
    Connection := GlobalVarDM.DailyADOConn;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + DB_TABLE_TITLES);
    SQL.Add('ORDER BY ti_name ');
    Open;
  end;

	(* Alasan Tolakan *)
  with qryAlasan do
  begin
  	if Active then Close;
    Connection := GlobalVarDM.DailyADOConn;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + DB_TABLE_REJECT_REASONS);
    SQL.Add('ORDER BY rr_desc ');
    Open;
  end;

	(* Kode Posting *)
  with qryKodePosting do
  begin
  	if Active then Close;
    Connection := GlobalVarDM.DailyADOConn;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + DB_TABLE_POSTINGCODES);
    SQL.Add('ORDER BY  pos_code ');
    Open;
  end;

  //edtKodePromo.Text := GlobalVarForm.InwardPromoCode;
  //dblKodePostingTerima.Text	:= GlobalVarForm.SystemDefaultPostingCode;
  //dblKodePostingReject.Text := GlobalVarForm.SystemDefaultRejectPostingCode;
	//edtSiklusAktif.Value := GlobalVarForm.CurrentCycle;

  //cboGroupVerifikasi.ItemIndex := cboGroupVerifikasi.Items.IndexOf(GlobalVarForm.SystemVerifyUsergroup);
  //edtKodeCabangAktif.Text := GlobalVarForm.InwardActiveBranchCode;
end;

function TfrmKonfigurasi.ADOConnectionString(ParentHandle: THandle; InitialString: WideString;
    out NewString: string): Boolean;
var
  DataInit: IDataInitialize;
  DBPrompt: IDBPromptInitialize;
  DataSource: IUnknown;
  InitStr: PWideChar;
begin
  Result   := False;
  DataInit := CreateComObject(CLSID_DataLinks) as IDataInitialize;
  if InitialString <> '' then
    DataInit.GetDataSource(nil, CLSCTX_INPROC_SERVER, PWideChar(InitialString),
      IUnknown, DataSource);
  DBPrompt := CreateComObject(CLSID_DataLinks) as IDBPromptInitialize;
  if Succeeded(DBPrompt.PromptDataSource(nil, ParentHandle,
    DBPROMPTOPTIONS_PROPERTYSHEET, 0, nil, nil, IUnknown, DataSource)) then
  begin
    InitStr := nil;
    DataInit.GetInitializationString(DataSource, True, InitStr);
    NewString := InitStr;
    Result    := True;
  end;
end;

procedure TfrmKonfigurasi.AdvGlassButton2Click(Sender: TObject);
begin
	ModalResult := mrCancel;

end;

procedure TfrmKonfigurasi.btnOpenDirClick(Sender: TObject);
begin
  FolderDialog1.Directory := ExtractFilePath(Application.ExeName) +'DB';
  if FolderDialog1.Execute then
		edDBPATH.Text := FolderDialog1.Directory;

{
	DirDlg.InitialDir := ExtractFilePath(Application.ExeName) +'DB';
	if DirDlg.Execute then
		edDBPATH.Text := DirDlg.Path;
  }
end;

procedure TfrmKonfigurasi.AdvGlowButton1Click(Sender: TObject);
var
  strNew : String;
begin
  if ADOConnectionString(Handle, edtTPKConnection.Text, strNew) then
    edtTPKConnection.Text := StrNew;
end;

procedure TfrmKonfigurasi.btnGeneralEditClick(Sender: TObject);
var
	i:Integer;
begin
	GlobalVarForm.BankCode := lmeSandiBank.Text;
  GlobalVarForm.BankActiveBranch := lmeSandiCabang.Text;
  GlobalVarForm.BankName := lmeNamaBank.Text;
  GlobalVarForm.BankWilayahKliringAktive := RegionLookup.Value;
  GlobalVarForm.BankBIActiveBranch := lmeSandiBI.Text;
  GlobalVarForm.SandiPesertaActive := lmeSandiPeserta.Text;

  GlobalVarForm.DBType := cbDBType.ItemIndex+1;
  GlobalVarForm.DBDataSource := edDBPATH.Text;
  GlobalVarForm.DBUsername := edDBUser.Text;
  GlobalVarForm.DBPassword := edDBPass.Text;
  GlobalVarForm.DBTrxLifeCycle := edtRetensiDatabase.Value;
  GlobalVarForm.TPKConnectionString := edtTPKConnection.Text;
  GlobalVarForm.DBBackupFolder := dirFolderBackup.Text;
  GlobalVarForm.DBSharedBackupFolder := dirShareBackup.Text;
  GlobalVarForm.TPKRootFolder := edtFolderDKE.Text;

  GlobalVarForm.TPKWSDLAddress := edtWSDLTPK.Text;
  GlobalVarForm.TPKWSDLAuthCode:= edtWSDLAuthCode.Text;

	if (GlobalVarForm.DBType-1) <> FOldDBType then
  	GlobalVarForm.InitConfig;

	//GlobalVarForm.SystemInputFolder := edtInputFolder.Text;
	//GlobalVarForm.SystemOutputFolder := edtOutputFolder.Text;
	GlobalVarForm.SystemPolaSiklusOutDebetEnable := cbxUseTanggalPolaSiklus.Checked;
  GlobalVarForm.PartialSyncOPSData		:= cbxParsialSyncOpsData.Checked;
  //GlobalVarForm.InwardPromoCode := edtKodePromo.Text;
  //GlobalVarForm.SystemDefaultPostingCode := dblKodePostingTerima.Text;
  //GlobalVarForm.SystemDefaultRejectPostingCode := dblKodePostingReject.Text;
	//GlobalVarForm.CurrentCycle := edtSiklusAktif.AsInteger;


  if Trim(FoldSandiBank) <> Trim(GlobalVarForm.BankCode) then
		WriteToLog(Format('Edit Parameter Sandi Bank [%s->%s]', [FoldSandiBank, GlobalVarForm.BankCode]));
  if Trim(FoldSandiCabang) <> Trim(GlobalVarForm.BankActiveBranch) then
  	WriteToLog(Format('Edit Parameter Sandi Cabang Aktif [%s->%s]', [FoldSandiCabang, GlobalVarForm.BankActiveBranch]));
  if Trim(FoldNamaBank) <> Trim(GlobalVarForm.BankName) then
  	WriteToLog(Format('Edit Parameter Nama Bank [%s->%s]', [FoldNamaBank, GlobalVarForm.BankName]));
  if Trim(FoldDBPATH) <> Trim(GlobalVarForm.DBDataSource) then
  	WriteToLog(Format('Edit Parameter DataSource [%s->%s]', [FoldDBPATH,GlobalVarForm.DBDataSource]));
  //if Trim(FolddDBUser) <> Trim(GlobalVarForm.DBUsername) then
  //	WriteToLog(Format('Edit Parameter User Database [%s->%s]', [FolddDBUser,GlobalVarForm.DBUsername]));
  if Trim(FoldDBPass) <> Trim(GlobalVarForm.DBPassword) then
  	WriteToLog('Edit Parameter Password Database');
  if Trim(FoldTPKConnection) <> Trim(GlobalVarForm.TPKConnectionString) then
  	WriteToLog(Format('Edit Parameter Koneksi SPK [%s]', [GlobalVarForm.TPKConnectionString]));
  (*
  if Trim(FoldInputFolder) <> Trim(GlobalVarForm.SystemInputFolder) then
  	WriteToLog(Format('Edit Parameter Folder Input File [%s->%s]', [FoldInputFolder,GlobalVarForm.SystemInputFolder]));
  *)
  (*
  if Trim(FoldOutputFolder) <> Trim(GlobalVarForm.SystemOutputFolder) then
  	WriteToLog(Format('Edit Parameter Folder Output File [%s->%s]', [FoldOutputFolder,GlobalVarForm.SystemOutputFolder]));
  *)
  if Trim(FoldRegionCode) <> Trim(GlobalVarForm.BankWilayahKliringAktive) then
  	WriteToLog(Format('Edit Parameter Wilayah Aktif [%s->%s]', [FoldRegionCode,GlobalVarForm.BankWilayahKliringAktive]));
  if FoldRetensiDatabase <> GlobalVarForm.DBTrxLifeCycle then
  	WriteToLog(Format('Edit Parameter Retensi Database [%d->%d]', [FoldRetensiDatabase,GlobalVarForm.DBTrxLifeCycle]));
  if Trim(FoldFolderBackup) <> Trim(GlobalVarForm.DBBackupFolder) then
  	WriteToLog(Format('Edit Parameter Folder Backup Database [%s->%s]', [FoldFolderBackup,GlobalVarForm.DBBackupFolder]));
  if Trim(FoldShareBackup) <> Trim(GlobalVarForm.DBSharedBackupFolder) then
  	WriteToLog(Format('Edit Parameter Share Folder Backup Database [%s->%s]', [FoldShareBackup,GlobalVarForm.DBSharedBackupFolder]));
  if Trim(FoldDebitEditableField.DelimitedText) <> Trim(GlobalVarForm.SystemDebitEditableField) then
  	WriteToLog(Format('Edit Parameter Editable Debet Koreksi Transaksi [%s->%s]', [FoldDebitEditableField.DelimitedText,GlobalVarForm.SystemDebitEditableField]));
  if Trim(FoldCreditEditableField.DelimitedText) <> Trim(GlobalVarForm.SystemCreditEditableField) then
  	WriteToLog(Format('Edit Parameter Editable Kredit Koreksi Transaksi [%s->%s]', [FoldCreditEditableField.DelimitedText, GlobalVarForm.SystemCreditEditableField]));
  if Trim(FoldBankBIActiveBranch) <> Trim(GlobalVarForm.BankBIActiveBranch) then
  	WriteToLog(Format('Edit Parameter Sandi BI Active [%s->%s]', [FoldBankBIActiveBranch,GlobalVarForm.BankBIActiveBranch]));

  if Trim(FoldSandipeserta) <> Trim(GlobalVarForm.SandiPesertaActive) then
  	WriteToLog(Format('Edit Parameter Sandi BIC Active [%s->%s]', [FoldSandipeserta, GlobalVarForm.SandiPesertaActive]));

  if Trim(FoldWSDLAddress) <> Trim(GlobalVarForm.TPKWSDLAddress) then
  	WriteToLog(Format('Edit Parameter Alamat Webservice SPK [%s->%s]', [FoldWSDLAddress, GlobalVarForm.TPKWSDLAddress]));

  if Trim(FoldWSDLAuthCode) <> Trim(GlobalVarForm.TPKWSDLAuthCode) then
  	WriteToLog('Edit Parameter Sandi Otentikasi Webservice SPK');

  if FoldGunakanTanggalPolaSiklus <> GlobalVarForm.SystemPolaSiklusOutDebetEnable then
  	WriteToLog(Format('Edit Parameter Pola Siklus Kliring Debet Penyerahan [%s->%s]', [BoolToStr(FoldGunakanTanggalPolaSiklus, True), BoolToStr(GlobalVarForm.SystemPolaSiklusOutDebetEnable, True)]));

  if FoldKodePromo <> GlobalVarForm.InwardPromoCode then
  	WriteToLog(Format('Edit Parameter Kode Promo [%s->%s]', [FoldKodePromo, GlobalVarForm.InwardPromoCode]));

  //if FoldKodePostingTerima <> dblKodePostingTerima.Text then
  //	WriteToLog(Format('Edit Parameter Kode Posting Terima [%s->%s]', [FoldKodePostingTerima, dblKodePostingTerima.Text]));

  //if FoldKodePostingReject <> dblKodePostingReject.Text then
  //	WriteToLog(Format('Edit Parameter Kode Posting Reject [%s->%s]', [FoldKodePostingReject, dblKodePostingReject.Text]));

  //if FoldSiklusAktif <> edtSiklusAktif.AsInteger then
  //	WriteToLog(Format('Edit Parameter Siklus Aktif [%d->%d]', [FoldSiklusAktif, edtSiklusAktif.AsInteger]));

  if Trim(FoldFolderDKE) <> Trim(GlobalVarForm.TPKRootFolder) then
  	WriteToLog('Edit Parameter Folder DKE SPK');

  //if Trim(FoldGroupVerifikasi) <> Trim(GlobalVarForm.SystemVerifyUsergroup) then
  //	WriteToLog(Format('Edit Parameter Group Verifikasi Default [%s->%s]', [FoldGroupVerifikasi, cboGroupVerifikasi.Items.Strings[cboGroupVerifikasi.ItemIndex]]));

  //if Trim(FoldKodeCabangAktif) <> Trim(GlobalVarForm.InwardActiveBranchCode) then
  //	WriteToLog(Format('Edit Parameter Kode Cabang Aktif [%s->%s]', [FoldKodeCabangAktif, edtKodeCabangAktif.Text]));

  if FoldPartialSyncOPSData <> cbxParsialSyncOpsData.Checked then
  	WriteToLog(Format('Edit Parameter Sinkronisasi Parsial Data OPS [%s->%s]', [BoolToStr(FoldPartialSyncOPSData, True), BoolToStr(cbxParsialSyncOpsData.Checked, True)]));

  if (FoldDBType <> cbDBType.ItemIndex) or
     (Trim(FoldDBPATH) <> Trim(edDBPATH.Text)) or
     (Trim(FoldDBPass) <> Trim(edDBPass.Text)) or
     (Trim(FoldDBUser) <> Trim(edDBUser.Text)) then
  begin
  	MessageDlg('Parameter database mengalami perubahan.'#13#10'Aplikasi harus dijalankan ulang', mtWarning, [mbOK], 0);
    Application.Terminate;
  end
  else begin
		MessageDlg('Simpan data berhasil.', mtInformation, [mbOK], 0);
  	ModalResult := MrOK;
  end;
end;

procedure TfrmKonfigurasi.btnGeneralSaveClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmKonfigurasi.FormCreate(Sender: TObject);
begin
	if tblRefWilayah.Active then
  	tblRefWilayah.Close;
  tblRefWilayah.Connection := GlobalVarDM.DailyADOConn;

	if qryGelarSingkatan.Active then
  	qryGelarSingkatan.Close;
  qryGelarSingkatan.Connection := GlobalVarDM.DailyADOConn;

	if qryTemp.Active then
  	qryTemp.Close;
  qryTemp.Connection := GlobalVarDM.DailyADOConn;

	if qryAlasan.Active then
  	qryAlasan.Close;
  qryAlasan.Connection := GlobalVarDM.DailyADOConn;

	if qryKodePosting.Active then
  	qryKodePosting.Close;
  qryKodePosting.Connection := GlobalVarDM.DailyADOConn;

  FoldDebitEditableField := TStringList.Create;
  FoldDebitEditableField.Delimiter := ';';

  FoldCreditEditableField := TStringList.Create;
  FoldCreditEditableField.Delimiter := ';';

end;

procedure TfrmKonfigurasi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	if tblRefWilayah.Active then
  	tblRefWilayah.Close;

  FoldDebitEditableField.Free;
  FoldCreditEditableField.Free;
end;

procedure TfrmKonfigurasi.KeepOldData;
begin
	FoldBankBIActiveBranch := GlobalVarForm.BankBIActiveBranch;
  FoldSandiBank := GlobalVarForm.BankCode;
  FoldSandiCabang:= GlobalVarForm.BankActiveBranch;
  FoldNamaBank := GlobalVarForm.BankName;
	FoldSandipeserta := GlobalVarForm.SandiPesertaActive;
  FoldRegionCode := GlobalVarForm.BankWilayahKliringAktive;
  FoldSandiBI:= GlobalVarForm.BankBIActiveBranch;

  FoldDBPATH := GlobalVarForm.DBDataSource;
  FoldDBUser := GlobalVarForm.DBUsername;
  FoldDBPass := GlobalVarForm.DBPassword;
  FoldTPKConnection := GlobalVarForm.TPKConnectionString;
  FoldWSDLAddress := GlobalVarForm.TPKWSDLAddress;
  FoldWSDLAuthCode:= GlobalVarForm.TPKWSDLAuthCode;
  FoldFolderBackup := GlobalVarForm.DBBackupFolder;
  FoldShareBackup := GlobalVarForm.DBSharedBackupFolder;
  FoldRetensiDatabase := GlobalVarForm.DBTrxLifeCycle;
  FoldFolderDKE := GlobalVarForm.TPKRootFolder;
  FoldKodePromo := GlobalVarForm.InwardPromoCode;

  //FoldInputFolder := GlobalVarForm.SystemInputFolder;
  //FoldOutputFolder := GlobalVarForm.SystemOutputFolder;
	FoldGunakanTanggalPolaSiklus := GlobalVarForm.SystemPolaSiklusOutDebetEnable;
  FoldKodePostingTerima := GlobalVarForm.SystemDefaultPostingCode;
  FoldKodePostingReject := GlobalVarForm.SystemDefaultRejectPostingCode;
	FoldPartialSyncOPSData := GlobalVarForm.PartialSyncOPSData;

  FoldDebitEditableField.DelimitedText :=  GlobalVarForm.SystemDebitEditableField;
  FoldCreditEditableField.DelimitedText := GlobalVarForm.SystemCreditEditableField;
  FoldSiklusAktif := GlobalVarForm.CurrentCycle;

  FoldDBType := GlobalVarForm.DBType-1;
  FoldGroupVerifikasi := GlobalVarForm.SystemVerifyUsergroup;
  FoldKodeCabangAktif := GlobalVarForm.InwardActiveBranchCode;
end;

procedure TfrmKonfigurasi.cbDBTypeClick(Sender: TObject);
begin
	if cbDBType.ItemIndex = 0 then
  begin
  	btnOpenDir.Enabled := True;
  end
  else begin
  	btnOpenDir.Enabled := False;
  end;

end;

procedure TfrmKonfigurasi.TitlesAddButtonClick(Sender: TObject);
begin
	dlgInputGalar.InputText := '';
  dlgInputGalar.Title := 'Input Gelar/Singkatan';
  dlgInputGalar.Instruction := 'Gelar/Singkatan';
	if dlgInputGalar.Execute = 1 then
  begin
		with qryTemp do
    begin
    	if Active then Close;
      SQL.Clear;
      SQL.Add('SELECT ti_name FROM ' + DB_TABLE_TITLES);
      SQL.Add('WHERE ti_name=' + QuotedStr(dlgInputGalar.InputText));
      Open;
      if RecordCount > 0 then
      begin
         Application.MessageBox(PCHar(Format('Data ''%s'' sudah ada.', [dlgInputGalar.InputText])), PChar(Application.Title), MB_ICONWARNING OR MB_OK OR MB_TOPMOST);
      end
      else begin
      	if Active then Close;
        SQL.Add('INSERT INTO ' + DB_TABLE_TITLES + '(ti_name) ');
        SQL.Add('Values(' + QuotedStr(dlgInputGalar.InputText) + ')');
        ExecSQL;
        GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('New: Gelar dan Singkatan [%s]',[dlgInputGalar.InputText]));
        qryGelarSingkatan.Requery;
      end;
    end;
  end;
end;


procedure TfrmKonfigurasi.BitBtn1Click(Sender: TObject);
var
	boContinue:Boolean;
begin
	boContinue := True;
	dlgInputGalar.InputText := '';
  dlgInputGalar.Title := 'Input Alasan Tolakan';
  dlgInputGalar.Instruction := 'Alasan Tolakan';
	if dlgInputGalar.Execute = 1 then
  begin
		with qryTemp do
    begin
    	if Active then Close;
      SQL.Clear;
      SQL.Add('SELECT rr_desc FROM ' + DB_TABLE_REJECT_REASONS);
      SQL.Add('WHERE rr_desc=' + QuotedStr(dlgInputGalar.InputText));
      Open;
      if RecordCount > 0 then
      begin
      	Application.MessageBox('Alasan tolakan sudah ada.',
               PChar(Application.Title), MB_ICONWARNING OR MB_OK OR MB_TOPMOST);
        	boContinue := False;
      end;

      if boContinue then
      begin
      	if Active then Close;
        SQL.Add('INSERT INTO ' + DB_TABLE_REJECT_REASONS + '(rr_desc) ');
        SQL.Add('Values(' + QuotedStr(dlgInputGalar.InputText) + ')');
        ExecSQL;
        GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('New: Alasan Penolakan [%s]',[dlgInputGalar.InputText]));
        qryAlasan.Requery;
      end;
    end;
  end;

end;

end.
