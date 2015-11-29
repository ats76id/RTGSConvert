unit fRules;

interface

uses Windows, Classes, SysUtils, DB, ADODB;

type
  setofbyte = set of Byte;
  TArrInt   = array of Integer;

function ruleInitModule(AdoConnRule: TADOConnection): Integer;
function ruleDeInitModule: Integer;
function ruleUserAccessList(const strUserID: string; const intModule: Integer;
  var AccessList: TArrInt): Integer;
function ruleListUser(var slUsers: TStringList): Integer;
function ruleListGroup(var slGroups: TStringList): Integer;
function ruleRemoveUser(const strUserID: string): Integer;
function ruleFlagRemoveUser(const strUserID, strEditUser: string): Integer;
function ruleFlagUser(const strUserID: string; intStatus: Integer): Integer;
function ruleIsUserMemberOfGroup(const strUserID, strGroup: string;
  var boMember: Boolean): Integer;
function ruleRemoveGroup(const strGroup: string): Integer;
function ruleUpdateUserData(const strQry: string): Integer;
function ruleCreateGroup(const strGroup, strDesc, strCreateUser: string): Integer;
function ruleGetAccessID(var slAccess: TStringList): Integer;
function ruleGetGroupData(const strGroup: string; var btStatus: Byte; var strCreateUser,
  strEditUser, strValidateUser: string): Integer;
function ruleGetGrpAccess(const strGroup: string; var slAccess: TStringList): Integer;
function ruleSetGroupCanAccessMenu(const strGroup, strAccID: string): Integer;
function ruleSetEditGroup(const strGroup, strEditUser: string): Integer;
function ruleUpdateGroupData(const strGroup, strDesc, strEditUser: string;
  const intStatus: Byte): Integer;
function ruleValidateGroup(const strGroup, strUserValidate: string): Integer;
function ruleRemoveAllAccess(const strGroup: string): Integer;
function ruleFlagDeleteGroup(const strGroup, strEditUser: string): Integer;
function ruleCreateUser(const strUserId, strUName,  strPass, strGroup,
  strCreateUser: string): Integer;
function ruleGetListGroupValidated(var slGroups: TStringList): Integer;
function ruleGetUserData(const strUserID: string; var boActive: Boolean; var
  btUStatus: Byte; var strCreateUser, strEditUser, strValidateUser, strGroup: string;
  var intGroupStatus, intBadLogin: Integer): Integer;
function ruleGetUserDataForDelete(const strUserID: string; var boActive: Boolean;
  var strEditUser: string): Integer;


(*

function ruleUpdateUserData(const strQry: string): Integer;
function ruleSetEditUser(const strUserID, strEditUser: string): Integer;

function ruleValidateUser(const strUserID, strUserValidate: string): Integer;


function ruleRemoveGroup(const strGroup: string): Integer;
function ruleIsUserMemberOfGroup(const strUserID, strGroup: string;
  var boMember: Boolean): Integer;
function ruleGetListGroupValidated(const ListGrpParam: string;
  var slGroups: TStringList): Integer;
function ruleAddGroupMember(const strUserID, strGroup: string): Integer;
function ruleRemoveGroupMember(const strUserID, strGroup: string): Integer;
{function ruleRemoveAllGroupMember(const strUserID: string): Integer;}

function ruleSetGroupCanAccessMenu(const strGroup, strAccID: string): Integer;
function ruleUnSetGroupCanAccessMenu(const strGroup, strAccID: string): Integer;
function ruleGetSpec(const intParamID: Integer; var strData: string): Integer;

function ruleUpdatePass(const strUserID, strPass, strUserEdit: string): Integer;
function ruleGetMemberOf(const strUserID: string; var slGroups: TStringList): Integer;


  *)

function ruleUpdateSpec(const intParamID: Integer; const strData: string): Integer;
procedure ruleSaveLog(const strUserID: string; intModule: Integer;
  const strActivity: string);


var
  ADOQryRule: TADOQuery;

implementation

uses
  fUMCConst, fGlobalVar, fUserLib;

