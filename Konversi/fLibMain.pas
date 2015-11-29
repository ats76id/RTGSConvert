unit fLibMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mxProtector;

type
  TfrmLibMain = class(TForm)
    mxProtector: TmxProtector;
    procedure FormCreate(Sender: TObject);
    procedure mxProtectorExpiration(Sender: TObject);
    procedure mxProtectorInvalidSystemTime(Sender: TObject);
    procedure mxProtectorTimeTrial(Sender: TObject; DaysRemained: Integer);
    procedure mxProtectorCodeData(Sender: TObject; var ACode: String);
    procedure mxProtectorDeCodeData(Sender: TObject; var ACode: String);
    procedure mxProtectorGetBoolean(Sender: TObject; var APath,
      AKey: String; var AResult, Handled: Boolean);
    procedure mxProtectorGetString(Sender: TObject; var APath, AKey,
      AResult: String; var Handled: Boolean);
    procedure mxProtectorPutBoolean(Sender: TObject; var APath,
      AKey: String; var ASavedData, Handled: Boolean);
    procedure mxProtectorPutString(Sender: TObject; var APath, AKey,
      ASavedData: String; var Handled: Boolean);
    procedure mxProtectorReset(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
    FboExpired:Boolean;
    function GetExpired: Boolean;
  public
    { Public declarations }
    property IsExpired:Boolean read GetExpired;
    procedure ResetRegister;
  end;

var
  frmLibMain: TfrmLibMain;

implementation

{$R *.dfm}
Uses IniFiles;

procedure TfrmLibMain.FormCreate(Sender: TObject);
begin
	FboExpired := False;
end;

function TfrmLibMain.GetExpired: Boolean;
begin
	mxProtector.Init;
  mxProtector.Init;
  Result := FboExpired;
end;

procedure TfrmLibMain.mxProtectorExpiration(Sender: TObject);
begin
	FboExpired := True;
end;

procedure TfrmLibMain.mxProtectorInvalidSystemTime(Sender: TObject);
begin
	FboExpired := True;
end;

procedure TfrmLibMain.mxProtectorTimeTrial(Sender: TObject;
  DaysRemained: Integer);
begin
//	FboExpired := True;
end;

procedure TfrmLibMain.ResetRegister;
begin
	mxProtector.Reset;
  mxProtector.Init;
end;

procedure TfrmLibMain.mxProtectorCodeData(Sender: TObject;
  var ACode: String);
begin
  ACode:=ACode;
end;

procedure TfrmLibMain.mxProtectorDeCodeData(Sender: TObject;
  var ACode: String);
begin
  ACode:=ACode;
end;

procedure TfrmLibMain.mxProtectorGetBoolean(Sender: TObject; var APath,
  AKey: String; var AResult, Handled: Boolean);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.dll' ) );
  try
    AResult:=Ini.ReadBool( 'REGDATA', AKey, AResult );
    Handled:=True;
  finally
    Ini.Free;
  end;
end;

procedure TfrmLibMain.mxProtectorGetString(Sender: TObject; var APath,
  AKey, AResult: String; var Handled: Boolean);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.dll' ) );
  try
    AResult:=Ini.ReadString( 'REGDATA', AKey, AResult );
    Handled:=True;
  finally
    Ini.Free;
  end;

end;

procedure TfrmLibMain.mxProtectorPutBoolean(Sender: TObject; var APath,
  AKey: String; var ASavedData, Handled: Boolean);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.dll' ) );
  try
    Ini.WriteBool( 'REGDATA', AKey, ASavedData );
    Handled:=True;
  finally
    Ini.Free;
  end;

end;

procedure TfrmLibMain.mxProtectorPutString(Sender: TObject; var APath,
  AKey, ASavedData: String; var Handled: Boolean);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.dll' ) );
  try
    Ini.WriteString( 'REGDATA', AKey, ASavedData );
    Handled:=True;
  finally
    Ini.Free;
  end;

end;

procedure TfrmLibMain.mxProtectorReset(Sender: TObject;
  var Handled: Boolean);
begin
  Handled:=True;
  DeleteFile( ChangeFileExt( Application.ExeName, '.dll' ) );
end;

end.
