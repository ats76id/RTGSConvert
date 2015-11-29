unit futils;

interface

uses Windows, SysUtils, Classes, Controls, ComObj, Dialogs, Variants, DateUtils,Forms,
     StdCtrls, Buttons, ExtCtrls, Math, Graphics;
const
	defListDelimeter = ';';
  LongMonthNames_ID : array[1..12] of string =
    ('Januari','Februari','Maret','April','Mei','Juni',
     'Juli','Agustus','September','Oktober','November','Desember');

type
  SetOfChar = set of char;

function DeInitLog: Integer;
function GenDailyDB: string;
function GenDailyDS(TableName: string): string;
function GenDailyDSWithDate(ADate: TDateTime; TableName: string): string;
function GenMainDS(TableName: string): string;
function GenDailyInwardDS(TableName:string):string;
function GetItem(str, sep: string; position: integer): string;
function IndexOf(arr: array of string; s: string): integer;
function InitLog(strFile: String): Integer;
function WinExec32(FileName, Params, WorkDir: String; Visibility : integer): longint;
function WinExecAndWait32(FileName, Params, WorkDir: String; Visibility: integer): longint;
function SaveLog(strContent, strUser: String): Integer;
function StringListToVariant(aStrList : TStrings): OleVariant;
function StripAmpersand(s:string): string;
function StreamToVariant(Stream: TStream): OleVariant;
procedure VariantToStream(const Data: OleVariant; Stream: TStream);
procedure VariantToStringList(const Data: OleVariant; aStrList: TStrings);
function ShowLog: Integer;
function MakeFixedNumber(Source:string; TargetLength:integer): string;
function MakeFixedString(Source: string; TargetLength: integer): string;
function MakeFixedStringRight(Source: string; TargetLength: integer): string;

function PaddedSpace(s: string; n: integer): string;
function IsBitOn(Value: Integer; Bit: Byte): Boolean;
function TurnBitOn(Value: Integer; Bit: Byte): Integer;
function TurnBitOff(Value: Integer; Bit: Byte): Integer;
function removeDuplicateSpace(const strString: String): String;
function isValidCharacter(const strChar: String): Boolean;
function convertNumericToText2(const strString : String; intLength : Integer; blnDecimal : Boolean = False) : String;
function StrToDateTimeDef_EN_US(const Value: string; DefValue: TDateTime): TDateTime;
function PaddedZero(s:string;n:byte):string;
function RemoveInvalidChar(const strValue: String):string;
function LastDayCurrMon(intMonthOf, intYearOf:Word): TDate;
function MessageDlgEx(Caption, Msg: string; AType: TMsgDlgType;
                      AButtons: array of string;
                      DefBtn, CanBtn: Integer; iWidth:integer=450;bCourier:boolean=false): Word;
Procedure ShowMessageEx(Msg:string);
function MessageDlgExS(Msg: string; AType: TMsgDlgType;
                      AButtons: array of string; CanBtn: Integer): Word;
function RemoveZero(s: string): string;
function CheckForSemicolon(s: string): string;
function removeChar(chr,str:string):string;
function insertSpaceLeft(str:string; fldLength:integer): string;
function insertSpace(c: integer): string;
function insertSpaceRight(str: string; fldLength: integer): string;

function RemoveSpaces(s: string): string;
function CleanString(s: string; sc: setofchar): string;
function CheckString(s: string): Boolean;
function GetNextString(xstring:string; strToFind:string; CharUntil:char):string;
function ExpandFile(FileName:string):string;
function compactDB(strConn:string):Boolean;
function ExecDLL(ApplicationHandle:THandle;fFileName,fprocname,fparam:string): integer;
function IsAlpha(Value: Char): Boolean;
function IsAlpha2(Value: Char): Boolean;
function IsNumeric(Value: Char): Boolean;
function isAllNumeric(const s: string): boolean;
function isAllAlpha(Value:String):Boolean;
function IsAlphaNumeric(Value: Char): Boolean;
function IsAlphaNumeric2(Value: Char): Boolean;
function isAllAlphaNumeric(Value:String):Boolean;
function Holiday(Adate: TDate): Boolean;
function GetNextDate(crnDate:TDateTime):TDateTime;
function IsEmptyString(strValue:string):Boolean;
procedure SetMessage(var strMessage:string; Value:string);
function RemoveLeadingZeroes(Source:string): string;
function GetAlphaNumeric(Value:String):String;
function GetAlphaNumeric2(Value:String):String;
function removeNonNumeric(text:string):string;
function IsValidAccountNumeric(vAccount:string):Boolean;
function IsValidAccountAlphaNumeric(vAccount:string):Boolean;
function StraightenText(Source:string):string;



