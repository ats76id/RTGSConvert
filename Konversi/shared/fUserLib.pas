unit fUserLib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, HCMngr, fConst;

const
  strmondo1 : string = 'b1smiLL4h';
  strmondo2 : string = '4buF@ri5';

type
  TfrmUserLib = class(TForm)
    adoqProcess: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    cmCipher : TCipherManager;
    strmondo: string;
    intI: Integer;
    boInitialized: Boolean;
    //adocConnection: TADOConnection;
    //adoqProcess: TADOQuery;

    intMinPassLength: Integer;
    intMaxPassLength: Integer;
    intMinUserLength: Integer;
    intMaxUserLength: Integer;
    intPassExpire: Integer;
    intPassHistory: Integer;

    strNamaWilKliring: string;

    dtPresentWorkDate: TDateTime;
    dtPrevWorkDate: TDateTime;
    dtNextWorkDate: TDateTime;
    intProcessStatus: Integer;
    intSysStatus: Integer;
    strActiveWilKliring: string;
    strDBLocation: string;

    crProccessFee: Currency;
    crPocketFee: Currency;
    crRejectFee: Currency;

    strParaTempAccNo: string;
    strParaFeeIncomeAccNo: string;
    strParaFeeIncomeRejAccNo: string;

    strParaPostUnitCode: string;
    strParaClearingPostCode: string;
    strParaClearingTrnCode: string;
    strParaFeePostCode: string;
    strParaFeeTrnCode: string;

    strFTPAddress1: string;
    strFTPUser1: string;
    strFTPPassword1: string;
    strFTPAddress2: string;
    strFTPUser2: string;
    strFTPPassword2: string;
    strFTPAddress3: string;
    strFTPUser3: string;
    strFTPPassword3: string;

    strWinSharedFolder1: string;
    strWinSharedFolder2: string;
    strWinSharedFolder3: string;
    strWinSharedFolder4: string;
    strWinSharedFolder5: string;
    strWinSharedFolder6: string;
    strWinSharedFolder7: string;
    strWinSharedFolder8: string;
    strWinSharedFolder9: string;

    intCommandTimeOut: Integer;

    ArrRights: TArrInt;

    btParaLoadDataDone: Byte;
    btParaBackupUserDone: Byte;
    btParaBackupMainDone: Byte;
    btParaBackupTrxDone: Byte;
    btParaRekapDataDone: Byte;

    btParaImportTableDimensiDone: Byte;
    btParaEksporCLSEMUADone: Byte;
    btParaEksporTrxBSKDone: Byte;
    btParaEksporTrxFeeProcessDone: Byte;
    btParaEksporTrxFeeRejectDone: Byte;
    btParaEksporSortPatternDone: Byte;
    btParaEksporSandiBankDone: Byte;

    btParaReport1Done: Byte;
    btParaReport2Done: Byte;
    btParaReport3Done: Byte;
    btParaReport4Done: Byte;
    btParaReport5Done: Byte;
    btParaReport6Done: Byte;
    btParaReport7Done: Byte;
    btParaReport8Done: Byte;
    btParaReport9Done: Byte;
    btParaReport10Done: Byte;

    intStartingPocket : Integer;

    strDBUserName: string;
  	strDBPassword: string;
    boUseMaxLogon:Boolean;

  public
    { Public declarations }
    function decByKey(strBuf, strKey: string): string;
    function decGroup(strGroup: string): string;
    function decUser(strUser: string): string;
    function encByKey(strBuf, strKey: string): string;
    function encGroup(strGroup: string): string;
    function encUser(strUser: string): string;
    function GetParamAsByte(adoq: TADOQuery; intParamID,
      intDefault: Byte): Byte;
    function GetParamAsCurrency(adoq: TADOQuery; intParamID: Integer;
      crDefault: Currency): Currency;
    function GetParamAsDateTime(adoq: TADOQuery; intParamID: Integer;
      dtDefault: TDateTime): TDateTime;
    function GetParamAsInteger(adoq: TADOQuery; intParamID,
      intDefault: Integer): Integer;
    function GetParamAsString(adoq: TADOQuery; intParamID: Integer;
      strDefault: string): string;
    function usrActiveWilKliring: string;
    function usrBackupMainDone: Byte;
    function usrBackupTrxDone: Byte;
    function usrBackupUserDone: Byte;
    function usrCheckRights(intValue: Integer): Boolean;
    function usrCheckTask: Integer;
    function usrCommandTimeOut: Integer;
    (*
    function usrDataSource: string;
    function usrDBIntialTrx: string;
    function usrDBLocation: string;
    function usrDBMain: string;
    function usrDBUser: string;
    function usrRegKey: string;
    *)
    function usrDBPassword: string;
    function usrDBUsername: string;
    function usrFIEksporCLSEMUADone: Byte;
    function usrFIEksporSandiBankDone: Byte;
    function usrFIEksporSortPatternDone: Byte;
    function usrFIEksporTrxBSKDone: Byte;
    function usrFIEksporTrxFeeProcessDone: Byte;
    function usrFIEksporTrxFeeRejectDone: Byte;
    function usrFIImportTableDimensiDone: Byte;
    function usrFTPAddress1: string;
    function usrFTPAddress2: string;
    function usrFTPAddress3: string;
    function usrFTPPassword1: string;
    function usrFTPPassword2: string;
    function usrFTPPassword3: string;
    function usrFTPUser1: string;
    function usrFTPUser2: string;
    function usrFTPUser3: string;
    procedure usrInit(adocConn: TADOConnection; vstrDataSource, vstrDBMain,
      vstrDBUser, vstrInitialDBTrx, vstrDBUserName, vstrDBPassword,
      vstrusrRegKey: string);
    function usrLoadDataDone: Byte;
    function usrLoadDBConfiguration: Integer;
    function usrLogWrite(strUserName: string; intModule: Integer;
      strActivity: string): Integer;
    function usrMaxPassLength: Integer;
    function usrMaxUserLength: Integer;
    function usrMinPassLength: Integer;
    function usrMinUserLength: Integer;
    function usrNamaWilKliring: string;
    function usrNextWorkDate: TDateTime;
    function usrParaClearingPostCode: string;
    function usrParaClearingTrnCode: string;
    function usrParaFeeIncomeAccNo: string;
    function usrParaFeeIncomeRejAccNo: string;
    function usrParaFeePostCode: string;
    function usrParaFeeTrnCode: string;
    function usrParaPostUnitCode: string;
    function usrParaTempAccNo: string;
    function usrPasswordExpire: Integer;
    function usrPasswordHistory: Integer;
    function usrPocketFee: Currency;
    function usrPresentWorkDate: TDateTime;
    function usrPrevWorkDate: TDateTime;
    function usrProccessFee: Currency;
    function usrProcessStatus: Integer;
    function usrRejectFee: Currency;
    function usrRekapDataDone: Byte;
    function usrReport10Done: Byte;
    function usrReport1Done: Byte;
    function usrReport2Done: Byte;
    function usrReport3Done: Byte;
    function usrReport4Done: Byte;
    function usrReport5Done: Byte;
    function usrReport6Done: Byte;
    function usrReport7Done: Byte;
    function usrReport8Done: Byte;
    function usrReport9Done: Byte;
    function usrStartingPocket: Integer;
    function usrSysStatus: Integer;
    function usrUserAccessList(strUser: string;
      intModule: Integer): Integer;
    procedure usrUserModuleAccess(strUser: string);
    function usrWinSharedFolder1: string;
    function usrWinSharedFolder2: string;
    function usrWinSharedFolder3: string;
    function usrWinSharedFolder4: string;
    function usrWinSharedFolder5: string;
    function usrWinSharedFolder6: string;
    function usrWinSharedFolder7: string;
    function usrWinSharedFolder8: string;
    function usrWinSharedFolder9: string;
    function usrUseMaxLogon: Boolean;
		procedure GetListGroup(vListGroup:TStringList);
    procedure GetListAllUser(vListUser: TStringList);
		procedure GetListUserByGroup(vGroup:String;vListUser:TStringList);
  end;

