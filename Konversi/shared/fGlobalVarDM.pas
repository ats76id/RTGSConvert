unit fGlobalVarDM;

interface

uses
  Windows, SysUtils, Classes, Controls, DB, ADODB, Forms, Dialogs, DateUtils, StrUtils;

type
  TGlobalVarDM = class(TDataModule)
    MainADOConn: TADOConnection;
    paramsTable: TADOTable;
    paramsDataSource: TDataSource;
    DailyADOConn: TADOConnection;
    DBTPKADOConn: TADOConnection;
    TempQuery: TADOQuery;
    qryLogDaily: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    function IsDailyInwardDebetDBExists(TrxDate: TDate): boolean;
    { Private declarations }
  public
    { Public declarations }
    function IsDailyDBExists(TrxDate:TDate):Boolean;
    function isIBTrxByRefNo(strRefNo: String): Boolean;
    function IsMonthlyRptDBExists(intMonthOf, intYearOf:Word): boolean;
    function DoWriteLogDaily(strUserName: string; intModule: Integer;
      strActivity: string): Integer;
    function isTSAtrx(tc, strNamaPenerima, strDeskripsi: String): Boolean;
    function CheckRegister(strApplicationPath, strBankCode, strActiveBranchCode:String;boShowMessage:Boolean):Boolean;
    function GetErrorDescription(vErrorCode: String): String;
    function GetNextDate2(crnDate: TDateTime;strSandiWilayah:String;Const useRegionHoliday:Boolean=False): TDateTime;
    function GetSandiKliringByBIC(strBIC:String):String;
    function GetSandiInstitusiByBIC(strBIC:String):String;
    procedure GetSandiKliringAndWilayahByBIC(strBIC:String;Var vSandiKliring, vJenisBank, vWilayah:String);
    function GetSandiPropinsiBySandiKota(vSandiKota:String):String;
    function GetProfileInfo: String;
		function GetServerDate: TDateTime;
    function GetBICBySandiKliring(strSandiKliring:String):String;
    function GetClearingCodeCoordinatorByBIC(strBIC,
      strWilayah: string): String;
    function GetSandiKotaBySandiCabangInternal(strSandiCabang:String):String;
    function GetSandiKotaByBIC(strBIC:String):String;
  end;

  function GetReg(ApplicationHandle:THandle):boolean; external 'siklib.dll';

var
  GlobalVarDM: TGlobalVarDM;

implementation

uses fGlobalVar, fUserLib, uni_RegCommon, fUtils;

{$R *.dfm}

procedure TGlobalVarDM.DataModuleCreate(Sender: TObject);
begin
  paramsTable.TableName:= DB_TABLE_PARAMS;
end;

