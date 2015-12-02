unit fLaporanPerProses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ADODB, ComCtrls, AdvDateTimePicker,
  StdCtrls, AdvGroupBox, Buttons, ExtCtrls, AdvPanel, XPMan,
  AdvOfficeButtons;

type
  TfrmLaporanPerProses = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    AdvGroupBox1: TAdvGroupBox;
    Label1: TLabel;
    dtpTanggalKonversi: TAdvDateTimePicker;
    qryRptMaster: TADOQuery;
    dsRptMaster: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    ragJenisKonversi: TAdvOfficeRadioGroup;
    XPManifest1: TXPManifest;
    XPManifest2: TXPManifest;
    btnGeneralEdit: TBitBtn;
    btnGeneralSave: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure btnGeneralSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaporanPerProses: TfrmLaporanPerProses;

implementation

uses fGlobalVarDM, fGlobalVar;

{$R *.dfm}

procedure TfrmLaporanPerProses.FormShow(Sender: TObject);
begin
	dtpTanggalKonversi.Date := Date;
end;

procedure TfrmLaporanPerProses.FormCreate(Sender: TObject);
begin
	if qryRptMaster.Active then
  	Close;
  qryRptMaster.ConnectionString := '';
  qryRptMaster.Connection := GlobalVarDM.DailyADOConn;
end;

procedure TfrmLaporanPerProses.btnGeneralEditClick(Sender: TObject);
begin
	with qryRptMaster do
  begin
    if ragJenisKonversi.ItemIndex = 3 then
    begin
      if Active then
      	Close;
      SQL.Clear;
      SQL.Add('SELECT 3 AS ConvertType, DateProcess=CONVERT(VARCHAR(8), DateProcess, 108), FileName');
      SQL.Add(',SUM(1) AS HCreditCount');
      SQL.Add(',SUM(CONVERT(NUMERIC(20,2), Amount,206)/100) AS HCreditAmount');
      SQL.Add(',SUM(CASE WHEN Status=1 THEN 1 ELSE 0 END) as TotalItemBerhasil');
      SQL.Add(',SUM(CASE WHEN Status=1 THEN CONVERT(NUMERIC(20,2), Amount,206)/100 ELSE 0 END) as TotalNominalBerhasil');
      SQL.Add(',SUM(CASE WHEN Status=0 THEN 1 ELSE 0 end) as TotalItemGagal');
      SQL.Add(',SUM(CASE WHEN Status=0 THEN CONVERT(NUMERIC(20,2), Amount,206)/100 ELSE 0 end) as TotalNominalGagal');
      SQL.Add(',SUM(CASE WHEN Status=2 THEN 1 ELSE 0 end) as TotalItemHapus');
      SQL.Add(',SUM(CASE WHEN Status=2 THEN CONVERT(NUMERIC(20,2), Amount,206)/100 ELSE 0 end) as TotalNominalHapus');
      SQL.Add('FROM RTGSG1History');
      SQL.Add('WHERE CONVERT(VARCHAR(10), DateProcess, 101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', dtpTanggalKonversi.Date)));
      SQL.Add('Group by DateProcess, FileName');
    end
    else begin
      if Active then Close;
      SQL.Clear;
      SQL.Add('SELECT ConvertType');
      SQL.Add(',DateProcess=CONVERT(VARCHAR(8), DateProcess, 108)');
      SQL.Add(',FIleName, SUM(1) AS HCreditCount, SUM(CONVERT(NUMERIC(20,2), Amount,206)/100) AS HCreditAmount');
      SQL.Add(',SUM(CASE WHEN Status=1 THEN 1 ELSE 0 END) as TotalItemBerhasil');
      SQL.Add(',SUM(CASE WHEN Status=1 THEN CONVERT(NUMERIC(20,2), Amount,206)/100 ELSE 0 END) as TotalNominalBerhasil');
      SQL.Add(',SUM(CASE WHEN Status=0 THEN 1 ELSE 0 end) as TotalItemGagal');
      SQL.Add(',SUM(CASE WHEN Status=0 THEN CONVERT(NUMERIC(20,2), Amount,206)/100 ELSE 0 end) as TotalNominalGagal');
      SQL.Add(',SUM(CASE WHEN Status=2 THEN 1 ELSE 0 end) as TotalItemHapus');
      SQL.Add(',SUM(CASE WHEN Status=2 THEN CONVERT(NUMERIC(20,2), Amount,206)/100 ELSE 0 end) as TotalNominalHapus');
      SQL.Add('FROM ' + DB_TABLE_RTGS2SKN_HISTORY);
      SQL.Add('WHERE CONVERT(VARCHAR(10), DateProcess, 101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', dtpTanggalKonversi.Date)));
      case ragJenisKonversi.ItemIndex of
        1: SQL.Add('AND ConvertType=1');
        2: SQL.Add('AND ConvertType=2');
      end;
      SQL.Add('Group by ConvertType, DateProcess, FIleName');

			if ragJenisKonversi.ItemIndex = 0 then
      begin
        SQL.Add('UNION SELECT 3 AS ConvertType, DateProcess=CONVERT(VARCHAR(8), DateProcess, 108), FileName');
        SQL.Add(',SUM(1) AS HCreditCount');
        SQL.Add(',SUM(CONVERT(NUMERIC(20,2), Amount,206)/100) AS HCreditAmount');
        SQL.Add(',SUM(CASE WHEN Status=1 THEN 1 ELSE 0 END) as TotalItemBerhasil');
        SQL.Add(',SUM(CASE WHEN Status=1 THEN CONVERT(NUMERIC(20,2), Amount,206)/100 ELSE 0 END) as TotalNominalBerhasil');
        SQL.Add(',SUM(CASE WHEN Status=0 THEN 1 ELSE 0 end) as TotalItemGagal');
        SQL.Add(',SUM(CASE WHEN Status=0 THEN CONVERT(NUMERIC(20,2), Amount,206)/100 ELSE 0 end) as TotalNominalGagal');
        SQL.Add(',SUM(CASE WHEN Status=2 THEN 1 ELSE 0 end) as TotalItemHapus');
        SQL.Add(',SUM(CASE WHEN Status=2 THEN CONVERT(NUMERIC(20,2), Amount,206)/100 ELSE 0 end) as TotalNominalHapus');
        SQL.Add('FROM RTGSG1History');
      	SQL.Add('WHERE CONVERT(VARCHAR(10), DateProcess, 101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', dtpTanggalKonversi.Date)));
        SQL.Add('Group by DateProcess, FileName');
      end;
    end;
    SQL.Add('order by ConvertType, DateProcess, FIleName');
    Open;

    if Recordcount = 0 then
    begin
      Application.MessageBox('Data tidak ada.', PChar(Self.Caption), MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    frxReport1.ShowReport();

  end;
end;

procedure TfrmLaporanPerProses.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
	if VarName = 'TGL_KLIRING' then
  	Value := 'Tanggal Konversi: ' + FormatDateTime('dd/mm/yyyy', dtpTanggalKonversi.Date);

  if VarName = 'NAMA_BANK' then
  	Value := GlobalVarForm.BankName;
end;

procedure TfrmLaporanPerProses.btnGeneralSaveClick(Sender: TObject);
begin
	Close;
end;

end.
