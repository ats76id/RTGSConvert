unit fChangePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, AdvPanel, Buttons, XPMan;

type
  TfrmChangePassword = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edName: TEdit;
    edOldPass: TEdit;
    edNewPass: TEdit;
    edConfirmPass: TEdit;
    adoqList: TADOQuery;
    adoqChange: TADOQuery;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    XPManifest1: TXPManifest;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FUserName: string;
    function IncludeSpecialCharacter(strStr:string):Boolean;
  public
    { Public declarations }
    property UserName: string read FUserName write FUserName;
  end;

var
  frmChangePassword: TfrmChangePassword;

implementation

uses fGlobalVar, fGlobalVarDM, fUMCResStr, 
  fConst, fUserLib;

{$R *.dfm}

{ TfrmChangePassword }

function TfrmChangePassword.IncludeSpecialCharacter(
  strStr: string): Boolean;
const
  arrSpecialCharacter : array[1..26] of Char =
    ('!','@','#','$','%','^','&','*','(',')','-','=','+','[',']','{','}','\',':','''','"','<','>',',','?','/');
var
  intI:Integer;
begin
  Result:=False;
  for intI:=1 to 26 do
  begin
    if Pos(arrSpecialCharacter[intI],strStr)>0 then
    begin
      Result:=True;
      Break;
    end;
  end;
end;

procedure TfrmChangePassword.FormShow(Sender: TObject);
begin
  edName.Text := FUserName;
  edOldPass.MaxLength := frmUserLib.usrMaxPassLength;
  edNewPass.MaxLength := edOldPass.MaxLength;
  edConfirmPass.MaxLength := edOldPass.MaxLength;
  edOldPass.Text := '';
  edNewPass.Text := '';
  edConfirmPass.Text := '';
  edOldPass.SetFocus;
end;

procedure TfrmChangePassword.btnSaveClick(Sender: TObject);
var
  intSeq: Integer;
  strEncPassword: string;
begin
  if edNewPass.Text<>edConfirmPass.Text then
  begin
    //If the new password is not the same as confirm password, display message
    edNewPass.SetFocus;
    MessageDlg(SEC_PASSWORD_DIFFERENT, mtInformation, [mbOk], 0);
  end
  else begin
    if Length(edNewPass.Text)<frmUserLib.usrMinPassLength then
    begin
      //If the new password is not long enough, display message
      edNewPass.SetFocus;
      MessageDlg(Format(SEC_MIN_PASSWORD_LENGTH, [IntToStr(frmUserLib.usrMinPassLength)]), mtInformation, [mbOk], 0);
    end
    else begin
      if edOldPass.Text=edNewPass.Text then
      begin
        //If the old password is the same as the new password, display message
        edNewPass.SetFocus;
        MessageDlg(SEC_PASSWORD_MUST_DIFFERENT, mtInformation, [mbOk], 0);
      end
      else begin
        if (UpperCase(edNewPass.Text)=UpperCase(FUserName)) or
           (UpperCase(edNewPass.Text)='PASSWORD') or
           (UpperCase(edNewPass.Text)='KATA KUNCI') or
           (UpperCase(edNewPass.Text)='KATAKUNCI') or
           (UpperCase(edNewPass.Text)='KATA SANDI') or
           (UpperCase(edNewPass.Text)='KATASANDI') then begin
          edNewPass.SetFocus;
          MessageDlg(SEC_PASSWORD_MUST_NOT_COMMON, mtInformation, [mbOk], 0);
        end
        else begin
          if not IncludeSpecialCharacter(edNewPass.Text) then
          begin
            edNewPass.SetFocus;
            MessageDlg(SEC_PASSWORD_MUST_CONTAIN_SPECIAL_CHARACTER, mtInformation, [mbOk], 0);
          end
          else
          begin
            with adoqChange do
            begin
              //Query for UserID in the Users table
              Close;
              SQL.Clear;
              SQL.Add('SELECT * FROM ' + DB_TABLE_USER + ' WHERE user_name='''+ frmUserLib.encUser(FUserName) +'''');
              Open;
              try
                if RecordCount=0 then
                begin
                  //If UserID is not found, display message
                  edOldPass.SetFocus;
                  MessageDlg(Format(SEC_USER_NOT_FOUND, [FUserName]), mtInformation, [mbOk], 0);
                end
                else begin
                  if Trim(FieldByName('user_password').AsString) <> frmUserLib.encByKey(edOldPass.Text, FUserName) then
                  begin
                    //If the oldpassword do not matched the user password, display message
                    edOldPass.SetFocus;
                    frmUserLib.usrLogWrite(FUserName, MDL_Login, INFO_CHANGE_PASSWORD + ' : ' + SEC_INVALID_PASSWORD);
                    MessageDlg(SEC_INVALID_PASSWORD, mtInformation, [mbOk], 0);
                  end
                  else begin
                    //Check for password whether it is in password list
                    strEncPassword := frmUserLib.encByKey(String(edNewPass.Text), FUserName);
                    adoqList.Close;
                    adoqList.SQL.Clear;
                    adoqList.SQL.Add('SELECT * FROM ' + DB_TABLE_PASSWORD_LIST +
                      ' WHERE user_name=''' + frmUserLib.encUser(FUserName) + ''' order by pl_sequence asc');
                    adoqList.Open;
                    try
                      intSeq := adoqList.RecordCount;
                      if adoqList.Locate('pl_password', strEncPassword, []) then
                      begin
                        edNewPass.SetFocus;
                        MessageDlg(SEC_PASSWORD_IS_IN_LIST, mtInformation, [mbOk], 0);
                      end
                      else begin
                        if adoqList.RecordCount >= frmUserLib.usrPasswordHistory then
                        begin
                          adoqList.Close;
                          adoqList.SQL.Clear;
                          adoqList.SQL.Add('DELETE FROM ' + DB_TABLE_PASSWORD_LIST +
                           ' WHERE user_name=''' + frmUserLib.encUser(FUserName) + ''' AND pl_sequence=1');
                          adoqList.ExecSQL;

                          adoqList.Close;
                          adoqList.SQL.Clear;
                          adoqList.SQL.Add('Update ' + DB_TABLE_PASSWORD_LIST +
                           ' set pl_sequence=pl_sequence-1 where user_name=''' + frmUserLib.encUser(FUserName) + '''');
                          adoqList.ExecSQL;
                      end;
                      adoqList.Close;
                      adoqList.SQL.Clear;
                      adoqList.SQL.Add('Update ' + DB_TABLE_USER + ' SET  user_password=''' + strEncPassword + '''');
                      if GlobalVarForm.DBType = 1 then
                      	adoqList.SQL.Add(', user_password_date=#' + FormatDateTime('mm/dd/yyyy', Date) + '# ')
                      else
                      	adoqList.SQL.Add(', user_password_date=''' + FormatDateTime('mm/dd/yyyy', Date) + ''' ');
                      adoqList.SQL.Add(' where user_name=''' + frmUserLib.encUser(FUserName) + '''');
                      adoqList.ExecSQL;

                      adoqList.Close;
                      adoqList.SQL.Clear;
                      adoqList.SQL.Add('Insert Into ' + DB_TABLE_PASSWORD_LIST +
                       ' (user_name, pl_sequence, pl_password) values(''' +
                       frmUserLib.encUser(FUserName) + ''', ' + IntToStr(intSeq + 1) + ', ''' + strEncPassword + ''')');
                      adoqList.ExecSQL;

                      frmUserLib.usrLogWrite(FUserName, MDL_Login, INFO_CHANGE_PASSWORD + ' : ' + SEC_PASSWORD_CHANGED);
                      MessageDlg(SEC_PASSWORD_CHANGED,mtInformation,[mbOk],0);
                      ModalResult:=mrOK;
                      end;
                    finally
                      adoqList.Close;
                    end;
                  end;
                end;
              finally
                Close;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

end;

procedure TfrmChangePassword.FormCreate(Sender: TObject);
begin
	if adoqChange.Active then
  	adoqChange.Close;
  adoqChange.Connection := GlobalVarDM.MainADOConn;

  if adoqList.Active then
  	adoqList.Close;
  adoqList.Connection := GlobalVarDM.MainADOConn;
end;

procedure TfrmChangePassword.btnCancelClick(Sender: TObject);
begin
	Close;
end;

end.