function TGlobalVarDM.IsDailyDBExists(TrxDate: TDate): Boolean;
begin
  with TempQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM master.dbo.sysdatabases');
    SQL.Add('WHERE name='''+GlobalVarForm.DBDailyDBName+FormatDateTime('YYYYMMDD',TrxDate)+'''');
    Open;
    Result:=(RecordCount>0);
    Close;
  end;
end;


function TGlobalVarDM.isIBTrxByRefNo(strRefNo:String):Boolean;
var
	lstPrefix : TStringList;
  idx:Integer;
  tmpRefNo,strTemp1, strTemp2, strTemp3 : String;
  boFound : Boolean;
begin
  Result := False;
  boFound := False;
	tmpRefNo := Trim(strRefNo);
  if Length(tmpRefNo) = 16 then
  begin
    lstPrefix := TStringList.Create;
    try
      lstPrefix.Delimiter 		:= defListDelimeter;
      lstPrefix.DelimitedText := GlobalVarForm.SystemIBPrefixRef;
      for idx:=0 to lstPrefix.Count - 1 do
      begin
        strTemp1 := UpperCase(lstPrefix.Strings[idx]);
        strTemp2 := UpperCase(LeftStr(tmpRefNo, Length(strTemp1)));
        strTemp3 := Copy(tmpRefNo, Length(strTemp1)+1, Length(tmpRefNo));

        //if (CompareStr(strTemp1, strTemp2) = 0) and (isAllNumeric(strTemp3)) then
        if (CompareStr(strTemp1, strTemp2) = 0) then
        begin
          boFound := True;
          Break;
        end;
      end;

      Result := boFound;
    finally
      lstPrefix.Free;
    end;
  end;
end;

function TGlobalVarDM.isTSAtrx(tc,strNamaPenerima, strDeskripsi:String):Boolean;
var
	Rsl : Boolean;
  tmpQuery : TADOQuery;

  function isTSA(strValue: String): Boolean;
  var
    strTemp : String;
    intPos : Integer;
    isFound : Boolean;
  begin
    isFound := False;
    strTemp := UpperCase(Trim(strValue));
    with tmpQuery do
    begin
      First;
      while not Eof do
      begin
        intPos := Pos(UpperCase(FieldByName('tsa_key').AsString), strTemp);
        if intPos > 0 then
        begin
          isFound := True;
          Break;
        end;
        Next;
      end;
    end;

    Result := isFound;
  end;

begin
	Rsl := False;
  tmpQuery := TADOQuery.Create(nil);
  try
  	tmpQuery.Connection := DailyADOConn;
    if (tc = '51') or (tc = '52') then
      Rsl := True
    else begin
      with tmpQuery do
      begin
        try
          if Active then Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM ' + DB_TABLE_TSA);
          Open;

          if RecordCount > 0 then
            Rsl := isTSA(strNamaPenerima) OR isTSA(strDeskripsi);
        finally
          if Active then Close;
        end;
      end;
    end;

    Result := Rsl;
  finally
  	tmpQuery.Free;
  end;
end;

function TGlobalVarDM.IsMonthlyRptDBExists(intMonthOf, intYearOf:Word): boolean;
begin
  with TempQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM master.dbo.sysdatabases');
    SQL.Add('WHERE name='''+GlobalVarForm.DBMonthlyRptDBName+FormatDateTime('YYYYMM', EncodeDate(intYearOf, intMonthOf, 1))+'''');
    Open;
    Result:=(RecordCount>0);
    Close;
  end;
end;


function TGlobalVarDM.IsDailyInwardDebetDBExists(TrxDate: TDate): boolean;
begin
  with TempQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM master.dbo.sysdatabases');
    SQL.Add('WHERE name='''+GlobalVarForm.DBDailyInwardDebetDBName+FormatDateTime('YYYYMMDD',TrxDate)+'''');
    Open;
    Result:=(RecordCount>0);
    Close;
  end;
end;

function TGlobalVarDM.DoWriteLogDaily(strUserName: string; intModule: Integer; strActivity: string): Integer;
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
        Application.MessageBox(PChar(excE.Message), PChar('Write Log'), MB_ICONERROR);
      end;
    end;
  finally
  end;
end;

function TGlobalVarDM.CheckRegister(strApplicationPath, strBankCode, strActiveBranchCode:String;boShowMessage:Boolean):Boolean;
var
	RegistrationInfo : TStringList;
  strTemp, strTemp2:string;
  boRsl:Boolean;
  dtExpire:TDateTime;
  boExpire:Boolean;
  ReleaseCodeString:String;
  SerialNumber:Integer;
begin
  Result := True;
	boRsl := True;
  boExpire := False;
  try
    if FileExists(strApplicationPath + 'registration.dat') then
    begin
      RegistrationInfo := TStringList.Create;
      try
        try
          RegistrationInfo.LoadFromFile(strApplicationPath + 'registration.dat');
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

    SetApplicationPath(strApplicationPath);
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

function TGlobalVarDM.GetErrorDescription(vErrorCode:String):String;
begin
  Result := '';
  with TempQuery do
  begin
    if Active then
      Close;
    SQL.Clear;
    SQL.Add('SELECT DESKRIPSI FROM ' + DB_TABLE_REF_KODE_ERROR);
    SQL.Add('WHERE KODE_ERROR=' + QuotedStr(vErrorCode));
    Open;
    if Not Fields[0].IsNull then
      Result := Fields[0].AsString;

    if Active then
      Close;
  end;
end;

function TGlobalVarDM.GetNextDate2(crnDate:TDateTime;strSandiWilayah:String;Const useRegionHoliday:Boolean=False):TDateTime;
var
	nextDate:TDateTime;
  intLimitNext : Integer;
begin
	nextDate := IncDay(crnDate, 1);
	intLimitNext := 0;

  with TempQuery do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT CONVERT(VARCHAR(10), TANGGAL, 101) AS TANGGAL FROM ' + DB_TABLE_REF_HARI_LIBUR_NASIONAL);
    IF useRegionHoliday then
    begin
    	if Trim(strSandiWilayah) <>'' then
    	begin
      	SQL.Add('UNION SELECT CONVERT(VARCHAR(10), TANGGAL, 101) AS TANGGAL FROM ' + DB_TABLE_REF_HARI_LIBUR_WILAYAH);
      	SQL.Add('WHERE SANDI_WILAYAH_KLIRING=' + QuotedStr(strSandiWilayah));
      end;
    end;
    Open;
  end;

  while (TempQuery.Locate('TANGGAL', FormatDateTime('mm/dd/yyyy', nextDate), [])) and (intLimitNext < 30) do
  begin
   	nextDate := IncDay(nextDate, 1);
    inc(intLimitNext);
  end;

  TempQuery.Close;
  result := nextDate;
end;

function TGlobalVarDM.GetSandiKliringByBIC(strBIC: String): String;
begin
	Result := '';
	with TempQuery do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT SANDI_KLIRING_KANTOR_PUSAT FROM ' + DB_TABLE_REF_PESERTA);
    SQL.Add('WHERE DELETED=0 ');
    SQL.Add('AND BIC_PESERTA=' + QuotedStr(strBIC));
    Open;
    if Not Fields[0].IsNull then
    	Result := Fields[0].AsString;

    if Active then
    	Close;
  end;
end;

procedure TGlobalVarDM.GetSandiKliringAndWilayahByBIC(strBIC:String;Var vSandiKliring, vJenisBank, vWilayah:String);
begin
	vSandiKliring := '';
  vWilayah := '';
  vJenisBank := '';

	with TempQuery do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT A.SANDI_KLIRING_KANTOR_PUSAT, A.SANDI_INSTITUSI_PESERTA, B.SANDI_WILAYAH_KLIRING FROM ' + DB_TABLE_REF_PESERTA + ' AS A');
    SQL.Add('LEFT JOIN ' + DB_TABLE_REF_WILAYAH_KOTA + ' AS B ON B.SANDI_KOTA=A.SANDI_KOTA ');
    SQL.Add('WHERE A.DELETED=0 ');
    SQL.Add('AND A.BIC_PESERTA=' + QuotedStr(strBIC));
    Open;

    if Not Fields[0].IsNull then
    	vSandiKliring := Fields[0].AsString;

    if Not Fields[1].IsNull then
    	vJenisBank := Copy(Trim(Fields[1].AsString),4,1);

    if Not Fields[2].IsNull then
    	vWilayah := Fields[2].AsString;

    if Active then
    	Close;
  end;
end;

function TGlobalVarDM.GetSandiPropinsiBySandiKota(
  vSandiKota: String): String;
begin
	Result := '';
	with TempQuery do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT SANDI_PROPINSI FROM ' + DB_TABLE_REF_KOTA);
    SQL.Add('WHERE SANDI_KOTA=' + QuotedStr(vSandiKota));
    Open;
    if not Fields[0].IsNull then
    	Result := Fields[0].AsString;

    if Active then
    	Close;
  end;
end;

function TGlobalVarDM.GetProfileInfo:String;
var
  strProfile:String;
begin
	strProfile := Trim(GlobalVarForm.BankName);

  with TempQuery do
  begin
    if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT ib_name FROM ' + DB_TABLE_IBRANCH);
    SQL.Add('WHERE ib_code=' + QuotedStr(GlobalVarForm.BankActiveBranch));
    Open;

		if not Fields[0].IsNull then
    begin
      if Trim(strProfile) = '' then
      	strProfile := Trim(Fields[0].AsString)
      else
      	strProfile := strProfile + #13#10 + Fields[0].AsString;
    end;
  end;

  Result := strProfile;
end;

function TGlobalVarDM.GetSandiInstitusiByBIC(strBIC: String): String;
begin
	Result := '';
	with TempQuery do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT SANDI_INSTITUSI_PESERTA FROM ' + DB_TABLE_REF_PESERTA);
    SQL.Add('WHERE DELETED=0 ');
    SQL.Add('AND BIC_PESERTA=' + QuotedStr(strBIC));
    Open;
    if Not Fields[0].IsNull then
    	Result := Fields[0].AsString;

    if Active then
    	Close;
  end;

end;

function TGlobalVarDM.GetServerDate: TDateTime;
begin
	try
    with TempQuery do
    begin
      if Active  then Close;
      SQL.Clear;
      SQL.Add('SELECT GETDATE() AS TANGGAL ');
      Open;

      Result := FieldByName('TANGGAL').AsDateTime;
      if Active then Close;
    end;
  except
  	On E:Exception do
//    	MessageDlg('Error On GetServerDate : ' + E.Message, mtError, [mbOK], 0);
    	MessageDlgEx('Error','Error On GetServerDate : ' + E.Message, mtError, ['&OK'],1, 0);
  end;
end;

function TGlobalVarDM.GetBICBySandiKliring(
  strSandiKliring: String): String;
var
  strInstitusiBank:String;
  strBICPeserta:String;
begin
  try
    strInstitusiBank := '';
    strBICPeserta		 := '';

    with TempQuery do
    begin
      //Get sandi institusi dari Ref_kantor_bank
      if Active then Close;
      SQL.Clear;
      SQL.Add('SELECT SANDI_INSTITUSI_BANK FROM ' + DB_TABLE_REF_KANTOR_BANK);
      SQl.Add('WHERE SANDI_KANTOR_BANK=' + QuotedStr(strSandiKliring));
      Open;
      If Not Fields[0].IsNull then
        strInstitusiBank := Fields[0].AsString;

      //Get BIC berdasarkan sandi intitusi
      if Active then Close;
      SQL.Clear;
      SQL.Add('SELECT BIC_PESERTA FROM ' + DB_TABLE_REF_PESERTA);
      SQL.Add('WHERE SANDI_INSTITUSI_PESERTA=' + QuotedStr(strInstitusiBank));
      Open;
      if Not Fields[0].IsNull then
        strBICPeserta := Fields[0].AsString;
    end;

    Result := strBICPeserta;
  finally
    if TempQuery.Active then
    	TempQuery.Close;
  end;
end;

function TGlobalVarDM.GetClearingCodeCoordinatorByBIC(strBIC, strWilayah:string):String;
begin
	Result := '';
	with TempQuery do
  begin
    if Active then CLose;
    SQL.Clear;
    SQL.Add('SELECT TOP 1 RK.SANDI_KANTOR_BANK FROM ' + DB_TABLE_REF_KANTOR_BANK + ' AS RK ');
    SQL.Add('LEFT JOIN ' + DB_TABLE_REF_PESERTA + ' AS RF ');
    SQL.Add('ON RF.SANDI_INSTITUSI_PESERTA = RK.SANDI_INSTITUSI_BANK ');
    SQL.Add('WHERE RF.BIC_PESERTA = ' + QuotedStr(strBIC));
    SQL.Add('AND RK.SANDI_WILAYAH_KLIRING = ' + QuotedStr(strWilayah));
    SQL.Add('ORDER BY RK.SANDI_STATUS_KOORDINATOR DESC ');
    Open;
    if Not Fields[0].IsNull then
    	Result := Fields[0].AsString;

    if Active then
    	Close;
  end;
end;

function TGlobalVarDM.GetSandiKotaByBIC(strBIC: String): String;
begin
	Result := '';
	with TempQuery do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT SANDI_KOTA FROM ' + DB_TABLE_REF_PESERTA);
    SQL.Add('WHERE DELETED=0 ');
    SQL.Add('AND BIC_PESERTA=' + QuotedStr(strBIC));
    Open;
    if Not Fields[0].IsNull then
    	Result := Fields[0].AsString;

    if Active then
    	Close;
  end;
end;

function TGlobalVarDM.GetSandiKotaBySandiCabangInternal(
  strSandiCabang: String): String;
begin
	Result := '0391';
	with TempQuery do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT ib_city_code FROM ' + DB_TABLE_IBRANCH);
    SQL.Add('WHERE ib_code=' + QuotedStr(strSandiCabang));
    Open;

    if Not Fields[0].IsNull then
    	Result := Fields[0].AsString;

    if Active then
    	Close;
  end;
end;

end.
