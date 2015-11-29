unit fLogon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Buttons, acPNG,
  JvExExtCtrls, JvPanel, 
  
  jpeg, JvFormWallpaper, JvImage, JvComponentBase, JvAnimTitle,
  JvAppAnimatedIcon, JvBevel, XPMan;

type
  TfrmLogin = class(TForm)
    qryLogon: TADOQuery;
    qryCheck: TADOQuery;
    Image1: TImage;
    Label1: TLabel;
    edName: TEdit;
    edPass: TEdit;
    Label2: TLabel;
    btnLogon: TBitBtn;
    btnCancel: TBitBtn;
    XPManifest1: TXPManifest;
    procedure btnLogonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FCaption : String;
    FstrUserName: string;
    FGroupName: string;
    FstrUserFullName: string;
    FstrCurrentTerminal: string;
    FintBadLogin: Integer;

    procedure DrawCaption;
    procedure WMNCPaint(var Msg : TWMNCPaint); message WM_NCPaint;
    procedure WMNCActivate(var Msg : TWMNCActivate); message WM_NCACTIVATE;
    procedure WMSetText(var Msg : TWMSetText); message WM_SETTEXT;
  public
    { Public declarations }
    property UserName: string read FstrUserName;
    property GroupName: string read FGroupName;
    property UserFullName: string read FstrUserFullName;
    property CurrentTerminal: string read FstrCurrentTerminal;
    property BadLogin: Integer read FintBadLogin;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses fUMCResStr, fConst, fMain, fChangePassword, fGlobalVar,
  fGlobalVarDM, fUserLib;

{$R *.dfm}

procedure SetFontToCaptionFont(fFont: TFont);
var
  NCM : TNONCLIENTMETRICS;
  NewFHnd : longint;
begin
  NCM.cbSize := SizeOf(TNONCLIENTMETRICS);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NCM, 0) then
  begin
    {set Font to the retrieved font}
    NewFHnd := CreateFontIndirect(NCM.lfCaptionFont);
    if (NewFHnd <> 0) then
    	fFont.Handle := NewFHnd;
  end;
end;

procedure TfrmLogin.btnLogonClick(Sender: TObject);
var
  strComputerName: array[0..128] of char;
  nsize: Cardinal;
