unit fLaporanKonversiDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ADODB, ComCtrls, AdvDateTimePicker,
  StdCtrls, AdvGroupBox, Buttons, ExtCtrls, AdvPanel, XPMan;

type
  TfrmLaporanKonversiDetail = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    AdvGroupBox1: TAdvGroupBox;
    Label1: TLabel;
    dtpTanggalKonversi: TAdvDateTimePicker;
    qryRptMaster: TADOQuery;
    dsRptMaster: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    cboStatusKonversi: TComboBox;
    Label3: TLabel;
    XPManifest1: TXPManifest;
    btnGeneralEdit: TBitBtn;
    btnGeneralSave: TBitBtn;
    procedure btnGeneralEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGeneralSaveClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
    FReportType:Integer;
    FReportTitle:String;
  public
    { Public declarations }
    property ReportType:Integer Read FReportType write FReportType;
  end;

var
  frmLaporanKonversiDetail: TfrmLaporanKonversiDetail;

implementation

uses fGlobalVar, fGlobalVarDM;

{$R *.dfm}

procedure TfrmLaporanKonversiDetail.btnGeneralEditClick(Sender: TObject);
begin
	with qryRptMaster do
  begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + DB_TABLE_RTGS2SKN_HISTORY);
    SQL.Add('WHERE CONVERT(VARCHAR(10), DateProcess, 101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', dtpTanggalKonversi.Date)));
    //SQL.Add('AND Status=1 ');
    if cboStatusKonversi.ItemIndex > 0 then
    	SQL.Add(Format('AND Status=%d', [cboStatusKonversi.ItemIndex-1]));
    SQL.Add('Order by FileName, HSessionNumber, ConvertType, Status, SeqNumber ');
    Open;

    if Recordcount = 0 then
    begin
      Application.MessageBox('Data tidak ada.', PChar(Self.Caption), MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    frxReport1.ShowReport();

  end;

end;

procedure TfrmLaporanKonversiDetail.FormCreate(Sender: TObject);
begin
	if qryRptMaster.Active then
  	qryRptMaster.Close;
  qryRptMaster.ConnectionString := '';
  qryRptMaster.Connection := GlobalVarDM.DailyADOConn;
end;

procedure TfrmLaporanKonversiDetail.FormShow(Sender: TObject);
begin
	dtpTanggalKonversi.Date := Date;
	case FReportType of
  	1:
    	begin
        Self.Caption := 'Lap.Konversi Data Format SKN';
      	FReportTitle := 'Laporan Konversi Data Format SKN';
      end;
    2:
    	begin
        Self.Caption := 'Lap.Konversi Data Format REMM';
      	FReportTitle := 'Laporan Konversi Data Format REMM';
      end;
  end;

end;

procedure TfrmLaporanKonversiDetail.btnGeneralSaveClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmLaporanKonversiDetail.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin

	if VarName = 'TGL_KLIRING' then
  	Value := 'Tanggal Konversi: ' + FormatDateTime('dd/mm/yyyy', dtpTanggalKonversi.Date);

  if VarName = 'NAMA_BANK' then
  	Value := GlobalVarForm.BankName;

  (*
  if VarName='FReportType' then
  begin
  	case cboStatusKonversi.ItemIndex of
    	1: Value := 1;
      else
      	Value := 0;
    end;
  end;
  *)
	if VarName='HEADER' then
  begin
    case cboStatusKonversi.ItemIndex of
      1: Value := FReportTitle + ' - Status Gagal';
      2: Value := FReportTitle + ' - Status Berhasil';
      else
      	Value := FReportTitle;
    end;
  end;
end;

end.