var
	ResIDs: array[TMsgDlgType] of PChar = (IDI_EXCLAMATION , IDI_HAND  ,
    IDI_ASTERISK  , IDI_QUESTION, nil);

  utilsDailyDBName,
  utilsDailyInwardDBName,
  utilsDBOwnerName,
  utilsMainDBName,
  utilsDailyInwardDebetDBName,
  utilMonthlyRptDBName       : String;
  utilsTrxDate,
  utilsInwardTrxDate    : TDate;
  TheLog                : OleVariant;

implementation

uses fGlobalVar;

function StraightenText(Source:string):string;
var
  Idx:integer;
  BeforeIsSpace:boolean;
begin
  Result:='';
  BeforeIsSpace:=True;
  Source:=Trim(Source);
  for Idx:=1 to Length(Source) do
  begin
    if Source[Idx]=' ' then
    begin
      if not BeforeIsSpace then
      begin
        BeforeIsSpace:=True;
        Result:=Result+' ';
      end;
    end
    else
    begin
      Result:=Result+Source[Idx];
      if BeforeIsSpace then BeforeIsSpace:=False;
    end;
  end;
end;

function convertNumericToText2(const strString: String;
  intLength : Integer; blnDecimal: Boolean = False): String;
var
  i: Integer;
begin
  Result := strString;
  if blnDecimal then Result := IntToStr(Round(StrToFloat(Result)*100));
  for i:=Length(Result) to intLength-1 do
    Result := ' ' + Result;
end;

function removeDuplicateSpace(const strString: String): String;
var
  blnValid, blnFirst : Boolean;
  i                  : Integer;
  strResult          : String;
begin
  blnFirst := True;
  for i:=1 to Length(strString) do
  begin
    if strString[i]='"' then Continue;

    // Is character is supposed to be taken?
    if blnFirst then
    begin
      blnValid := True;
      blnFirst := False;
    end
    else
      blnValid := isValidCharacter(Copy(strString,i-1,1));
    blnValid := blnValid or isValidCharacter(Copy(strString,i,1));

    // Take character if it is
    if blnValid then
      strResult := strResult + Copy(strString,i,1);
  end;
  Result := strResult;
end;

