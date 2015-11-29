unit fUnits;

interface

uses Windows, forms, AdoDB;

function CallUMC(Handle: THandle; AdocConn: TADOConnection; strUser, strGroup, strParam: string): Integer; export

implementation

uses fUMCConst, fRules, fMain, fOptions, fNewGroup, fManageUser, fNewUser;


function CallUMC(Handle: THandle; AdocConn: TADOConnection; strUser, strGroup, strParam: string): Integer;
var
  intI: Integer;
  myHandle: THandle;
begin
  intI := ruleInitModule(AdocConn);
  try
    if intI=VR_OK then begin
      myHandle := Application.Handle;
      Application.Handle := Handle;
      Application.CreateForm(TfmMain, fmMain);
      Application.CreateForm(TfmOptions, fmOptions);
      Application.CreateForm(TfmNewGroup, fmNewGroup);
      Application.CreateForm(TfmManageUser, fmManageUser);
      Application.CreateForm(TfmNewUser, fmNewUser);
{
      ;
      ;

      Application.CreateForm(TfmSetPassword, fmSetPassword);
      Application.CreateForm(TfmGroupList, fmGroupList);}
      try
        fmMain.UserName := strUser;
        fmMain.ShowModal;
      finally
        fmNewUser.Free;
        fmManageUser.Free;
        fmNewGroup.Free;
        fmOptions.Free;
{        fmGroupList.Free;
        fmSetPassword.Free;
        fmNewGroup.Free;
}
        fmMain.Free;
        Application.Handle := myHandle;
      end;
    end
    else begin
      MessageBox(0, PChar(rsErrFirstInitialization), 'Error', MB_OK);
    end
  finally
    ruleDeInitModule;
  end;
end;


end.
