unit uni_RegCommon;

interface

uses
  OnGuard, OgUtil, Classes, Dialogs;

var
  MachineModifier : longint;
  MachineKey : TKey;
  Expires : TDateTime;
  RegistrationInfo : TStringList;
  FAppPath:string;

function IsReleaseCodeValid (ReleaseCodeString: string; const SerialNumber : longint;var dtExpire:TDateTime) : boolean;
function IsAppExpired(ReleaseCodeString:String):Boolean;
procedure SaveRegistrationInformation (const ReleaseCodeString: string; const SerialNumber : longint);
procedure GetRegistrationInformation (var ReleaseCodeString: string; var SerialNumber : longint);
procedure SetApplicationPath(strPath:string);

implementation

uses
  SysUtils;

const
  RegistrationFile = 'registration.dat';

procedure SetApplicationPath(strPath:string);
begin
	FAppPath:= strPath;
end;

function IsAppExpired(ReleaseCodeString:String):Boolean;
var
  CalculatedReleaseCode : TCode;
  dtExpire:TDateTime;
begin
	HexToBuffer(ReleaseCodeString, CalculatedReleaseCode, SizeOf(CalculatedReleaseCode));
  dtExpire := GetExpirationDate(MachineKey, CalculatedReleaseCode);
  Result := IsRegCodeExpired(MachineKey, CalculatedReleaseCode);
end;

function IsReleaseCodeValid (ReleaseCodeString: string; const SerialNumber : longint;var dtExpire:TDateTime) : boolean;
var
  CalculatedReleaseCode : TCode;
  Code:TCode;
begin
  // Remove spaces from the Release code
  while pos(' ', ReleaseCodeString) > 0 do
    System.Delete(ReleaseCodeString, pos(' ', ReleaseCodeString), 1);

	HexToBuffer(ReleaseCodeString, Code, SizeOf(Code));
  Expires := GetExpirationDate(MachineKey, Code);
  dtExpire := Expires;
  (*
  if FormatDateTime('mm/dd/yyyy', Expires) = '01/01/9999' then
  	Expires := 0;
  *)
  // Calculate the release code based on the serial number and the calculated machine modifier
  InitSerialNumberCode(MachineKey, SerialNumber, Expires, CalculatedReleaseCode);

  // Compare the two release codes
  //ShowMessage(AnsiUpperCase(ReleaseCodeString) +  ' = ' + AnsiUpperCase(BufferToHex(CalculatedReleaseCode, sizeof(CalculatedReleaseCode))));
  result := AnsiUpperCase(ReleaseCodeString) = AnsiUpperCase(BufferToHex(CalculatedReleaseCode, sizeof(CalculatedReleaseCode)));
end;

procedure SaveRegistrationInformation (const ReleaseCodeString: string; const SerialNumber : longint);
begin
  // Save the information for the application
  RegistrationInfo := TStringList.Create;
  RegistrationInfo.Add(format('%d',[SerialNumber]));
  RegistrationInfo.Add(ANSIUpperCase(ReleaseCodeString));
  RegistrationInfo.SaveToFile(FAppPath + RegistrationFile);
  RegistrationInfo.Free;
end;

procedure GetRegistrationInformation (var ReleaseCodeString: string; var SerialNumber : longint);
begin
  // Save the information for the application
  if FileExists(FAppPath + RegistrationFile) then begin
    RegistrationInfo := TStringList.Create;
    RegistrationInfo.LoadFromFile(FAppPath + RegistrationFile);
    SerialNumber := StrToInt(RegistrationInfo[0]);
    ReleaseCodeString := RegistrationInfo[1];
    RegistrationInfo.Free;
  end else begin
    SerialNumber := 0;
    ReleaseCodeString := '';
  end;
end;

const
  Key : TKey = ($55,$64,$C9,$6A,$82,$13,$82,$D6,$59,$B1,$2F,$0A,$57,$CE,$A9,$23);
initialization
  Expires := 0;
  MachineKey := Key;
  //MachineModifier := ABS(CreateMachineID([{midUser,} midSystem, midNetwork, midDrives]));
  //ApplyModifierToKeyPrim(MachineModifier,MachineKey,sizeof(MachineKey));
end.

