unit fISubBranchAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, JvExControls, JvDBLookup, JvExStdCtrls, JvEdit,
  JvValidateEdit, StdCtrls, Buttons, ExtCtrls, AdvPanel, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmISubBranchAdd = class(TForm)
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    edtSandiCApem: TJvValidateEdit;
    dblSandaiCabang: TJvDBLookupCombo;
    qryBranch: TADOQuery;
    dsBranch: TDataSource;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNamaCapem: TEdit;
    dblRegion: TJvDBLookupCombo;
    memAddress: TMemo;
    edtSandiBI: TJvValidateEdit;
    dblWilayahKliring: TJvDBLookupCombo;
    edtNamaCabang: TEdit;
    qryiRegion: TADOQuery;
    dsiRegion: TDataSource;
    qryClearingRegion: TADOQuery;
    dsClearingRegion: TDataSource;
    Label2: TLabel;
    dblKota: TJvDBLookupCombo;
    qryKota: TADOQuery;
    dsKota: TDataSource;
    btnGeneralEdit: TcxButton;
    AdvGlowButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblSandaiCabangChange(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoOpenReference;
  end;

var
  frmISubBranchAdd: TfrmISubBranchAdd;

implementation

uses fGlobalVar, fGlobalVarDM;



{$R *.dfm}

procedure TfrmISubBranchAdd.FormCreate(Sender: TObject);
begin
	if qryBranch.Active then
  	qryBranch.Close;
  qryBranch.Connection := GlobalVarDM.DailyADOConn;

	if qryiRegion.Active then
  	qryiRegion.Close;
  qryiRegion.Connection := GlobalVarDM.DailyADOConn;

	if qryClearingRegion.Active then
  	qryClearingRegion.Close;
  qryClearingRegion.Connection := GlobalVarDM.DailyADOConn;

	if qryKota.Active then
  	qryKota.Close;
  qryKota.Connection := GlobalVarDM.DailyADOConn;
end;

procedure TfrmISubBranchAdd.FormShow(Sender: TObject);
begin
  ModalResult := mrNone;

  case Self.Tag of
    1: begin
    		edtSandiCApem.Enabled := True;
        dblSandaiCabang.SetFocus;
    	 end;
    2: begin
    		edtSandiCApem.Enabled := False;
        dblSandaiCabang.SetFocus;
    	 end;
  end;

end;

procedure TfrmISubBranchAdd.DoOpenReference;
begin
	with qryBranch do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT ib_code, ib_name FROM ' + DB_TABLE_IBRANCH);
    if GlobalVarForm.DBType = 1 then
    	SQL.Add(' WHERE ib_parent=''0'' or ib_parent is null or TRIM(ib_parent)='''' ')
    else
    	SQL.Add(' WHERE ib_parent=''0'' or ib_parent is null or LTRIM(RTRIM(ib_parent))='''' ');
    SQL.Add(' ORDER BY ib_code ');
    Open;
  end;

  with qryiRegion do
  begin
  	if Active then
    	Close;
    SQL.Text:='SELECT ir_code, ir_name FROM '+ DB_TABLE_IREGION + ' ORDER BY ir_name';
    Open;
  end;

  with qryClearingRegion do
  begin
  	if Active then
    	Close;
    SQL.Text:='SELECT SANDI_WILAYAH_KLIRING, NAMA_WILAYAH_KLIRING FROM '+ DB_TABLE_REF_WILAYAH_KLIRING + ' ORDER BY NAMA_WILAYAH_KLIRING';
    Open;
  end;


	with qryKota do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT SANDI_KOTA, NAMA_KOTA FROM ' + DB_TABLE_REF_KOTA);
    SQL.Add('ORDER BY SANDI_KOTA');
    Open;
  end;
end;

procedure TfrmISubBranchAdd.dblSandaiCabangChange(Sender: TObject);
begin
	if Trim(dblSandaiCabang.Value) = '' then
		edtNamaCabang.Text := ''
  else
  	edtNamaCabang.Text := qryBranch.FieldByName('ib_name').AsString;
end;

procedure TfrmISubBranchAdd.btnGeneralEditClick(Sender: TObject);
begin
	ModalResult := mrOK;
end;

procedure TfrmISubBranchAdd.AdvGlowButton1Click(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

end.