var
  frmUserLib: TfrmUserLib;

implementation

uses fGlobalVar, fGlobalVarDM;

{$R *.dfm}

function TFrmUserLib.GetParamAsInteger(adoq: TADOQuery; intParamID, intDefault: Integer): Integer;
begin
  with adoq do
  begin
    if Locate('para_id', intParamID, []) then
      try
        Result := StrToInt(Trim(FieldByName('para_data1').AsString));
      except
        Result := intDefault;
      end
    else
      Result := intDefault;
  end;
end;

function TFrmUserLib.GetParamAsByte(adoq: TADOQuery; intParamID, intDefault: Byte): Byte;
begin
  with adoq do
  begin
    if Locate('para_id', intParamID, []) then
      try
        Result := StrToInt(Trim(FieldByName('para_data1').AsString));
      except
        Result := intDefault;
      end
    else
      Result := intDefault;
  end;
end;

function TFrmUserLib.GetParamAsString(adoq: TADOQuery; intParamID: Integer; strDefault: string): string;
begin
  with adoq do
  begin
    if Locate('para_id', intParamID, []) then
      Result := Trim(FieldByName('para_data1').AsString)
    else
      Result := strDefault;
  end;
end;

function TFrmUserLib.GetParamAsDateTime(adoq: TADOQuery; intParamID: Integer; dtDefault: TDateTime): TDateTime;
begin
  with adoq do
  begin
    if Locate('para_id', intParamID, []) then
      try
        Result := StrToFloat(Trim(FieldByName('para_data1').AsString));
      except
        Result := dtDefault;
      end
    else
      Result := dtDefault;
  end;
end;

function TFrmUserLib.GetParamAsCurrency(adoq: TADOQuery; intParamID: Integer; crDefault: Currency): Currency;
begin
  with adoq do
  begin
    if Locate('para_id', intParamID, []) then
      try
        Result := StrToCurr(Trim(FieldByName('para_data1').AsString));
      except
        Result := crDefault;
      end
    else
      Result := crDefault;
  end;
