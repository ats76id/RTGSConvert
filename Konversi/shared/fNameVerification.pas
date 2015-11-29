unit fNameVerification;

interface

uses SysUtils, Dialogs, DB, ADODB, fUtils, fGlobalVar, fGlobalVarDM, Classes;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
const
 CHAR_SEPARATOR = ';';

{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function verifyName(const strName1, strName2: String): Boolean;
function isValidCharacter(const strChar: String): Boolean;
function putSeparator(const strString: String): String;
function removeDuplicateSpace(const strString: String): String;
function compareString(const strName1, strName2: String): Boolean;
function initialize(const cnADO:TADOConnection): Boolean;
function fillToMemoryData(const strString: String; var slName, slTitle: TStringList): Boolean;
function removeSameSubString(var slMemory1, slMemory2: TStringList; const blnFilterMode: Boolean=False): Boolean;
function changeInvalidCharToSpace(strString:String):String;
procedure deinitialize;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}

var
  slDegree : TStringList;
  slName1  : TStringList;
  slName2  : TStringList;
  slTitle1 : TStringList;
  slTitle2 : TStringList;

implementation

uses Math;

function changeInvalidCharToSpace(strString:String):String;
var
  blnValid, blnFirst : Boolean;
  i                  : Integer;
  strResult          : String;
begin
	strResult := '';
  for i:=1 to Length(strString) do
  begin
    if strString[i]='"' then Continue;

    blnValid := isValidCharacter(strString[i]);

    // Take character if it is
    if blnValid then
      strResult := strResult + strString[i]
    else
			strResult := strResult + ' ';
  end;
  Result := strResult;
end;

