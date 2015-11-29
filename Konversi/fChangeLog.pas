unit fChangeLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomMemo, LMDMemo, ExtCtrls, AdvPanel,
  StdCtrls, Buttons;

type
  TfrmChangeLog = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    meLog: TLMDMemo;
    btnGeneralEdit: TBitBtn;
    procedure btnGeneralEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangeLog: TfrmChangeLog;

implementation

{$R *.dfm}

procedure TfrmChangeLog.btnGeneralEditClick(Sender: TObject);
begin
	Close;
end;

end.