end;

procedure TFrmUserLib.usrInit(adocConn: TADOConnection; vstrDataSource, vstrDBMain, vstrDBUser,
  vstrInitialDBTrx, vstrDBUserName, vstrDBPassword, vstrusrRegKey: string);
begin
  //adocConnection := adocConn;
  (*
  strDBSourceName := vstrDataSource;
  strDBMain := vstrDBMain;
  strDBUser := 'users';//vstrDBUser;
  strInitialDBTrx := vstrInitialDBTrx;
  strDBUserName := vstrDBUserName;
  strDBPassword := vstrDBPassword;
  //strusrRegKey := vstrusrRegKey;
  boInitialized := True;
  *)
end;

function TFrmUserLib.usrLoadDBConfiguration: Integer;
begin
  Result := -1;
  //if boInitialized then
  begin
    //adoqProcess := TADOQuery.Create(nil);
    try
      try
        //if adocConnection.InTransaction then
        //  adocConnection.RollbackTrans;
        with adoqProcess do
        begin
          //Connection := adocConnection;
          if Active then
          	Close;
          SQL.Clear;
          SQL.Add('Select para_id, para_data1 From ' + DB_TABLE_PARAMS);
          try
            try
              Open;
              //Get the maximum and minimum value for user and password length
              intMinPassLength := GetParamAsInteger(adoqProcess, PARA_MIN_PASS_LENGTH,  6);
              intMaxPassLength := GetParamAsInteger(adoqProcess, PARA_MAX_PASS_LENGTH, 20);
              intMinUserLength := GetParamAsInteger(adoqProcess, PARA_MIN_USER_LENGTH,  6);
              intMaxUserLength := GetParamAsInteger(adoqProcess, PARA_MAX_USER_LENGTH, 20);
              intPassExpire    := GetParamAsInteger(adoqProcess, PARA_PASSWORD_EXPIRE, 90);
              intPassHistory   := GetParamAsInteger(adoqProcess, PARA_PASSWORD_HISTORY, 3);
              if GetParamAsInteger(adoqProcess, PARA_USE_MAX_LOGON, 0)= 1 then
              	boUseMaxLogon := True
              else
              	boUseMaxLogon := False;
            except
              on excE: Exception do
              begin
                MessageBox(0, PChar(excE.Message), PChar('UserLib : usrLoadDBConfiguration'),MB_ICONERROR);
              end;
            end;
          finally
            Close;
          end;

          SQL.Clear;
          SQL.Add('Select para_id, para_data1 From ' + DB_TABLE_PARAMS);
          try
            try
              Open;
              dtPresentWorkDate   := GetParamAsDateTime(adoqProcess, PARA_PRESENT_WORK_DATE,   0);
              dtPrevWorkDate      := GetParamAsDateTime(adoqProcess, PARA_PREV_WORK_DATE,      0);
              dtNextWorkDate      := GetParamAsDateTime(adoqProcess, PARA_NEXT_WORK_DATE,      0);
              intProcessStatus    := GetParamAsInteger(adoqProcess,  PARA_PROCESS_STATUS,      0);
              intSysStatus        := GetParamAsInteger(adoqProcess,  PARA_SYS_STATUS,          0);
              strActiveWilKliring := GetParamAsString(adoqProcess,   PARA_ACT_WIL_KLIRING,    '');
              intCommandTimeOut   := GetParamAsInteger(adoqProcess,  PARA_COMMAND_TIME_OUT, 1800);
              strDBLocation       := GetParamAsString(adoqProcess,   PARA_DB_LOCATION,        '');

              crProccessFee   := GetParamAsCurrency(adoqProcess, PARA_PROCESS_FEE, 0);
              crPocketFee     := GetParamAsCurrency(adoqProcess, PARA_POCKET_FEE,  0);
              crRejectFee     := GetParamAsCurrency(adoqProcess, PARA_REJECT_FEE,  0);

              strParaTempAccNo         := GetParamAsString(adoqProcess, PARA_TEMP_ACC_NO,       '');
              strParaFeeIncomeAccNo 	 := GetParamAsString(adoqProcess, PARA_FEE_INCOME_ACC_NO, '');
              strParaFeeIncomeRejAccNo := GetParamAsString(adoqProcess, PARA_FEE_INCOME_REJ_ACC_NO, '');

              strParaPostUnitCode     := GetParamAsString(adoqProcess, PARA_POST_UNIT_CODE,     '');
              strParaClearingPostCode := GetParamAsString(adoqProcess, PARA_CLEARING_POST_CODE, '');
              strParaClearingTrnCode  := GetParamAsString(adoqProcess, PARA_CLEARING_TRN_CODE,  '');
              strParaFeePostCode      := GetParamAsString(adoqProcess, PARA_FEE_POST_CODE,      '');
              strParaFeeTrnCode       := GetParamAsString(adoqProcess, PARA_FEE_TRN_CODE1,      '');

              strFTPAddress1  := GetParamAsString(adoqProcess, PARA_FTP_ADD1,  '');
              strFTPUser1     := GetParamAsString(adoqProcess, PARA_FTP_USR1,  '');
              strFTPPassword1 := GetParamAsString(adoqProcess, PARA_FTP_PASS1, '');
              strFTPAddress2  := GetParamAsString(adoqProcess, PARA_FTP_ADD2,  '');
              strFTPUser2     := GetParamAsString(adoqProcess, PARA_FTP_USR2,  '');
              strFTPPassword2 := GetParamAsString(adoqProcess, PARA_FTP_PASS2, '');
              strFTPAddress3  := GetParamAsString(adoqProcess, PARA_FTP_ADD3,  '');
              strFTPUser3     := GetParamAsString(adoqProcess, PARA_FTP_USR3,  '');
              strFTPPassword3 := GetParamAsString(adoqProcess, PARA_FTP_PASS3, '');

              strWinSharedFolder1 := GetParamAsString(adoqProcess, PARA_WIN_SHARED_FOLDER1, '');
              strWinSharedFolder2 := GetParamAsString(adoqProcess, PARA_WIN_SHARED_FOLDER2, '');
              strWinSharedFolder3 := GetParamAsString(adoqProcess, PARA_WIN_SHARED_FOLDER3, '');
              strWinSharedFolder4 := GetParamAsString(adoqProcess, PARA_WIN_SHARED_FOLDER4, '');
              strWinSharedFolder5 := GetParamAsString(adoqProcess, PARA_WIN_SHARED_FOLDER5, '');
              strWinSharedFolder6 := GetParamAsString(adoqProcess, PARA_WIN_SHARED_FOLDER6, '');
              strWinSharedFolder7 := GetParamAsString(adoqProcess, PARA_WIN_SHARED_FOLDER7, '');
              strWinSharedFolder8 := GetParamAsString(adoqProcess, PARA_WIN_SHARED_FOLDER8, '');
              strWinSharedFolder9 := GetParamAsString(adoqProcess, PARA_WIN_SHARED_FOLDER9, '');

              intStartingPocket := GetParamAsInteger(adoqProcess,  PARA_STARTING_POCKET, 2);
            except
              on excE: Exception do
              begin
                MessageBox(0, PChar(excE.Message), PChar('UserLib : usrLoadDBConfiguration'),MB_ICONERROR);
              end;
            end;
          finally
            Close;
          end;

          strNamaWilKliring := '';
          (*
          SQL.Clear;
          SQL.Add('Select nama_wilayah_kliring from ' + strDBMain  +
            '.dbo.ref_wilayah_kliring where sandi_wilayah_kliring=''' + strActiveWilKliring + '''');
          try
            try
              Open;
              strNamaWilKliring := Trim(Fields[0].AsString)
            except
              on excE: Exception do
              begin
                MessageBox(0, PChar(excE.Message), PChar('usr32.dll : usrLoadDBConfiguration'),MB_ICONERROR);
              end;
            end;
          finally
            Close;
          end;
          *)
          Result := 0;
        end;
      except
        on excE: Exception do
        begin
          MessageBox(0, PChar(excE.Message), PChar('UserLib : usrLoadDBConfiguration'),MB_ICONERROR);
        end;
      end;
    finally
      (*
      adoqProcess.Close;
      adoqProcess.Free;
      *)
    end;
  end;
end;

function TFrmUserLib.usrCheckTask: Integer; 
begin
  Result := -1;
  if boInitialized then
  begin
    //adoqProcess := TADOQuery.Create(nil);
    try
      try
        //if adocConnection.InTransaction then
        //  adocConnection.RollbackTrans;
        with adoqProcess do
        begin
          //Connection := adocConnection;
          if Active then
          	Close;
          SQL.Clear;
          SQL.Add('Select para_id, para_data1 From ' + DB_TABLE_PARAMS);
          try
            try
              Open;
              btParaLoadDataDone   := GetParamAsByte(adoqProcess, PARA_LOAD_DATA_DONE,   0);
              btParaBackupUserDone := GetParamAsByte(adoqProcess, PARA_BACKUP_USER_DONE, 0);
              btParaBackupMainDone := GetParamAsByte(adoqProcess, PARA_BACKUP_MAIN_DONE, 0);
              btParaBackupTrxDone  := GetParamAsByte(adoqProcess, PARA_BACKUP_TRX_DONE,  0);
              btParaRekapDataDone	 := GetParamAsByte(adoqProcess, PARA_REKAP_DATA_DONE,  0);

              btParaImportTableDimensiDone := GetParamAsByte(adoqProcess, PARA_FI_IMP_TBL_DIMENSI_DONE, 0);
              btParaEksporCLSEMUADone      := GetParamAsByte(adoqProcess, PARA_FI_EKS_CLSEMUA_DONE,     0);
              btParaEksporTrxBSKDone       := GetParamAsByte(adoqProcess, PARA_FI_EKS_TRX_BSK_DONE,     0);
              btParaEksporTrxFeeProcessDone:= GetParamAsByte(adoqProcess, PARA_FI_EKS_FEE_PROCESS_DONE, 0);
              btParaEksporTrxFeeRejectDone := GetParamAsByte(adoqProcess, PARA_FI_EKS_FEE_RJT_DONE,     0);
              btParaEksporSortPatternDone  := GetParamAsByte(adoqProcess, PARA_FI_EKS_SORT_PATTERN_DONE,0);
              btParaEksporSandiBankDone    := GetParamAsByte(adoqProcess, PARA_FI_EKS_SANDI_BANK_DONE,  0);

              btParaReport1Done  := GetParamAsByte(adoqProcess, PARA_REPORT_1_DONE, 0);
              btParaReport2Done  := GetParamAsByte(adoqProcess, PARA_REPORT_2_DONE, 0);
              btParaReport3Done  := GetParamAsByte(adoqProcess, PARA_REPORT_3_DONE, 0);
              btParaReport4Done  := GetParamAsByte(adoqProcess, PARA_REPORT_4_DONE, 0);
              btParaReport5Done  := GetParamAsByte(adoqProcess, PARA_REPORT_1_DONE, 0);
              btParaReport6Done  := GetParamAsByte(adoqProcess, PARA_REPORT_2_DONE, 0);
              btParaReport7Done  := GetParamAsByte(adoqProcess, PARA_REPORT_3_DONE, 0);
              btParaReport8Done  := GetParamAsByte(adoqProcess, PARA_REPORT_4_DONE, 0);
              btParaReport9Done  := GetParamAsByte(adoqProcess, PARA_REPORT_1_DONE, 0);
              btParaReport10Done := GetParamAsByte(adoqProcess, PARA_REPORT_2_DONE, 0);
            except
              on excE: Exception do
              begin
                MessageBox(0, PChar(excE.Message), PChar('UserLib : usrCheckTask'),MB_ICONERROR);
              end;
            end;
          finally
            Close;
          end;
        end;
        Result := 0;
      except
        on excE: Exception do
        begin
          MessageBox(0, PChar(excE.Message), PChar('UserLib : usrCheckTask'),MB_ICONERROR);
        end;
      end;
    finally
      (*
      adoqProcess.Close;
      adoqProcess.Free;
      *)
    end;
  end;
end;

function TFrmUserLib.usrLogWrite(strUserName: string; intModule: Integer; strActivity: string): Integer; 
begin
  Result := -1;
  if boInitialized then
  begin
//    adoqProcess := TADOQuery.Create(nil);
    try
      try
        //if adocConnection.InTransaction then
        //  adocConnection.RollbackTrans;
        with adoqProcess do
        begin
          //Connection := adocConnection;
          if Active then
          	Close;
          SQL.Clear;
          SQL.Add('INSERT INTO ' + DB_TABLE_USER_LOGS + '(log_time, log_module, log_desc, user_name)');
          if GlobalVarForm.DBType = 1 then
          	SQL.Add('VALUES (Now()')
          else
          	SQL.Add('VALUES (GetDate()');
          SQL.Add(',' + IntToStr(intModule) + ', ''' + strActivity + ''', ''' + encUser(strUserName) + ''')');
          ExecSQL;
        end;
        Result:=0;
      except
        on excE: Exception do
        begin
          MessageBox(0, PChar(excE.Message), PChar('UserLib : usrLogWrite'),MB_ICONERROR);
        end;
      end;
    finally
      (*
      adoqProcess.Close;
      adoqProcess.Free;
      *)
    end;
  end;
end;

function TFrmUserLib.usrUserAccessList(strUser: string; intModule: Integer): Integer; 
var
  intI: Integer;
begin
  Result := 0;
  SetLength(ArrRights,1);
  ArrRights[0] := 0;
  if boInitialized then
  begin
//    adoqProcess := TADOQuery.Create(nil);
    try
      with adoqProcess do
      begin
        //Connection := adocConnection;
        if Active then
        	Close;
        SQL.Clear;
        SQL.Add('Select Distinct access_id from ' + DB_TABLE_GROUP_ACCESS);
        if GlobalVarForm.DBType = 1 then
        	SQL.Add('where MID(CStr(access_id), 1, 1)=''' + IntToStr(intModule) + '''')
        else
        	SQL.Add('where SUBSTRING(CStr(access_id), 1, 1)=''' + IntToStr(intModule) + '''');
        SQL.Add('and group_name=(Select group_name from ' + DB_TABLE_USER + ' where user_name=''' + encUser(strUser) + ''')');
        try
          Open;
          if RecordCount>0 then
          begin
            SetLength(ArrRights, RecordCount);
            First;
            for intI := 0 to RecordCount-1 do
            begin
              ArrRights[intI] := Fields[0].AsInteger;
              Next;
            end;
            Result := RecordCount;
          end;
        except
          on excE: Exception do
          begin
            MessageBox(0, PChar(excE. Message), PChar('UserLib : usrUserAccessList'),MB_ICONERROR);
          end;
        end;
      end;
    finally
      (*
      adoqProcess.Close;
      adoqProcess.Free;
      *)
    end;
  end;
end;

procedure TFrmUserLib.usrUserModuleAccess(strUser: string);
var
  intI: Integer;
begin
  SetLength(ArrRights, 1);
  ArrRights[0] := 0;
  if boinitialized then
  begin
//    adoqProcess := TADOQuery.Create(nil);
    try
      with adoqProcess do
      begin
        //Connection := adocConnection;
        if Active then
        	Close;
        SQL.Clear;
        SQL.Add('Select Distinct ga.access_id from ' + DB_TABLE_GROUP_ACCESS + ' GA left join ');
        SQL.Add(DB_TABLE_ACCESS + ' A on A.access_id=GA.access_id where A.access_parent not in (5) ');// + IntToStr(intParentID));
        SQL.Add('AND GA.group_name=(Select group_name from ' + DB_TABLE_USER + ' where user_name=''' + encUser(strUser) + ''') ');
        try
          Open;
          if RecordCount>0 then
          begin
            SetLength(ArrRights, RecordCount);
            First;

            for intI := 0 to RecordCount-1 do
            begin
            //while not EOF do
            //egin
              ArrRights[intI] := Fields[0].AsInteger;
              //Result := Result + Fields[0].AsInteger;
              Next;
            end;
          end;
        except
          on excE: Exception do
          begin
            MessageBox(0, PChar(excE. Message), PChar('UserLib : usrUserModuleAccess'),MB_ICONERROR);
          end;
        end;
      end;
    finally
      (*
      adoqProcess.Close;
      adoqProcess.Free;
      *)
    end;
  end;
end;

function TFrmUserLib.usrCheckRights(intValue: Integer): Boolean; 
var
  intI: Integer;
begin
  Result := False;
  for intI := 0 to High(ArrRights) do
  begin
    if intValue=ArrRights[intI] then
    begin
      Result := True;
      Break;
    end;
  end;
end;
(*
function TFrmUserLib.usrRegKey: string;
begin
  //Result := strusrRegKey;
end;

function TFrmUserLib.usrDataSource: string;
begin
  Result := strDBSourceName;
end;

function TFrmUserLib.usrDBMain: string;
begin
  Result := strDBMain;
end;

function TFrmUserLib.usrDBUser: string;
begin
  Result := strDBUser;
end;

function TFrmUserLib.usrDBIntialTrx: string;
begin
  Result := strInitialDBTrx;
end;
*)
function TFrmUserLib.usrDBUsername: string;
begin
  Result := strDBUsername;
end;

function TFrmUserLib.usrDBPassword: string;
begin
  Result := strDBPassword;
end;

function TFrmUserLib.usrMinPassLength: Integer;
begin
  Result := intMinPassLength;
end;

function TFrmUserLib.usrMaxPassLength: Integer;
begin
  Result := intMaxPassLength;
end;

function TFrmUserLib.usrMinUserLength: Integer;
begin
  Result := intMinUserLength;
end;

function TFrmUserLib.usrMaxUserLength: Integer;
begin
  Result := intMaxUserLength;
end;

function TFrmUserLib.usrPasswordExpire: Integer; 
begin
  Result := intPassExpire;
end;

function TFrmUserLib.usrPasswordHistory: Integer; 
begin
  Result := intPassHistory;
end;

function TFrmUserLib.usrNamaWilKliring: string; 
begin
  Result := strNamaWilKliring;
end;

function TFrmUserLib.usrPresentWorkDate: TDateTime; 
begin
  Result := dtPresentWorkDate;
end;

function TFrmUserLib.usrPrevWorkDate: TDateTime; 
begin
  Result := dtPrevWorkDate;
end;

function TFrmUserLib.usrNextWorkDate: TDateTime; 
begin
  Result := dtNextWorkDate;
end;

function TFrmUserLib.usrProcessStatus: Integer; 
begin
  Result := intProcessStatus;
end;

function TFrmUserLib.usrSysStatus: Integer; 
begin
  Result := intSysStatus;
end;

function TFrmUserLib.usrActiveWilKliring: string; 
begin
  Result := strActiveWilKliring;
end;

function TFrmUserLib.usrCommandTimeOut: Integer; 
begin
  Result := intCommandTimeOut;
end;
(*
function TFrmUserLib.usrDBLocation: string;
begin
  Result := strDBLocation;
end;
*)
function TFrmUserLib.usrProccessFee: Currency; 
begin
  Result := crProccessFee;
end;

function TFrmUserLib.usrPocketFee: Currency; 
begin
  Result := crPocketFee;
end;

function TFrmUserLib.usrRejectFee: Currency; 
begin
  Result := crRejectFee;
end;

function TFrmUserLib.usrParaTempAccNo: string; 
begin
  Result := strParaTempAccNo;
end;

function TFrmUserLib.usrParaFeeIncomeAccNo: string; 
begin
  Result := strParaFeeIncomeAccNo;
end;

function TFrmUserLib.usrParaFeeIncomeRejAccNo: string; 
begin
  Result := strParaFeeIncomeRejAccNo;
end;

function TFrmUserLib.usrParaPostUnitCode: string; 
begin
  Result := strParaPostUnitCode;
end;

function TFrmUserLib.usrParaClearingPostCode: string; 
begin
  Result := strParaClearingPostCode;
end;

function TFrmUserLib.usrParaClearingTrnCode: string; 
begin
  Result := strParaClearingTrnCode;
end;

function TFrmUserLib.usrParaFeePostCode: string; 
begin
  Result := strParaFeePostCode;
end;

function TFrmUserLib.usrParaFeeTrnCode: string; 
begin
  Result := strParaFeeTrnCode;
end;



function TFrmUserLib.usrFTPAddress1: string; 
begin
  Result := strFTPAddress1;
end;

function TFrmUserLib.usrFTPUser1: string; 
begin
  Result := strFTPUser1;
end;

function TFrmUserLib.usrFTPPassword1: string; 
begin
  Result := strFTPPassword1;
end;

function TFrmUserLib.usrFTPAddress2: string; 
begin
  Result := strFTPAddress2;
end;

function TFrmUserLib.usrFTPUser2: string; 
begin
  Result := strFTPUser2;
end;

function TFrmUserLib.usrFTPPassword2: string; 
begin
  Result := strFTPPassword2;
end;

function TFrmUserLib.usrFTPAddress3: string;
begin
  Result := strFTPAddress3;
end;

function TFrmUserLib.usrFTPUser3: string; 
begin
  Result := strFTPUser3;
end;

function TFrmUserLib.usrFTPPassword3: string; 
begin
  Result := strFTPPassword3;
end;

function TFrmUserLib.usrWinSharedFolder1: string; 
begin
  Result := strWinSharedFolder1;
end;

function TFrmUserLib.usrWinSharedFolder2: string;
begin
  Result := strWinSharedFolder2;
end;

function TFrmUserLib.usrWinSharedFolder3: string; 
begin
  Result := strWinSharedFolder3;
end;

function TFrmUserLib.usrWinSharedFolder4: string; 
begin
  Result := strWinSharedFolder4;
end;

function TFrmUserLib.usrWinSharedFolder5: string; 
begin
  Result := strWinSharedFolder5;
end;

function TFrmUserLib.usrWinSharedFolder6: string; 
begin
  Result := strWinSharedFolder6;
end;

function TFrmUserLib.usrWinSharedFolder7: string; 
begin
  Result := strWinSharedFolder7;
end;

function TFrmUserLib.usrWinSharedFolder8: string; 
begin
  Result := strWinSharedFolder8;
end;

function TFrmUserLib.usrWinSharedFolder9: string; 
begin
  Result := strWinSharedFolder9;
end;

function TFrmUserLib.usrLoadDataDone: Byte; 
begin
  Result := btParaLoadDataDone;
end;

function TFrmUserLib.usrBackupUserDone: Byte; 
begin
 Result := btParaBackupUserDone;
end;

function TFrmUserLib.usrBackupMainDone: Byte; 
begin
  Result := btParaBackupMainDone;
end;

function TFrmUserLib.usrBackupTrxDone: Byte; 
begin
  Result := btParaBackupTrxDone;
end;

function TFrmUserLib.usrRekapDataDone: Byte; 
begin
  Result := btParaRekapDataDone;
end;

function TFrmUserLib.usrFIImportTableDimensiDone: Byte; 
begin
  Result := btParaImportTableDimensiDone;
end;

function TFrmUserLib.usrFIEksporCLSEMUADone: Byte; 
begin
  Result := btParaEksporCLSEMUADone;
end;

function TFrmUserLib.usrFIEksporTrxBSKDone: Byte; 
begin
  Result := btParaEksporTrxBSKDone;
end;

function TFrmUserLib.usrFIEksporTrxFeeProcessDone: Byte; 
begin
  Result := btParaEksporTrxFeeProcessDone;
end;

function TFrmUserLib.usrFIEksporTrxFeeRejectDone: Byte; 
begin
  Result := btParaEksporTrxFeeRejectDone;
end;

function TFrmUserLib.usrFIEksporSortPatternDone: Byte; 
begin
  Result := btParaEksporSortPatternDone;
end;

function TFrmUserLib.usrFIEksporSandiBankDone: Byte; 
begin
  Result := btParaEksporSandiBankDone;
end;

function TFrmUserLib.usrReport1Done: Byte; 
begin
  Result := btParaReport1Done;
end;

function TFrmUserLib.usrReport2Done: Byte; 
begin
  Result := btParaReport2Done;
end;

function TFrmUserLib.usrReport3Done: Byte; 
begin
  Result := btParaReport3Done;
end;

function TFrmUserLib.usrReport4Done: Byte; 
begin
  Result := btParaReport4Done;
end;

function TFrmUserLib.usrReport5Done: Byte; 
begin
  Result := btParaReport5Done;
end;

function TFrmUserLib.usrReport6Done: Byte; 
begin
  Result := btParaReport6Done;
end;

function TFrmUserLib.usrReport7Done: Byte; 
begin
  Result := btParaReport7Done;
end;

function TFrmUserLib.usrReport8Done: Byte; 
begin
  Result := btParaReport8Done;
end;

function TFrmUserLib.usrReport9Done: Byte; 
begin
  Result := btParaReport9Done;
end;

function TFrmUserLib.usrReport10Done: Byte; 
begin
  Result := btParaReport10Done;
end;                      

function TFrmUserLib.encUser(strUser: string): string;
begin
  cmCipher.InitKey('user' + strmondo, nil);
  Result := cmCipher.EncodeString(strUser);
end;

function TFrmUserLib.encGroup(strGroup: string): string;
begin
  cmCipher.InitKey('group' + strmondo,nil);
  Result := cmCipher.EncodeString(strGroup);
end;

function TFrmUserLib.encByKey(strBuf, strKey: string): string; 
begin
  cmCipher.InitKey(strmondo + strKey, nil);
  Result := cmCipher.EncodeString(strBuf);
end;

function TFrmUserLib.decUser(strUser: string): string; 
begin
  cmCipher.InitKey('user' + strmondo, nil);
  Result := cmCipher.DecodeString(strUser);
end;

function TFrmUserLib.decGroup(strGroup: string): string; 
begin
  cmCipher.InitKey('group' + strmondo, nil);
  Result := cmCipher.DecodeString(strGroup);
end;

function TFrmUserLib.decByKey(strBuf, strKey: string): string; 
begin
  cmCipher.InitKey(strmondo + strKey,nil);
  Result := cmCipher.DecodeString(strBuf);
end;

function TFrmUserLib.usrStartingPocket:Integer;
begin
  if (intStartingPocket=0) then
    intStartingPocket := 1;

  Result := intStartingPocket;
end;

procedure TfrmUserLib.FormCreate(Sender: TObject);
var
	intIdx:Integer;
begin
  cmCipher := TCipherManager.Create(nil);
  cmCipher.Algorithm := 'Diamond II';
  strmondo := '';

  for intIdx:=1 to Round(length(strmondo1)+length(strmondo2)/2) do
  begin
    if intIdx<=Length(strmondo1) then  strmondo:=strmondo+strmondo1[intIdx];
    if intIdx<=Length(strmondo2) then  strmondo:=strmondo+strmondo2[intIdx];
  end;


  if adoqProcess.Active then
  	adoqProcess.Close;

  adoqProcess.Connection := GlobalVarDM.MainADOConn;
  boInitialized := True;
end;

procedure TfrmUserLib.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if adoqProcess.Active then
  	adoqProcess.Close;

	cmCipher.Free;
end;

function TfrmUserLib.usrUseMaxLogon: Boolean;
begin
	Result := boUseMaxLogon;
end;

procedure TfrmUserLib.GetListGroup(vListGroup:TStringList);
begin
	with adoqProcess do
  begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('Select group_name FROM ' + DB_TABLE_USER_GROUP);
    Open;

    if RecordCount > 0 then
    begin
      vListGroup.Clear;
      while not Eof do
    	begin
        if (Not (Fields[0].IsNull)) AND (Trim(Fields[0].AsString)<>'') then
      		vListGroup.Add(decGroup(Fields[0].AsString));
        Next;
      end;
    end;

    If Active then Close;
  end;
end;

procedure TfrmUserLib.GetListAllUser(vListUser:TStringList);
begin
	with adoqProcess do
  begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('Select user_name, group_name FROM ' + DB_TABLE_USER);
    Open;

    if RecordCount > 0 then
    begin
      vListUser.Clear;
      while not Eof do
    	begin
        if (Not (Fields[0].IsNull)) AND (Trim(Fields[0].AsString)<>'') then
      		vListUser.Add(decUser(Fields[0].AsString) + ';' + decGroup(Fields[1].AsString));
        Next;
      end;
    end;

    If Active then Close;
  end;
end;

procedure TfrmUserLib.GetListUserByGroup(vGroup:String;vListUser:TStringList);
var
  strTemp:String;
begin
  strTemp := encGroup(vGroup);
	with adoqProcess do
  begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('Select user_name FROM ' + DB_TABLE_USER);
    SQL.Add('WHERE group_name=' + QuotedStr(strTemp));
    Open;

    if RecordCount > 0 then
    begin
      vListUser.Clear;
      while not Eof do
    	begin
        if (Not (Fields[0].IsNull)) AND (Trim(Fields[0].AsString)<>'') then
      		vListUser.Add(decUser(Fields[0].AsString));
        Next;
      end;
    end;

    If Active then Close;
  end;
end;

end.