function isValidCharacter(const strChar: String): Boolean;
begin
  if strChar = ' ' then Result := False
  else if strChar = ',' then Result := False
  else if strChar = '.' then Result := False
  else if strChar = ';' then Result := False
  else if strChar = '/' then Result := False
  else if strChar = '-' then Result := False
  else if strChar = '_' then Result := False
  else if strChar = ':' then Result := False
  else if strChar = '"' then Result := False
  else if strChar = '''' then Result := False
  else Result := True;
end;

function IndexOf(arr:array of string;s:string):integer;
var
  i:integer;
begin
  Result:=-1;
  for i:=Low(arr) to High(arr) do begin
    if arr[i]=s then begin
      Result:=i;
      exit;
    end;
  end;
end;

procedure VariantToStream(const Data: OleVariant; Stream:TStream);
var
  p:pointer;
begin
  p:=VarArrayLock(Data);
  try
    Stream.Write(p^, VarArrayHighBound(Data,1)+1);
  finally
    VarArrayUnlock(Data);
  end;
end;

function StreamToVariant(Stream:TStream): OleVariant;
var
  p:pointer;
begin
  Result:=VarArrayCreate([0, Stream.Size - 1], varByte);
  p:=VarArrayLock(Result);
  try
    Stream.Position:=0;
    Stream.Read(p^,Stream.Size);
  finally
    VarArrayUnlock(Result);
  end;
end;

function StringListToVariant(aStrList : TStrings):OleVariant;
var
  hStream:TStream;
begin
  hStream:=TMemoryStream.Create;
  try
    aStrList.SaveToStream(hStream);
    hStream.Seek(0,soFromBeginning);
    result:=StreamToVariant(hStream);
  finally
    hStream.Free;
  end;
end;

procedure VariantToStringList(const Data: OleVariant; aStrList: TStrings);
var
  hStream:TStream;
begin
  hStream:=TMemoryStream.Create;
  try
    VariantToStream(Data,hStream);
    hStream.Seek(0,soFromBeginning);
    aStrList.LoadFromStream(hStream);
  finally
    hStream.Free;
  end;
end;

function ShowLog: Integer;
begin
  Result := -1;
  if not(VarIsEmpty(TheLog) or VarIsNull(TheLog)) then
  begin
    theLog.ReportPageLength:=GlobalVarForm.SystemReportLength;
    TheLog.DlgShowLog;
    Result := 0;
  end;
end;

function MakeFixedNumber(Source:string; TargetLength:integer): string;
begin
  Result := Source;
  while Length(Result)<TargetLength do
    Result:='0'+Result;
  Result:=Copy(Result, Length(Result)-TargetLength+1, TargetLength);
end;

function MakeFixedString(Source: string; TargetLength: integer): string;
begin
  Result := Source;
  while Length(Result)<TargetLength do
    Result:=Result+' ';
  Result:=Copy(Result, 1, TargetLength);
end;

function MakeFixedStringRight(Source: string; TargetLength: integer): string;
begin
  Result := Source;
  while Length(Result)<TargetLength do
    Result:=' '+Result;
  Result:=Copy(Result, Length(Result)-TargetLength+1, TargetLength);
end;

function StripAmpersand(s:string):string;
var
  i:integer;
begin
  i:=1; Result:='';
  while i<=Length(s) do begin
    if s[i]<>'&' then Result:=Result+s[i]
    else if (i<Length(s)) and (s[i+1]='&') then begin
      Result:=Result+s[i];
      inc(i);
    end;
    inc(i);
  end;
end;

function WinExecAndWait32(FileName, Params, WorkDir:String; Visibility : integer):longint;
var
  zAppName:PChar;
  zCurDir:PChar;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
  zRes:DWORD;
begin
  zAppName:=StrAlloc(512);
  StrPCopy(zAppName,FileName+' '+Params);
  if Trim(WorkDir)<>'' then begin
    zCurDir:=StrAlloc(512);
    StrPCopy(zCurDir,WorkDir);
  end
  else zCurDir:=nil;
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not Windows.CreateProcess(nil,
    zAppName,                      { pointer to command line string }
    nil,                           { pointer to process security attributes }
    nil,                           { pointer to thread security attributes }
    false,                         { handle inheritance flag }
    CREATE_NEW_CONSOLE or          { creation flags }
    NORMAL_PRIORITY_CLASS,
    nil,                           { pointer to new environment block }
    zCurDir,                       { pointer to current directory name }
    StartupInfo,                   { pointer to STARTUPINFO }
    ProcessInfo) then              { pointer to PROCESS_INF }
      Result := -1
  else begin
    Windows.WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
    Windows.GetExitCodeProcess(ProcessInfo.hProcess,zRes);
    Result:=zRes;
  end;
  if zCurDir<>nil then StrDispose(zCurDir);
  StrDispose(zAppName);
end;

function WinExec32(FileName, Params, WorkDir:String; Visibility : integer):longint;
var
  zAppName:PChar;
  zCurDir:PChar;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin
  zAppName:=StrAlloc(512);
  StrPCopy(zAppName,FileName+' '+Params);
  if Trim(WorkDir)<>'' then begin
    zCurDir:=StrAlloc(512);
    StrPCopy(zCurDir,WorkDir);
  end
  else zCurDir:=nil;
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not Windows.CreateProcess(nil,
    zAppName,                      { pointer to command line string }
    nil,                           { pointer to process security attributes }
    nil,                           { pointer to thread security attributes }
    false,                         { handle inheritance flag }
    CREATE_NEW_CONSOLE or          { creation flags }
    NORMAL_PRIORITY_CLASS,
    nil,                           { pointer to new environment block }
    zCurDir,                       { pointer to current directory name }
    StartupInfo,                   { pointer to STARTUPINFO }
    ProcessInfo) then              { pointer to PROCESS_INF }
      Result := -1
  else begin
    Result:=0;
  end;
  if zCurDir<>nil then StrDispose(zCurDir);
  StrDispose(zAppName);
end;

function GetItem(str,sep:string;position:integer):string;
var
  tempstr:string;
begin
  tempstr:=str;
  while position>0 do begin
    if Pos(sep,tempstr)>0 then
      tempstr:=Copy(tempstr,Pos(sep,tempstr)+1,Length(tempstr))
    else tempstr:='';
    dec(position);
  end;
  if Pos(sep,tempstr)>0 then
    tempstr:=Copy(tempstr,1,Pos(sep,tempstr)-1);
  Result:=tempstr;
end;

function GenMainDS(TableName:string):string;
begin
  Result:=utilsMainDBName+'.'+utilsDBOwnerName+'.'+TableName;
end;

function GenDailyDB:string;
begin
  Result:=utilsDailyDBName+FormatDateTime('YYYYMMDD',utilsTrxDate);
end;

function GenDailyDS(TableName:string):string;
begin
  Result:=utilsDailyDBName+FormatDateTime('YYYYMMDD',utilsTrxDate)+'.'+utilsDBOwnerName+'.'+TableName;
end;

function GenDailyDSWithDate(ADate: TDateTime; TableName: string): string;
begin
  Result:=utilsDailyDBName+FormatDateTime('YYYYMMDD',ADate)+'.'+utilsDBOwnerName+'.'+TableName;
end;

function GenDailyInwardDS(TableName:string):string;
begin
  Result:=utilsDailyInwardDBName+FormatDateTime('YYYYMMDD',utilsInwardTrxDate)+'.'+utilsDBOwnerName+'.'+TableName;
end;

function SaveLog(strContent, strUser: String): Integer;
begin
  Result := -1;
  if not(VarIsEmpty(TheLog) or VarIsNull(TheLog)) then
  begin
    TheLog.Write(strUser, strContent);
    Result := 0;
  end;
end;

function InitLog(strFile: String): Integer;
begin
  Result := -1;
  TheLog := CreateOleObject('log32_xml.TLogFile');
  TheLog.FileName := strFile;
  //theLog.Filename := strLogPath + 'CIP' + FormatDateTime('YYYYMMDD',Now)+'.log';
  Result := 0;
end;

function DeInitLog: Integer;
begin
  Result := -1;
  try
    TheLog.Close;
    TheLog := Unassigned;
    Result := 0;
  except
  end;
end;

function PaddedSpace(s: string; n: integer): string;
begin
  Result := Copy(s, 1, n);
  while Length(Result) < n do
    Result := Result + ' ';
end;

function PaddedZero(s:string;n:byte):string;
var
  i,c:byte;
begin
  Result := s;
  if Length(Trim(s))<n then begin
    c:=n-length(s);
    Result:='';
    for i:=1 to c do Result:=Result+'0';
    Result:=Result+s;
  end;
end;

function IsBitOn(Value: Integer; Bit: Byte): Boolean;
begin
  Result := (Value and (1 shl Bit)) <> 0;
end;

function TurnBitOn(Value: Integer; Bit: Byte): Integer;
begin
  Result := Value or (1 shl Bit);
end;

function TurnBitOff(Value: Integer; Bit: Byte): Integer;
begin
  Result := Value and not (1 shl Bit);
end;

function StrToDateTimeDef_EN_US(const Value: string; DefValue: TDateTime): TDateTime;
const
  LOCALE_ENGLISH_US = 1033;
var
  fs: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_ENGLISH_US, fs);
  Result := StrToDateTimeDef(Value, DefValue, fs);
end;

function LastDayCurrMon(intMonthOf, intYearOf:Word): TDate;
var
	dt:TDateTime;
begin
	dt := EncodeDate(intYearOf, intMonthOf, 1);
	result := EncodeDate(intYearOf, intMonthOf, DaysInMonth(dt)) ;
end;


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//function for replacing MessageDlg deals with the missing button on Windows 7/Vista issues
//MessageDlgEx(caption title,body message,message type (as messagedlg), button caption (in array of strings), default button, canbutton (as messagedlg) ):word;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function MessageDlgEx(Caption, Msg: string; AType: TMsgDlgType;
                      AButtons: array of string;
                      DefBtn, CanBtn: Integer; iWidth:integer=450;bCourier:boolean=false): Word;
const
  icMin=50;
  icButtonHeight=25;
  icInterspace=10;
  icButtonResultStart=100;
  icFirstButtonReturnValue=1;
var
  I, iButtonWidth, iAllButtonsWidth,
  iIconWidth,iIconHeight:Integer;
  LabelText:String;
  Frm: TForm;
  Lbl: TLabel;
  Btn: TBitBtn;
  Glyph: TImage;
  FIcon: TIcon;
  Rect:TRect;
  Caption_ca:Array[0..2000] of Char;
begin
  { Create the form.}
  Frm := TForm.Create(Application);
  Frm.BorderStyle := bsDialog;
  Frm.BorderIcons := [biSystemMenu];
  Frm.FormStyle := fsStayOnTop;
  Frm.Height := 185;
  Frm.Width := iWidth;
  Frm.Position := poScreenCenter;
  Frm.Caption := Caption;
  Frm.Font.Name:='MS Sans Serif';
  Frm.Font.Style:=[];
  Frm.Scaled:=false;

  //IDI_QUESTION
  if ResIDs[AType] <> nil then
    begin
      Glyph := TImage.Create(Frm);
      Glyph.Name := 'Image';
      Glyph.Parent := Frm;

      FIcon := TIcon.Create;
      try
        FIcon.Handle := LoadIcon(FIcon.Handle, ResIDs[AType]);
        //FIcon.Handle := LoadIcon(HInstance, PChar(IDI_QUESTION));
        iIconWidth:=FIcon.Width;
        iIconHeight:=FIcon.Height;
        Glyph.Picture.Graphic := FIcon;
        Glyph.BoundsRect := Bounds(icInterspace, icInterspace, FIcon.Width, FIcon.Height);
      finally
        FIcon.Free;
      end;
    end
    else
    begin
      iIconWidth:=0;
      iIconHeight:=0;
    end;

  { Loop through buttons to determine the longest caption. }
  iButtonWidth := 0;
  for I := 0 to High(AButtons) do
    iButtonWidth := Max(iButtonWidth, frm.Canvas.TextWidth(AButtons[I]));

  { Add padding for the button's caption}
  iButtonWidth := iButtonWidth + 18;

  {assert a minimum button width}
  If iButtonWidth<icMin Then
    iButtonWidth:=icMin;

  { Determine space required for all buttons}
  iAllButtonsWidth := iButtonWidth * (High(AButtons) + 1);

  { Each button has padding on each side}
  iAllButtonsWidth := iAllButtonsWidth +icInterspace*High(AButtons);

  { The form has to be at least as wide as the buttons with space on each side}
  if iAllButtonsWidth+icInterspace*2 > Frm.Width then
    Frm.Width := iAllButtonsWidth+icInterspace*2;

  if Length(Msg)>sizeof(Caption_ca) then
    SetLength(Msg,sizeof(Caption_ca));

  { Create the message control}
  Lbl := TLabel.Create(Frm);
  Lbl.AutoSize := False;
  Lbl.Left := icInterspace*2+iIconWidth;
  Lbl.Top := icInterspace;
  Lbl.Height := 200;
  Lbl.Width := Frm.ClientWidth - icInterspace*3-iIconWidth;
  Lbl.WordWrap := True;
  Lbl.Caption := Msg;
  Lbl.Parent := Frm;

  if bCourier then
    lbl.Font.Name:='Courier New';

  Rect := Lbl.ClientRect;
  LabelText:=Lbl.Caption;
  StrPCopy(Caption_ca, LabelText);

  Lbl.Height:=DrawText(Lbl.Canvas.Handle,
                       Caption_ca,
                       Length(LabelText),
                       Rect,
                       DT_CalcRect or DT_ExpandTabs or DT_WordBreak Or DT_Left);


  If Lbl.Height<iIconHeight Then
    Lbl.Height:=iIconHeight;

  { Adjust the form's height accomodating the message, padding and the buttons}
  Frm.ClientHeight := Lbl.Height + 3*icInterspace + icButtonHeight;

  { Create the pusbuttons}
  for I := 0 to High(AButtons) do
    begin
      Btn := TBitBtn.Create(Frm);
      Btn.Height := icButtonHeight;
      Btn.Width := iButtonWidth;
      Btn.Left:=((Frm.Width-iAllButtonsWidth) Div 2)+I*(iButtonWidth+icInterspace);
      Btn.Top := Frm.ClientHeight - Btn.height-icInterspace;
      Btn.Caption := AButtons[I];
      Btn.ModalResult := I + icButtonResultStart + icFirstButtonReturnValue;
      Btn.Parent := Frm;

      If I=DefBtn-1 Then
        Begin
          Frm.ActiveControl:=Btn;
          Btn.Default:=True;
        End
        Else
        Btn.Default:=False;

      If I=CanBtn-1 Then
        Btn.Cancel:=True
        Else
        Btn.Cancel:=False;
    end;

  Application.BringToFront;

  Result := Frm.ShowModal;

  {trap and convert user Close into mrNone}
  If Result=mrCancel Then
    Result:=mrNone
    Else
    If Result>icButtonResultStart Then
      Result:=Result - icButtonResultStart
      Else
      Exception.Create('Unknown MessageDlgEx result');

  Frm.Free;
end;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Procedure to show popup message , instead of the default showmessagedlg
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Procedure ShowMessageEx(Msg:string);
begin
  MessageDlgEx(Application.Title,Msg,mtInformation,['&Ok'],1,0);
end;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Procedure to show popup message , instead of the default Messagedlg with simple params
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function MessageDlgExS(Msg: string; AType: TMsgDlgType;
                      AButtons: array of string; CanBtn: Integer): Word;
begin
  Result:= MessageDlgEx(Application.Title,Msg,AType,AButtons,1,CanBtn);
end;

function RemoveZero(s: string): string;
var i:byte;
begin
  if length(s)>0 then begin
    i:=1;
    while s[i]='0' do inc(i);
    Result:=Copy(s,i,length(s));
  end
  else Result:='';
end;

function CheckForSemicolon(s: string): string;
var
  i:integer;
begin
  Result:='';
  for i:=1 to Length(s) do begin
    if s[i] in [#32..#126] then
    begin
      if s[i] in [';','''','"',',',':'] then Result:=Result+' '
      else Result:=Result+s[i];
    end;
  end;
