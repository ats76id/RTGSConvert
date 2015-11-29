unit uLib;

interface

uses
  SysUtils, Forms, Dialogs, LbCipher, LbProc;

function GetReg(ApplicationHandle:THandle):boolean; export;
function SetReg(ApplicationHandle:THandle):boolean; export;
function EncryptFile(strInFile,strOutFile:String):Boolean;
function DecryptFile(strInFile,strOutFile:String):Boolean;


Const
	FilePhrase = '4buF4ris';

var
  ProfileRegistryKey    : string;
  OldApplicationHandle  : THandle;
  UsernameString: string;
  UsergroupString: string;

  boMessage : boolean;
  boDeleteAllHistory: Boolean;
  theLog : OleVariant;
  Key128 : TKey128;

implementation

uses fLibMain;

function EncryptFile(strInFile,strOutFile:String):Boolean;
begin
	Result := True;
	try
  	GenerateLMDKey(Key128, SizeOf(Key128), FilePhrase);
  	RDLEncryptFileCBC(strInFile, strOutFile, Key128, 16, True);
		DeleteFile(strInFile);
    RenameFile(strOutFile, strInFile);
  except
  	Result := False;
  end;
end;

function DecryptFile(strInFile,strOutFile:String):Boolean;
begin
	Result := True;
	try
  	GenerateLMDKey(Key128, SizeOf(Key128), FilePhrase);
  	RDLEncryptFileCBC(strInFile, strOutFile, Key128, 16, False);
		DeleteFile(strInFile);
    RenameFile(strOutFile, strInFile);
  Except
  	Result := False;
  end;
end;

function GetReg(ApplicationHandle:THandle):boolean;
var
	boContinue : Boolean;
  intFS:Int64;
	sr : TSearchRec;
  strFileName, strFileName2:String;
begin
  Result := False;
  OldApplicationHandle:=Application.Handle;
  Application.Handle:=ApplicationHandle;
  try
  	boContinue := True;
		try
    	strFileName := ChangeFileExt( Application.ExeName, '.dll' );
      strFileName2 := ChangeFileExt( Application.ExeName, '.dll2' );
  		if FindFirst(strFileName, faAnyFile, sr) = 0 then
      begin
      	intFS := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow);
        if intFS=0 then
        	boContinue := False;
      end
      else
      	boContinue := False;

      if boContinue then
      begin
        if FileExists(strFileName) then
      		boContinue := DecryptFile(strFileName, strFileName2);
        if not boContinue then
        begin
        	DeleteFile(strFileName);
          DeleteFile(strFileName2);
        end;
      end;

    	Application.CreateForm(TfrmLibMain, frmLibMain);
      if boContinue then
      	Result := frmLibMain.IsExpired
      else
      	Result := True;
    finally
    	if FileExists(strFileName) then
      	EncryptFile(strFileName, strFileName2);
      frmLibMain.Free;
    end;
  finally
    Application.Handle:=OldApplicationHandle;
  end;
end;

function SetReg(ApplicationHandle:THandle):boolean;
var
	strFileName, strFileName2 : String;
  boContinue:Boolean;
begin
  Result := False;
  boContinue := True;
  OldApplicationHandle:=Application.Handle;
  Application.Handle:=ApplicationHandle;
  try
		try
      strFileName := ChangeFileExt( Application.ExeName, '.dll' );
      strFileName2 := ChangeFileExt( Application.ExeName, '.dll2' );

      if FileExists(strFileName) then
      begin
      	boContinue := DecryptFile(strFileName, strFileName2);
        if Not boContinue then
        begin
        	DeleteFile(strFileName);
          DeleteFile(strFileName2);
        end;
      end;

    	Application.CreateForm(TfrmLibMain, frmLibMain);
      if boContinue then
      begin
      	frmLibMain.ResetRegister;
      	Result := frmLibMain.IsExpired;
      end
      else
      	Result := True;
    finally
      if FileExists(strFileName) then
      	EncryptFile(strFileName, strFileName2);
      frmLibMain.Free;
    end;
  finally
    Application.Handle:=OldApplicationHandle;
  end;
end;

end.