{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function initialize(const cnADO:TADOConnection): Boolean;
var
  dsTemp : TADODataSet;
begin
  try
    try
      // Get Degree Record
      dsTemp := TADODataSet.Create(nil);
      with dsTemp do
      begin
        Connection := cnADO;
        CommandText := 'select ti_name from ' + DB_TABLE_TITLES;
        Open;
        while not Eof do
        begin
          slDegree.Add(Fields[0].asString);
          Next;
        end;
      end;
      Result := True;
    except
      on E:Exception do
      begin
        ShowMessage(E.Message);
        Result := False;
      end;
    end;
  finally
    dsTemp.Free;
  end;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
procedure deinitialize;
begin

end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function fillToMemoryData(const strString: String; var slName, slTitle: TStringList): Boolean;
var
  strTemp: String;
  i: Integer;
begin
  try
    strTemp := '';
    slName.Clear;
    slTitle.Clear;
    for i:=1 to Length(strString) do
    begin
      if strString[i] = '"' then continue;

      if Copy(strString,i,1) <> CHAR_SEPARATOR then
        strTemp := strTemp + Copy(strString,i,1)
      else
      begin
        if Trim(strTemp) <> '' then
        begin
          if slDegree.IndexOf(strTemp) <> -1 then
            slTitle.Add(strTemp)
          else
            slName.Add(strTemp);
        end;
        strTemp := '';
      end;
    end;
    Result := False;
  except
    Result := True;
  end;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function removeSameSubString(var slMemory1, slMemory2: TStringList; const blnFilterMode: Boolean=False): Boolean;
var
  i, intTemp: Integer;
  boContinue : Boolean;
begin
  try
    i:=0;
    //Remove same sub string from both data set
    while i < slMemory1.Count do
    begin
      if blnFilterMode then
      begin
        intTemp := slMemory2.IndexOf(slMemory1.Strings[i]);
        if intTemp <> -1 then
        begin
          slMemory1.Delete(i);
          slMemory2.Delete(intTemp);
        end
        else
          Inc(i);
      end
      else
      begin
        {* old :
        if slMemory2.Strings[i] = slMemory1.Strings[i] then
        begin
          slMemory1.Delete(i);
          slMemory2.Delete(i);
        end
        else
        begin
          if not slMemory2.Count < (i-1) then
            Inc(i)
          else
            i:=slMemory1.Count;
        end;
        }

        boContinue := False;
        if (slMemory1.Count > i) and (slMemory2.Count > i) then
        begin
        	if slMemory2.Strings[i] = slMemory1.Strings[i] then
          begin
          	slMemory1.Delete(i);
          	slMemory2.Delete(i);
          end
          else
          	boContinue := True;
        end
        else
        	boContinue := True;

				if boContinue then
        begin
          if not slMemory2.Count < (i-1) then
            Inc(i)
          else
            i:=slMemory1.Count;
				end;
      end;
    end;
    Result := False;
  except
    Result := True;
  end;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function compareString(const strName1, strName2: String): Boolean;
var
  blnResult: Boolean;
begin
  try
    //Fill to memory data
    fillToMemoryData(strName1,slName1,slTitle1);
    fillToMemoryData(strName2,slName2,slTitle2);

    //Remove same substring
    removeSameSubString(slName1,slName2,False);
    removeSameSubString(slTitle1,slTitle2);
    removeSameSubString(slName2,slName1,False);
    removeSameSubString(slTitle2,slTitle1);

    blnResult := False;

    // Exactly the same
    if ((slName1.Count=0) and (slName2.Count=0)) and
    ((slTitle1.Count=0) and (slTitle2.Count=0)) then
      blnResult := True;

    // Same name with added title
    if ((slName1.Count=0) and (slName2.Count=0)) and
    (((slTitle1.Count<>0) and (slTitle2.Count=0)) or
    ((slTitle1.Count=0) and (slTitle2.Count<>0))) then
      blnResult := True;
    Result := blnResult;
  except
    Result := False;
  end;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
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
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function isValidCharacter(const strChar: String): Boolean;
begin
  if strChar = ' ' then Result := False
  else if strChar = ',' then Result := False
  else if strChar = '.' then Result := False
  else if strChar = ';' then Result := False
  else if strChar = '/' then Result := False
	else if strChar = '\' then Result := False
  else if strChar = '''' then Result := False
  else if strChar = '"' then Result := False
  else if strChar = '-' then Result := False
  else if strChar = '_' then Result := False
  else if strChar = ':' then Result := False
  else if strChar = '(' then Result := False
  else if strChar = ')' then Result := False
  else Result := True;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function putSeparator(const strString: String): String;
var
  strTemp,strTemp2: String;
  i,j: Integer;
begin
  strTemp := '';
  strTemp2 := '';
  j:=0;
  for i:=1 to Length(strString) do
  begin
    if ((Copy(strString,i,1) = ' ') or (Copy(strString,i,1) = ',')) or
    ((Copy(strString,i,1) = '.') or (Copy(strString,i,1) = ';')) then
    begin
      if  not ((j=1) and not ((Copy(strString,i-1,1) = ',') or (Copy(strString,i-1,1) = '.'))) then
      begin
        strTemp := strTemp + CHAR_SEPARATOR;
        strTemp2 := '';
        j:=0;
      end
      else begin //Added Maret,02 2007
        if (slDegree.IndexOf(strTemp2) <> -1) then
        begin
           strTemp := strTemp + CHAR_SEPARATOR;
           strTemp2 := '';
           j:=0;
        end;
      end;
    end
    else
    begin
        strTemp := strTemp + Copy(strString,i,1);
        strTemp2:= strTemp2 + Copy(strString,i,1);
      Inc(j);
    end;
  end;

  if Copy(strTemp,Length(strTemp),1) <> CHAR_SEPARATOR then
    strTemp := strTemp + CHAR_SEPARATOR;
  Result := strTemp;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
function verifyName(const strName1, strName2: String): Boolean;
var
  strString1, strString2 : String;
	i : Integer;
begin
  if strName1 = strName2 then
    Result := True
  else
  begin
    //strString1 := UpperCase(Trim(strString1));
    //strString2 := UpperCase(Trim(strString2));
    //Remove invalid character
    strString1 := UpperCase(Trim(changeInvalidCharToSpace(strName1)));
  	strString2 := UpperCase(Trim(changeInvalidCharToSpace(strName2)));

    if strString1 = strString2 then
      Result := True
    else
    begin
      strString1 := removeDuplicateSpace(strString1);
      strString2 := removeDuplicateSpace(strString2);

      if strString1 = strString2 then
        Result := True
      //else Result := compareString(putSeparator(strString1),putSeparator(strString2));
      else if compareString(putSeparator(strString1),putSeparator(strString2)) then
        	Result := True
      else begin
        {* 24 Desember 2007                                                 *}
        {* Bandingkan nama tanpa title                                      *}
        {* Misal Jika :                                                     *}
        {*      strString1 = MurniSolusindoNusantara (3 kata disatukan)     *}
        {*      strString2 = murniSolusindonusantara (3 kata disatukan)     *}
        {* Artinya strString1 dan strString2 mempunyai nilai yang sama      *}

        strString1 := '';
        strString2 := '';

        //Get value strString1
        for i:=0 to slName1.Count-1 do
          strString1 := strString1 + slName1.Strings[i];

        //Get value strString2
        for i:=0 to slName2.Count-1 do
          strString2 := strString2 + slName2.Strings[i];

        Result := StrComp(PChar(UpperCase(strString1)), PChar(UpperCase(strString2))) = 0;
      end;
    end;
  end;
end;
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•                                                                            •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
initialization
  // Create String List
  slDegree := TStringList.Create;
  slName1  := TStringList.Create;
  slName2  := TStringList.Create;
  slTitle1 := TStringList.Create;
  slTitle2 := TStringList.Create;
  slDegree.Clear;

finalization
  slName1.Free;
  slName2.Free;
  slTitle1.Free;
  slTitle2.Free;
  slDegree.Free;

{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
{•  End of file.                                                              •}
{••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}
end.
