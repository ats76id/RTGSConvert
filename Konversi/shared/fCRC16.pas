unit fCRC16;

interface

type
  TCRC16 = class
  protected
    Value: Word;
  public
    constructor Create(InitialValue: Word);
    procedure Update(v: Byte);
    function GetValue: Word;
    procedure SetValue(NewValue: Word);
    function GetCRC(str: string): Word;
  end;

implementation

var
  Crc16Table: array[0..255] of word;


{ TCRC16 }

procedure InitializeCrc16;
var
  I, J, K: Integer;
  CRC: Word;
begin
  for I := 0 to 255 do
  begin
    K :=  I shl 8;
    CRC := 0;
    for J :=  0 to 7 do
    begin
      if (((CRC xor K) and $8000)<>0) then
        CRC := (CRC shl 1) xor $1021
      else
        CRC := CRC shl 1;
      K := K shl 1;
    end;
    CRC16Table[I] := CRC;
  end;
end;

constructor TCRC16.Create(InitialValue: Word);
begin
  Value := InitialValue;
end;

function TCRC16.GetCRC(str: string): Word;
var
  I: Integer;
begin
  SetValue(0);
  for I := 1 to (Length(str)) do Update(Ord(str[I]));
  Result := Value;
end;

function TCRC16.GetValue: Word;
begin
  Result := Value;
end;

procedure TCRC16.SetValue(NewValue: Word);
begin
  Value := NewValue;
end;

procedure TCRC16.Update(V: Byte);
begin
  Value := Crc16Table[(Value shr 8) and $FF] xor (Value shl 8) xor (V and $FF);
end;

initialization
  InitializeCRC16;

end.