end;

function removeChar(chr,str:string):string;
var
  i : integer;
begin
  Result := '';
  if Length(str)>0 then
    for i:=1 to Length(str) do
      if str[i]<>chr then
        Result := Result + str[i];
end;

function insertSpaceLeft(str:string; fldLength:integer): string;
var
  le : integer;
begin
  Result := str;
  le := Length(str);
  if ((fldLength-le)>0) then begin
    Result := insertSpace((fldLength-le)) + str;
  end;
end;

function insertSpace(c: integer): string;
var
  i : integer;
begin
  Result := '';
  if c>0 then
    for i:=1 to c do
      Result := Result + ' ';
end;

function insertSpaceRight(str: string;
  fldLength: integer): string;
var
  le : integer;
begin
  Result := str;
  le := Length(str);
  if ((fldLength-le)>0) then begin
    Result := str + insertSpace((fldLength-le))
  end;
end;

function RemoveSpaces(s: string): string;
var
  i: integer;
begin
  Result:='';
  for i:=1 to Length(s) do
    if s[i]<>#32 then Result:=Result+s[i];
end;

function CleanString(s: string; sc: setofchar): string;
var
  i:integer;
begin
  Result:='';
  for i:=1 to length(s) do begin
    if s[i] in [#32..#126] then begin
//      if not (s[i] in [';', '''']) then begin
      if not (s[i] in sc) then begin
        Result:=result+s[i];
      end;
    end;
  end;
end;

function CheckString(s: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i:=1 to length(s) do begin
    if s[i] in [#32..#126] then begin
      if (s[i] in ['*', '+', ',', '/', ':', ';', '<', '=', '>', '?', '[',
        '\', ']', '|', '''', ' ']) then begin
        Result := False;
        Exit;
      end;
    end;
  end;
  Result := True;
end;

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

function ExpandFile(FileName:string):string;
begin
  FileName := trim(FileName);
  if pos(':\', FileName) = 0 then begin
    result := ExtractFileDir(Application.ExeName);
    if (length(FileName)>0) and (FileName[1]='\') then
      result := result + FileName
    else
      result := result + '\' + FileName;
  end else
    result := FileName;
end;

function compactDB(strConn:string):boolean;
var
  v: OLEvariant;
  DB : string;
begin { CompactAndRepair }
  Result := True;
  db := ExpandFile(GetNextString(strConn,'Data Source=',';'));
  try
    v := CreateOLEObject('JRO.JetEngine');
    try
     	(*
      v.CompactDatabase('Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB,
                        'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB +
                        'x;Jet OLEDB:Engine type=5');
      *)
      v.CompactDatabase('Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB +';Jet OLEDB:Database Password='+ GlobalVarForm.DBPassword,
                        'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB +
                        'x;Jet OLEDB:Engine type=5;Jet OLEDB:Database Password=' + GlobalVarForm.DBPassword);
      DeleteFile(DB);
      RenameFile(DB + 'x', DB)
    finally
    	v := Unassigned
    end;
  except
  	on e:exception do
  	begin
    	Result := False;
      MessageDlg('Compact DB Acces Error: '+e.Message, mtError, [mbOK], 0);
 	 end;
  end;
end;

function ExecDLL(ApplicationHandle:THandle;fFileName,fprocname,fparam:string): integer;
var
  tempStr:  PChar;
  fDLLinst:HINST;
  fDLLproc: function(ApplicationHandle: THandle; Param: PChar): integer;

begin
  Result := -1;
  fDLLinst := 0;

  fDLLinst := LoadLibrary(PChar(ffilename));
  if fDLLinst <> 0 then
  begin
    fDLLProc := GetProcAddress(fDLLinst, PChar(fprocname));
  end
  else begin
    //raise Exception.Create('Failed to load DLL : ' + ffilename);
    Application.MessageBox(PChar('Failed to load DLL : ' + ffilename),
    					'Load Library', MB_OK + MB_ICONSTOP);
  	Exit;
  end;

  if (fDLLinst = 0) or not (Assigned(fDLLProc)) then
  begin
    Application.MessageBox(PChar('Failed to load DLL : ' + ffilename +
      ', function : ' + fprocname + ', Code : ' + IntToStr(GetLastError)),
    					'Load Library', MB_OK + MB_ICONSTOP);
    //raise Exception.Create('Failed to load DLL : ' + ffilename +
    //  ', function : ' + fprocname + ', Code : ' + IntToStr(GetLastError));
  end
  else
  begin
    //fReturnStr := '';
    //Windows.MessageBox(0,PChar(fparam),'Parameters',MB_ICONINFORMATION);
    tempStr    := StrPCopy(StrAlloc(256), fparam);
    try
      Result := fDLLproc(ApplicationHandle, tempStr);
      (*
      if StrPas(tempStr) <> fparam then
        fReturnStr := StrPas(tempStr);
      *)
    finally
      StrDispose(tempStr);
      FreeLibrary(fDLLinst);
      fDLLinst := 0;
    end;
  end;
end;

function IsNumeric(Value: Char): Boolean;
begin
   Result:=(Value in ['0'..'9']);
end;

function isAllNumeric(const s: string): boolean;
var
  i:byte;
begin
  Result:=false;
  for i:=1 to length(s) do
    if not(s[i] in ['0'..'9']) then exit;
  Result:=True;
end;

function Holiday(Adate: TDate): Boolean;
begin
  Result := True;
  if DayOfWeek(ADate) in [1, 7] then Exit;
  Result := False;
end;


function GetNextDate(crnDate:TDateTime):TDateTime;
var
	nextDate:TDateTime;
  intLimitNext : Integer;
begin
	nextDate := IncDay(crnDate, 1);
	intLimitNext := 0;

  while (Holiday(nextDate)) and (intLimitNext < 30) do
  begin
   	nextDate := IncDay(nextDate, 1);
    inc(intLimitNext);
  end;

  result := nextDate;
end;

function IsEmptyString(strValue:string):Boolean;
begin
  if Trim(strValue) = '' then
  	Result := True
  else
  	Result := False;
end;

procedure SetMessage(var strMessage:string; Value:string);
begin
	if Trim(strMessage) = '' then
  	strMessage := Value
  else
  	strMessage := strMessage + #13#10 + Value;
end;

function RemoveLeadingZeroes(Source:string): string;
var
  Idx: Integer;
begin
  Idx:=1;
  while Idx<=Length(Source) do
  begin
    if Source[Idx]<>'0' then Break;
    Inc(Idx);
  end;
  Result:=Copy(Source, Idx, Length(Source));
end;

function IsAlpha(Value: Char): Boolean;
begin
   Result:=(Value in ['_','A'..'Z','a'..'z',#129..#254,#32]);
end;

function IsAlpha2(Value: Char): Boolean;
begin
   Result:=(Value in ['A'..'Z','a'..'z']);
end;

function IsAlphaNumeric(Value: Char): Boolean;
begin
   Result:=(IsAlpha(Value) or IsNumeric(Value));
end;

function IsAlphaNumeric2(Value: Char): Boolean;
begin
   Result:=(IsAlpha2(Value) or IsNumeric(Value));
end;

function isAllAlpha(Value:String):Boolean;
var
	i:Integer;
begin
	Result := True;
	for i:=1 to length(Value) do
  begin
  	if Not IsAlpha(Value[i]) then
    begin
    	Result := False;
      break;
    end;
  end;
end;

function isAllAlphaNumeric(Value:String):Boolean;
var
	i:Integer;
begin
	Result := True;
	for i:=1 to length(Value) do
  begin
  	if Not IsAlphaNumeric(Value[i]) then
    begin
    	Result := False;
      break;
    end;
  end;
end;

function GetAlphaNumeric(Value:String):String;
var
	i:Integer;
  rsl:String;
begin
	rsl:='';
	for i:=1 to Length(Value) do
  begin
  	if IsAlphaNumeric(Value[i]) then
    	rsl := rsl + Value[i];
  end;
  Result := rsl;
end;

function GetAlphaNumeric2(Value:String):String;
var
	i:Integer;
  rsl:String;
begin
	rsl:='';
	for i:=1 to Length(Value) do
  begin
  	if IsAlphaNumeric2(Value[i]) then
    	rsl := rsl + Value[i];
  end;
  Result := rsl;
end;

function removeNonNumeric(text:string):string;
var
  i:integer;
begin
  Result:='';
  for i:=1 to Length(text) do begin
    if text[i] in ['0'..'9'] then Result:=Result+text[i];
  end;
end;


function RemoveInvalidChar(const strValue: String):String;
var
  i:integer;
  strResult : String;
begin
  Result := '';
  strResult := '';
  for i:=1 to length(strValue) do
  begin
    if Not (strValue[i] in [#0..#31]) then
      strResult := strResult + strValue[i]
    else
      strResult := strResult + ' ';
  end;
  Result := strResult;
end;

function IsValidAccountNumeric(vAccount:string):Boolean;
var
	i:Integer;
begin
	Result := True;
	for i:=1 to length(vAccount) do
  begin
  	if Not (vAccount[i] in ['0'..'9','-','/','.']) then
    begin
    	Result := False;
      break;
    end;
  end;
end;

function IsValidAccountAlphaNumeric(vAccount:string):Boolean;
var
	i:Integer;
begin
	Result := True;
	for i:=1 to length(vAccount) do
  begin
  	if Not (vAccount[i] in ['a'..'z','A'..'Z','0'..'9','-','/','.']) then
    begin
    	Result := False;
      break;
    end;
  end;
end;

function IsValidAccountAlphaNumeric2(vAccount:string):Boolean;
var
	i:Integer;
begin
	Result := True;
	for i:=1 to length(vAccount) do
  begin
  	if Not (vAccount[i] in ['a'..'z','A'..'Z','0'..'9']) then
    begin
    	Result := False;
      break;
    end;
  end;
end;

end.