begin

  //if us_name is blank
  if edName.Text='' then
  begin
    //display message
    edName.SetFocus;
    MessageDlg(ERR_INPUT_USER_ID, mtInformation, [mbOk], 0);
  end
  else begin
    //if us_name is filled
    with qryLogon do
    begin
      //query users table for us_name
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + DB_TABLE_USER + ' WHERE user_name=''' + frmUserLib.encUser(edName.Text) + '''');
      Open;
      try
        if RecordCount=0 then
        begin
          //if us_name is not found in table, display message
          edName.SetFocus;
           MessageDlg(SEC_INVALID_PASSWORD, mtInformation, [mbOk], 0);
        end
        else begin
          if (FieldByName('user_bad_login').AsInteger>=MAXIMUM_BAD_LOGIN) and (frmUserLib.usrUseMaxLogon) then
          begin
            //if there has been maximum invalid login attempted, display message
            edName.SetFocus;
            frmUserLib.usrLogWrite(edName.Text, MDL_Login, INFO_LOGIN + SEC_MAXIMUM_BAD_LOGIN);
            MessageDlg(SEC_MAXIMUM_BAD_LOGIN, mtInformation, [mbOk],0);
          end
          else begin
            if FieldByName('user_active').AsBoolean<>Boolean(US_INACTIVE) then
            begin
              //if user is active, display message
              edName.SetFocus;
              frmUserLib.usrLogWrite(edName.Text, MDL_Login, INFO_LOGIN +' : ' + Format(SEC_ALREADY_LOGIN, [edName.Text]));
              MessageDlg(Format(SEC_ALREADY_LOGIN, [edName.Text]), mtInformation, [mbOk],0);
            end
            else begin
              if FieldByName('user_status').AsInteger<>US_VALIDATED then
              begin
                if (FieldByName('user_status').AsInteger=US_BLOCKED) and (frmUserLib.usrUseMaxLogon) then
                begin
                  //if user is not authorized, display message
                  edName.SetFocus;
                  frmUserLib.usrLogWrite(edName.Text, MDL_Login, INFO_LOGIN + ' : ' + SEC_US_BLOCKED);
                  MessageDlg(SEC_US_BLOCKED, mtInformation, [mbOk], 0);
                end
                else begin
                  //if user is not authorized, display message
                  edName.SetFocus;
                  frmUserLib.usrLogWrite(edName.Text, MDL_Login, INFO_LOGIN + ' : ' + SEC_NOT_AUTHORIZED);
                  MessageDlg(SEC_NOT_AUTHORIZED, mtInformation, [mbOk], 0);
                end;
              end
              else begin
                if Trim(FieldByName('user_password').AsString)<>frmUserLib.encByKey(edPass.Text, edName.Text) then
                begin
                  //if password is not matched, increase the BadLogin field
                  if (frmUserLib.usrUseMaxLogon) then
                  begin
                    Edit;
                    FieldByName('user_bad_login').AsInteger := FieldByName('user_bad_login').AsInteger + 1;
                    //If BadLogin is equal or greater the the assigned maximum number, disable user
                    if (FieldByName('user_bad_login').AsInteger>=MAXIMUM_BAD_LOGIN) then
                      FieldByName('user_status').AsInteger := US_BLOCKED;
                    Post;
                  end;
                  edName.SetFocus;
                  frmUserLib.usrLogWrite(edName.Text, MDL_Login, INFO_LOGIN +  ' : ' + SEC_INVALID_PASSWORD);
                  //MessageDlg(SEC_INVALID_PASSWORD, mtInformation, [mbOk], 0);
                  MessageDlg(Format(INFO_BAD_LOGIN, [FieldByName('user_bad_login').AsInteger]), mtInformation, [mbOk], 0);
                end
                else begin
                  if (FieldByName('user_password_date').AsDateTime>Date) or
                    ((FieldByName('user_password_date').AsDateTime+frmUserLib.usrPasswordExpire)<Date) then
                  begin
                    //If PasswordDate is not in the expiration date interval, ask user to change password
                    edName.SetFocus;
                    MessageDlg(SEC_PASSWORD_EXPIRED, mtInformation, [mbOk], 0);
                    with frmChangePassword do
                    begin
                      UserName := Self.edName.Text;
                      //Display ChangePassword form
                      if ShowModal=mrOK then
                      begin
                        //if user change his password, ask to relogin
                        Self.edPass.Text := '';
                        Self.edPass.SetFocus;
                        MessageDlg(SEC_ASK_RELOGIN, mtInformation, [mbOk], 0);
                      end
                      else begin
                        //if user does not change his password, display message
                        Self.edPass.Text:='';
                        Self.edName.SetFocus;
                        MessageDlg(SEC_MUST_CHANGE_PASSWORD, mtInformation, [mbOk], 0);
                      end;
                    end;
                  end
                  else begin
                    with qryCheck do
                    begin
                      //check for user groups' status
                      Close;
                      SQL.Clear;
                      SQL.Add('SELECT user_name FROM ' + DB_TABLE_USER + ' u, ' +
                        DB_TABLE_USER_GROUP + ' g WHERE u.user_name=''' + frmUserLib.encUser(edName.Text) + '''');
                      SQL.Add('AND g.group_name=u.group_name AND g.group_status<>1');
                      Open;
                      try
                        if RecordCount>0 then
                        begin
                          //if there is a user's group has not been validated, display message
                          edName.SetFocus;
                          frmUserLib.usrLogWrite(edName.Text, MDL_Login, INFO_LOGIN+' : '+ SEC_GROUP_NOT_AUTHORIZED);
                          MessageDlg(SEC_GROUP_NOT_AUTHORIZED, mtInformation, [mbOk], 0);
                        end
                        else begin
                          //If everything OK
                          with qryLogon do
                          begin
                            //Note the BadLogin count
                            FintBadLogin := FieldByName('user_bad_login').AsInteger;
                            Edit;
                            //Set the user active
                            //FieldByName('user_active').AsBoolean := Boolean(US_ACTIVE);
                            //Clear the BadLogin field
                            FieldByName('user_bad_Login').AsInteger := 0;
                            nsize := 128;
                            GetComputerName(strComputerName, nsize);
                            FstrCurrentTerminal := string(strComputerName);
                            Post;

                            FstrUserName := frmUserLib.decUser(Trim(FieldByName('user_name').AsString));
                            FGroupName := frmUserLib.decGroup(FieldByName('group_name').AsString);
                            FstrUserFullName := frmUserLib.decUser(FieldByName('user_full_name').AsString);

                            frmUserLib.usrLogWrite(edName.Text, MDL_Login, INFO_LOGIN+' : ' + Format(SEC_LOGIN, [FstrCurrentTerminal]));
                            ModalResult := mrOK;
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
      finally
        Close;
      end;
    end;
  end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
	bgfile : String;
begin
  //FCaption := Caption; //store the caption
  //Caption := ' '; //set caption to ' ' (hide it)

	//pnlLogin.Left := ((Screen.Width-frmLogin.Width)  div 2) + (pnlLogin.Width div 2) - ((pnlLogin.Width div 2) div 2);
  //pnlLogin.Top  := 15;
  //pnlLogin.Top:=(Screen.Height-Height) div 2;

  (*
  bgfile := ExtractFilePath(Application.ExeName) + 'bgLogin.bmp';
  if FileExists(bgFile) then
  	imgBack.Bitmap.LoadFromFile(bgFile);
  *)
	if qryLogon.Active then
  	qryLogon.Close;
  qryLogon.Connection := GlobalVarDM.MainADOConn;

  if qryCheck.Active then
  	qryCheck.Close;
  qryCheck.Connection := GlobalVarDM.MainADOConn;
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
	Application.Terminate;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
	edPass.Clear;
  edName.SetFocus;
end;

procedure TfrmLogin.DrawCaption;
var
  yFrame,
  ySize : Integer;
  r : TRect;
begin
  //Height of Sizeable Frame
  yFrame := GetSystemMetrics(SM_CYFRAME);

  //Height of Caption Buttons
  ySize := GetSystemMetrics(SM_CYSIZE);

  //Get the handle to canvas using Form's device context
  Canvas.Handle := GetWindowDC(Self.Handle);
  try
    SetFontToCaptionFont(Canvas.Font);
    Canvas.Font.Color := clWhite;
    Canvas.Brush.Style := bsClear;

    r := Rect(0, yFrame, Width, yFrame +ySize);
    DrawText(Canvas.Handle, PChar(FCaption), -1, r,
    DT_SINGLELINE OR DT_CENTER OR DT_VCENTER OR DT_NOPREFIX);
  finally
    //Get rid of the device context and set the canvas handle to default
    ReleaseDC(Self.Handle, Canvas.Handle);
    Canvas.Handle := 0;
  end;
end;

//This traps the default form painting
procedure TfrmLogin.WMNCPaint(var Msg : TWMNCPaint);
begin
	inherited;
	DrawCaption;
end;

//This traps form activation
procedure TfrmLogin.WMNCActivate(var Msg : TWMNCActivate);
begin
	inherited;
	DrawCaption;
end;

//This traps any text being sent to the window
procedure TfrmLogin.WMSetText(var Msg : TWMSetText);
begin
	inherited;
	DrawCaption;
end;

//Have to perform an NC_ACTIVATE when the form is resized
//so that the caption bar and button are redrawn. This is
//necessary because Win95/NT4+ draw all buttons relative to the
//right side of a window.

procedure TfrmLogin.FormResize(Sender: TObject);
begin
	//Force a redraw of caption bar if form is resized
	//Perform(WM_NCACTIVATE, Word(Active), 0);
//	frmLogin.Paint;
end;

procedure TfrmLogin.FormPaint(Sender: TObject);
(*var
  LabelHeight, LabelWidth, LabelTop: Integer;
  caption_height, border3d_y, button_width, border_thickness: Integer;
  MyCanvas: TCanvas;
  CaptionBarRect: TRect;
*)
begin
  (*
  CaptionBarRect := Rect(0, 0, 0, 0);
  MyCanvas := TCanvas.Create;
  MyCanvas.Handle := GetWindowDC(frmLogin.Handle);
  border3d_y := GetSystemMetrics(SM_CYEDGE);
  button_width := GetSystemMetrics(SM_CXSIZE);
  border_thickness := GetSystemMetrics(SM_CYSIZEFRAME);
  caption_height := GetSystemMetrics(SM_CYCAPTION);
  LabelWidth := frmLogin.Canvas.TextWidth(frmLogin.Caption);
  LabelHeight := frmLogin.Canvas.TextHeight(frmLogin.Caption);
  LabelTop := LabelHeight - (caption_height div 2);
  CaptionBarRect.Left := border_thickness + border3d_y + button_width;
  CaptionBarRect.Right := frmLogin.Width - (border_thickness + border3d_y)
		- (button_width * 4);
  CaptionBarRect.Top := border_thickness + border3d_y;
  CaptionBarRect.Bottom := caption_height;
  if frmLogin.Active then
    MyCanvas.Brush.Color := clActiveCaption
  else
    MyCanvas.Brush.Color := clInActiveCaption;
  MyCanvas.Brush.Style := bsSolid;
  MyCanvas.FillRect(CaptionBarRect);
  MyCanvas.Brush.Style := bsClear;
  MyCanvas.Font.Color := clCaptionText;
  MyCanvas.Font.Name := 'MS Sans Serif';
  MyCanvas.Font.Style := MyCanvas.Font.Style + [fsBold];
  DrawText(MyCanvas.Handle, PChar(' ' + frmLogin.Caption), Length(frmLogin.Caption) + 1,
    CaptionBarRect, DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  MyCanvas.Free;
  *)
end;

procedure TfrmLogin.FormDeactivate(Sender: TObject);
begin
//	frmLogin.Paint;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
//	frmLogin.Paint;
end;

end.
