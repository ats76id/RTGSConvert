unit fIBranchAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, StdCtrls, Buttons, JvExControls, JvDBLookup,
  JvExStdCtrls, JvEdit, JvValidateEdit, JvExMask, 
  AdvPanel, LMDCustomComponent, LMDWndProcComponent,
  LMDFormShadow, LMDCustomControl, LMDCustomPanel, LMDButtonControl,
  LMDCustomCheckBox, LMDCheckBox, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmiBranchAdd = class(TForm)
    qryiRegion: TADOQuery;
    dsiRegion: TDataSource;
    qryClearingRegion: TADOQuery;
    dsClearingRegion: TDataSource;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtNamaCabang: TEdit;
    edtSandiCabang: TJvValidateEdit;
    dblRegion: TJvDBLookupCombo;
    memAddress: TMemo;
    edtSandiBI: TJvValidateEdit;
    dblWilayahKliring: TJvDBLookupCombo;
    cbxKoordinatorKota: TLMDCheckBox;
    Label7: TLabel;
    dblKota: TJvDBLookupCombo;
    qryKota: TADOQuery;
    dsKota: TDataSource;
    AdvGlowButton1: TcxButton;
    AdvGlowButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoOpenRegion;
  end;

var
  frmiBranchAdd: TfrmiBranchAdd;

implementation

uses fGlobalVar, fGlobalVarDM;

{$R *.dfm}

{ TfmiBranchAdd }


procedure TfrmiBranchAdd.FormCreate(Sender: TObject);
begin
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

procedure TfrmiBranchAdd.FormShow(Sender: TObject);
begin
  ModalResult := mrNone;

  case Self.Tag of
    1: begin
    		edtSandiCabang.Enabled := True;
        edtSandiCabang.SetFocus;
    	 end;
    2: begin
    		edtSandiCabang.Enabled := False;
        edtNamaCabang.SetFocus;
    	 end;
  end;

end;

procedure TfrmiBranchAdd.btnGeneralEditClick(Sender: TObject);
begin
	ModalResult := mrOK;
end;

procedure TfrmiBranchAdd.AdvGlowButton1Click(Sender: TObject);
begin
	ModalResult := mrOK;
end;

procedure TfrmiBranchAdd.AdvGlowButton2Click(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TfrmiBranchAdd.DoOpenRegion;
begin
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

end.
