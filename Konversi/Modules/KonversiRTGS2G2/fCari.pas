unit fCari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, 
  DB, ADODB, DBGrids,
  JvExDBGrids, JvDBGrid, JvExMask, JvMaskEdit,
  JvDBFindEdit, StdCtrls, JvExStdCtrls, JvEdit, JvDBSearchEdit, JvCombobox,
  JvDBSearchComboBox, JvDBUltimGrid, ExtCtrls, AdvPanel, ComCtrls,
  AdvDateTimePicker, 
  AdvCombo, AdvEdit,
  JvValidateEdit, advlued, XPMan, Buttons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmCari = class(TForm)
    DataSource1: TDataSource;
    JvDBGrid1: TJvDBGrid;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    edtTanggalKonversi: TAdvDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    cboJenisKonversi: TAdvComboBox;
    Label3: TLabel;
    edtNominal: TJvValidateEdit;
    Label4: TLabel;
    edtNoReff: TAdvLUEdit;
    Label5: TLabel;
    edtToMember: TAdvLUEdit;
    XPManifest1: TXPManifest;
    qrySearch: TADOQuery;
    AdvGlowButton1: TcxButton;
    AdvGlowButton2: TcxButton;
    procedure edtTanggalKonversiChange(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
    procedure DoQuery;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCari: TfrmCari;

implementation

uses fGlobalVar, fGlobalVarDM;

{$R *.dfm}

procedure TfrmCari.edtTanggalKonversiChange(Sender: TObject);
begin
  if qrySearch.Active then
		qrySearch.Close;
end;

procedure TfrmCari.AdvGlowButton1Click(Sender: TObject);
begin
	DoQuery;

  If qrySearch.RecordCount = 0 then
  begin
    Application.MessageBox('Data tidak ditemukan.', PChar(Self.Caption), MB_OK +
      MB_ICONINFORMATION);
  end;
end;

procedure TfrmCari.DoQuery;
begin
	with qrySearch do
  begin
    if Active then Close;
    Connection := GlobalVarDM.DailyADOConn;

    SQL.Clear;

    if (cboJenisKonversi.ItemIndex = 0) or (cboJenisKonversi.ItemIndex < 3) then
    begin
      SQL.Add('select ConvertType=Case When ConvertType=1 then ''DKOI'' Else ''REMM'' END, RelRef, FromMember, ToMember, TransactionCode, ValueDate');
      SQL.Add(',Amount=CONVERT(NUMERIC(20,2), Amount)/100 , FromAccountNumber,FromAccountName,');
      SQL.Add('ToAccountNumber, ToAccountName, OriginatingName, UltimateBeneAccount, UltimateBeneName, Currency,');
      SQL.Add('SAKTINumber, PaymentDetails,G1File AS SourceFile,FileName As DestFile  from ' + DB_TABLE_RTGS2SKN_HISTORY);
      SQL.Add('where CONVERT(VARCHAR(10), DateProcess, 101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtTanggalKonversi.Date)));
      if cboJenisKonversi.ItemIndex > 0 then
        SQL.Add('AND ConvertType=' + IntToStr(cboJenisKonversi.ItemIndex));
      if Trim(edtNoReff.Text) <> '' then
        SQL.Add('AND RefRef=' + QuotedStr(edtNoReff.Text));
      if Trim(edtToMember.Text) <> '' then
        SQL.Add('AND ToMember=' + QuotedStr(edtToMember.Text));
      if edtNominal.AsCurrency > 0 then
        SQL.Add('AND CONVERT(NUMERIC(20,2), Amount)/100 = ' + CurrToStr(edtNominal.AsCurrency));
    end;

    if (cboJenisKonversi.ItemIndex = 0) then
    	SQL.Add('UNION');

    if (cboJenisKonversi.ItemIndex = 0) OR (cboJenisKonversi.ItemIndex = 3) then
    begin
      SQL.Add('select ''SWIFT'' AS ConvertType, RelRef, FromMember, ToMember, TransactionCode, ValueDate');
      SQL.Add(',Amount=CONVERT(NUMERIC(20,2), Amount)/100 , FromAccountNumber,FromAccountName,');
      SQL.Add('ToAccountNumber, ToAccountName, OriginatingName, UltimateBeneAccount, UltimateBeneName, Currency,');
      SQL.Add('SAKTINumber, PaymentDetails,G1File As SourceFile, FileName As DestFile from ' + DB_TABLE_RTGS2SWIFT_HISTORY);
      SQL.Add('where CONVERT(VARCHAR(10), DateProcess, 101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', edtTanggalKonversi.Date)));
      if Trim(edtNoReff.Text) <> '' then
        SQL.Add('AND RefRef=' + QuotedStr(edtNoReff.Text));
      if Trim(edtToMember.Text) <> '' then
        SQL.Add('AND ToMember=' + QuotedStr(edtToMember.Text));
      if edtNominal.AsCurrency > 0 then
        SQL.Add('AND CONVERT(NUMERIC(20,2), Amount)/100 = ' + CurrToStr(edtNominal.AsCurrency));
    end;

    SQL.Add('ORDER BY ConvertType');
    Open;
  end;

  TNumericField(qrySearch.FieldByName('Amount')).DisplayFormat := '###,###.00';
end;

procedure TfrmCari.FormCreate(Sender: TObject);
begin
	with qrySearch do
  begin
    if Active then Close;
    Connection := GlobalVarDM.DailyADOConn;
	end;
end;

procedure TfrmCari.FormShow(Sender: TObject);
begin
	edtTanggalKonversi.Date := Date;
  cboJenisKonversi.ItemIndex := 0;
end;

procedure TfrmCari.AdvGlowButton2Click(Sender: TObject);
begin
	Close;
end;

end.