function ruleInitModule(AdoConnRule: TADOConnection): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule := TADOQuery.Create(nil);
  try
    AdoQryRule.Connection := AdoConnRule;
    Result := VR_OK;
  finally
  end;
end;

function ruleDeInitModule: Integer;
begin
  Result := VR_OK;
  if AdoQryRule.Active then AdoQryRule.Close;
  AdoQryRule.Free;
  AdoQryRule := nil;
end;

function ruleUserAccessList(const strUserID: string; const intModule: Integer;
  var AccessList: TArrInt): Integer;
var
  intI: Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    //AccessList := apokUserAccessList(strUserID, intModule);
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Select Distinct ga.access_id from ' + DB_TABLE_GROUP_ACCESS + ' GA left join');
      SQL.Add(DB_TABLE_ACCESS + ' A on A.access_id=GA.access_id where A.access_parent=' + IntToStr(intModule));
      SQL.Add('and GA.group_name=(Select group_name from ' + DB_TABLE_USER + ' where user_name=''' + frmUserLib.encUser(strUserID) + ''')');
      Open;
      if RecordCount>0 then
      begin
        SetLength(AccessList, RecordCount);
        First;
        for intI := 0 to RecordCount-1 do
        begin
          AccessList[intI] := Fields[0].AsInteger;
          Next;
        end;
        Result := VR_OK;
      end
      else
     		Result := VR_USER_NOT_HAVE_ACCESS;
      Close;
    end;
  except
    on e: Exception do
    begin
      AdoQryRule.Close;
      MessageBox(0, PChar(E.message), 'Rules Exception', MB_OK);
    end;
  end;
end;

function ruleListUser(var slUsers: TStringList): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  slUsers.Clear;
  try
    try
      with AdoQryRule do begin
        SQL.Clear;
        SQL.Add('Select user_name, user_full_name, user_status, user_active, group_name, user_password_date from ' + DB_TABLE_USER);
        Open;
        while not EOF do
        begin
          slUsers.Add(frmUserLib.decUser(Trim(Fields[0].AsString)) + sep + frmUserLib.decUser(Trim(Fields[1].AsString)) + sep +
                      IntToStr(Fields[2].AsInteger) + sep +
                      BoolToStr(Fields[3].AsBoolean, True) + sep +
                      frmUserLib.decGroup(Fields[4].AsString) + sep +
                      FormatDateTime('dd/mm/yyyy', Fields[5].AsDateTime + frmUserLib.usrPasswordExpire + 1));
          Next;
        end;
        Result := VR_OK;
      end;
    except
      on E: Exception do
        MessageBox(0, PChar(E.message), 'Rules Exception', MB_OK);
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleListGroup(var slGroups: TStringList): Integer;
begin
  AdoQryRule.Close;
  slGroups.Clear;
  Result := VR_FAILED;
  try
    try
      with AdoQryRule do
      begin
        SQL.Clear;
        SQL.Add('Select group_name, group_desc, group_status From ' + DB_TABLE_USER_GROUP);
        Open;
        while not EOF do
        begin
          slGroups.Add(frmUserLib.decGroup(Trim(Fields[0].AsString)) + SEP + frmUserLib.decUser(Trim(Fields[1].AsString)) + SEP +
            Fields[2].AsString);
          Next;
        end;
        Result := VR_OK;
      end;
    except
      on E: Exception do
        MessageBox(0, PChar(E.message), 'Exception', MB_OK);
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleFlagRemoveUser(const strUserID, strEditUser: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Update ' + DB_TABLE_USER + ' set user_status=' + IntToStr(ST_DELETE_FLAG) +
        ', user_edited_by=''' + frmUserLib.encUser(strEditUser) + ''' Where user_name=''' + frmUserLib.encUser(strUserID) + '''');
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleRemoveUser(const strUserID: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Delete From ' + DB_TABLE_PASSWORD_LIST + ' where user_name=''' + frmUserLib.encUser(strUserID) + '''');
      ExecSQL;
{      Close;
      SQL.Clear;
      SQL.Add('Delete From ' + apokDBUser + '.dbo.userlog where us_name=''' + EncUser(strUserID) + '''');
      ExecSQL;}
      Close;
      SQL.Clear;
      SQL.Add('Delete From ' + DB_TABLE_USER + ' Where user_name=''' + frmUserLib.encUser(strUserID) + '''');
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleFlagUser(const strUserID: string; intStatus: Integer): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Update ' + DB_TABLE_USER + ' set user_status=' + IntToStr(intStatus));
      SQL.Add('Where user_name=''' + frmUserLib.EncUser(strUserID) + '''');
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleIsUserMemberOfGroup(const strUserID, strGroup: string;
  var boMember: Boolean): Integer;
begin
  Result := VR_FAILED;
  boMember := False;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Select * From ' + DB_TABLE_USER + ' where group_name=''' + frmUserLib.encGroup(strGroup) +
        '''and  user_name<>''' + frmUserLib.encUser(strUserID) + '''');
      Open;
      if RecordCount<>0 then
        boMember := True
      else
        boMember := False;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleRemoveGroup(const strGroup: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Select * From ' + DB_TABLE_USER + ' Where group_name=''' + frmUserLib.encGroup(strGroup) + '''');
      Open;
      if RecordCount<>0 then
      begin
        Result := VR_GROUP_EXISTS;
      end
      else begin
        Close;
        SQL.Clear;
        SQL.Add('Delete From ' + DB_TABLE_GROUP_ACCESS + ' Where group_name=''' + frmUserLib.encGroup(strGroup) + '''');
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Add('Delete From ' + DB_TABLE_USER_GROUP + ' Where group_name=''' + frmUserLib.encGroup(strGroup) + '''');
        ExecSQL;
        Result := VR_OK;
      end;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleUpdateUserData(const strQry: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add(strQry);
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleCreateGroup(const strGroup, strDesc, strCreateUser: string): Integer;
var
  boRecExists: Boolean;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      //SQL.Add('Select gr_name From ' + apokDBUser + '.dbo.groups Where gr_name='''+ frmUserLib.encGroup(strGroup) +'''');
      SQL.Add('Select group_name From ' + DB_TABLE_USER_GROUP);
      Open;
      boRecExists := False;
      if RecordCount>0 then
      begin
        boRecExists := False;
        First;
        repeat
          boRecExists := LowerCase(frmUserLib.decGroup(Fields[0].AsString))=LowerCase(strGroup);
          Next;
        until boRecExists or EOF;
      end;

      if boRecExists then
      begin
        Result := VR_GROUP_EXISTS;
      end
      else begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into ' + DB_TABLE_USER_GROUP + '(group_name, group_desc, group_status, group_created_by, group_create_date)' +
          ' values(:p0,:p1,:p2,:p3,:p4)');
        Parameters[0].Value := frmUserLib.encGroup(strGroup);
        Parameters[1].Value := frmUserLib.encUser(strDesc);
        Parameters[2].Value := ST_NEW;
        Parameters[3].Value := frmUserLib.encUser(strCreateUser);
        Parameters[4].DataType := ftDate;
        Parameters[4].Value 	 := Date;
        ExecSQL;
        Result := VR_OK;
      end;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleGetAccessID(var slAccess: TStringList): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do begin
      SQL.Clear;
      SQL.Add('Select access_id From ' + DB_TABLE_ACCESS + ' Order by access_parent asc, access_id asc');
      Open;
      while not Eof do
      begin
        slAccess.Add(Fields[0].AsString);
        Next;
      end;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleGetGroupData(const strGroup: string; var btStatus: Byte; var strCreateUser,
  strEditUser, strValidateUser: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Select group_status, group_created_by, group_edited_by, group_validated_by ' +
        'From ' + DB_TABLE_USER_GROUP + ' where group_name=''' + frmUserLib.encGroup(strGroup) + '''');
      Open;
      try
        btStatus := StrToInt(Fields[0].AsString);
        strCreateUser := frmUserLib.decUser(Fields[1].AsString);
        strEditUser := frmUserLib.decUser(Fields[2].AsString);
        strValidateUser := frmUserLib.decUser(Fields[3].AsString);
        Result := VR_OK;
      except
      end;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleGetGrpAccess(const strGroup: string; var slAccess: TStringList): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Select a.access_id from ' + DB_TABLE_ACCESS + ' a left join ' + DB_TABLE_GROUP_ACCESS +
        ' ga on a.access_id=ga.access_id where ga.group_name=''' + frmUserLib.encGroup(strGroup) + ''' order by a.access_parent');
      Open;
      while not EOF do
      begin
        slAccess.Add(IntToStr(Fields[0].AsInteger));
        //slAccess.Add(IntToStr(Fields[0].AsInteger) + ';' + IntToStr(Fields[1].AsInteger));
        Next;
      end;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleSetGroupCanAccessMenu(const strGroup, strAccID: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do begin
      SQL.Clear;
      SQL.Add('Insert Into ' + DB_TABLE_GROUP_ACCESS + ' Values(''' + frmUserLib.encGroup(strGroup) + ''','
        + strAccID + ')');
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleSetEditGroup(const strGroup, strEditUser: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do begin
      SQL.Clear;
      SQL.Add('Update ' + DB_TABLE_USER_GROUP + ' Set group_status=' + IntToStr(ST_EDITED) +
        ', group_edited_by=''' + frmUserLib.encUser(strEditUser) + ''' Where group_name=''' + frmUserLib.encGroup(strGroup) + '''');
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleUpdateGroupData(const strGroup, strDesc, strEditUser: string;
  const intStatus: Byte): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do begin
      SQL.Clear;
      SQL.Add('Update ' + DB_TABLE_USER_GROUP + ' Set group_desc=''' + frmUserLib.encUser(strDesc) + '''');
      if intStatus=ST_EDITED then
        SQL.Add(', group_edited_by=''' + frmUserLib.encUser(strEditUser) + ''', group_status=' + IntToStr(ST_EDITED));
      SQL.Add(' Where group_name=''' + frmUserLib.encGroup(strGroup) + '''');
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleValidateGroup(const strGroup, strUserValidate: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Update ' + DB_TABLE_USER_GROUP + ' set group_status=' + IntToStr(ST_AUTHORIZED) +
        ', group_validated_by=''' + frmUserLib.encUser(strUserValidate) + ''' Where group_name=''' + frmUserLib.encGroup(strGroup) + '''');
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleRemoveAllAccess(const strGroup: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Delete From ' + DB_TABLE_GROUP_ACCESS + ' where group_name=''' +  frmUserLib.encGroup(strGroup) + '''');
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleFlagDeleteGroup(const strGroup, strEditUser: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Update ' + DB_TABLE_USER_GROUP + ' Set group_status=' + IntToStr(ST_DELETE_FLAG) +
        ', group_edited_by=''' + frmUserLib.encUser(strEditUser) + ''' Where group_name=''' + frmUserLib.encGroup(strGroup) + '''');
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleCreateUser(const strUserId, strUName, strPass, strGroup,
  strCreateUser: string): Integer;
var
  strTempPass, strDate: string;
  intI: Integer;
  boRecExists: Boolean;
begin
  Result := VR_FAILED;
 // if ruleGetSpec(PARA_PASSWORD_EXPIRE, strDate)=VR_OK then begin
 //   intI := StrToInt(strDate);
    AdoQryRule.Close;
    try
      try
        strTempPass := frmUserLib.encByKey(strPass, strUserID);
        with AdoQryRule do begin
          SQL.Clear;
          //SQL.Add('Select us_name From ' + apokDBUser + '.dbo.users WHERE us_name='''+ frmUserLib.encUser(strUserId) +'''');
          SQL.Add('Select user_name From ' + DB_TABLE_USER);
          Open;
          boRecExists := False;
          if RecordCount>0 then
          begin
            First;
            repeat
              boRecExists := LowerCase(frmUserLib.decUser(Fields[0].AsString))=LowerCase(strUserID);
              Next;
            until boRecExists or EOF;
          end;

          if boRecExists then
          begin
            Result := VR_USER_EXISTS;
          end
          else begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO ' + DB_TABLE_USER + ' (user_name, user_full_name, user_created_by, ' +
              'user_create_date, user_status, user_active, group_name, user_password, user_password_date)');
            SQL.Add('VALUES (:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8)');
            Parameters[0].Value := frmUserLib.encUser(strUserID);
            Parameters[1].Value := frmUserLib.encUser(strUName);
            Parameters[2].Value := frmUserLib.encUser(strCreateUser);
            Parameters[3].DataType := ftDate;
            Parameters[3].Value := Date;
            Parameters[4].Value := ST_NEW;
            Parameters[5].Value := 0;
            Parameters[6].Value := frmUserLib.encGroup(strGroup);
            Parameters[7].Value := frmUserLib.encByKey(strPass, strUserID);
            Parameters[8].DataType := ftDate;
            Parameters[8].Value := Date-frmUserLib.usrPasswordExpire-1;
            ExecSQL;
            Result := VR_OK;
          end;
        end;
      except
        on E:Exception do
          MessageBox(0, PChar(E.message), 'Rules Exception', MB_OK);
      end;
    finally
      AdoQryRule.Close;
    end;
  //end;
end;

function ruleGetListGroupValidated(var slGroups: TStringList): Integer;
begin
  AdoQryRule.Close;
  slGroups.Clear;
  Result := VR_FAILED;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Select group_name from ' + DB_TABLE_USER_GROUP + ' where group_status=' +
        IntToStr(ST_AUTHORIZED));
      Open;
      while not EOF do begin
        slGroups.Add(frmUserLib.decGroup(Fields[0].AsString));
        Next;
      end;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleGetUserData(const strUserID: string; var boActive: Boolean; var
  btUStatus: Byte; var strCreateUser, strEditUser, strValidateUser, strGroup: string;
  var intGroupStatus, intBadLogin: Integer): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Select u.user_active, u.user_status, u.user_created_by, u.user_edited_by, u.user_validated_by, u.group_name,' +
        ' g.group_status, u.user_bad_login From ' + DB_TABLE_USER + ' u left join ' + DB_TABLE_USER_GROUP + ' g' +
        ' on g.group_name=u.group_name where u.user_name=''' + frmUserLib.encUser(strUserId) + '''');
      Open;
      try
        boActive := Fields[0].AsBoolean;
        btUStatus := Fields[1].AsInteger;
        strCreateUser := frmUserLib.decUser(Fields[2].AsString);
        strEditUser := frmUserLib.decUser(Fields[3].AsString);
        strValidateUser := frmUserLib.decUser(Fields[4].AsString);
        strGroup := frmUserLib.decGroup(Fields[5].AsString);
        intGroupStatus := Fields[6].AsInteger;
        intBadLogin := Fields[7].AsInteger;
        Result := VR_OK;
      except
        on E:Exception do
          MessageBox(0, PChar(E.message), 'Rules Exception', MB_OK);
      end;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleGetUserDataForDelete(const strUserID: string; var boActive: Boolean;
  var strEditUser: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Select user_active, user_edited_by From ' + DB_TABLE_USER +
        ' where user_name=''' + frmUserLib.encUser(strUserId) + '''');
      Open;
      try
        boActive := Fields[0].AsBoolean;
        strEditUser := frmUserLib.decUser(Fields[1].AsString);
        Result := VR_OK;
      except
        on E:Exception do
          MessageBox(0, PChar(E.message), 'Rules Exception', MB_OK);
      end;
    end;
  finally
    AdoQryRule.Close;
  end;
end;

function ruleUpdateSpec(const intParamID: Integer; const strData: string): Integer;
begin
  Result := VR_FAILED;
  AdoQryRule.Close;
  try
    with AdoQryRule do
    begin
      SQL.Clear;
      SQL.Add('Update ' + DB_TABLE_PARAMS + ' set para_data1=''' + strData + ''' where para_id=' +
        IntToStr(intParamId));
      ExecSQL;
      Result := VR_OK;
    end;
  finally
    AdoQryRule.Close;
  end;
end;


procedure ruleSaveLog(const strUserID: string; intModule: Integer;
  const strActivity: string);
begin
  try
    frmUserLib.usrLogWrite(strUserId, intModule, Trim(Copy(strActivity,1,128)));
  except
    on e: Exception do
      MessageBox(0, PChar(E.message), 'Rules Exception while save log', MB_OK);
  end;
end;



end.
