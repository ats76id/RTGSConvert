unit fMainCompact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ComObj, Mask, JvExMask, JvToolEdit;

type
  TfrmMainCompact = class(TForm)
    ADOQuery1: TADOQuery;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edtFileSource: TJvFilenameEdit;
    Label2: TLabel;
    edtPassword: TEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    function CompactAndRepair(DB: string): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainCompact: TfrmMainCompact;

implementation

{$R *.dfm}

function TfrmMainCompact.CompactAndRepair(DB: string) : boolean;
var
  v: OLEvariant;
begin { CompactAndRepair }
  Result := True;
  try
    v := CreateOLEObject('JRO.JetEngine');
    try
      (*
      v.CompactDatabase('Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB,
                        'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB +
                        'x;Jet OLEDB:Engine type=5');
      *)
      v.CompactDatabase('Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB +';Jet OLEDB:Database Password='+ edtPassword.Text,
                        'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DB +
                        'x;Jet OLEDB:Engine type=5;Jet OLEDB:Database Password=' + edtPassword.Text);

      DeleteFile(DB);
      RenameFile(DB + 'x', DB)
    finally
      v := Unassigned
    end; { try }

  except
    Result := False
  end; { try }
end; { CompactAndRepair }

procedure TfrmMainCompact.BitBtn1Click(Sender: TObject);
begin
	CompactAndRepair(edtFileSource.FileName);
  MessageDlg('Compact and Repair successfully.', mtInformation, [mbOK], 0);
end;

end.
