unit fIBranchMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, JvExControls,
  JvDBLookup, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomGroupBox,
  LMDGroupBox, AdvPanel, JvExStdCtrls, JvEdit,
  JvValidateEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons;

type
  TfrmiBranchMain = class(TForm)
    dsIbranch: TDataSource;
    qryIBranch: TADOQuery;
    qryUpdate: TADOQuery;
    qryRegion: TADOQuery;
    dsRegion: TDataSource;
    AdvPanel1: TAdvPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    LMDGroupBox1: TLMDGroupBox;
    Label1: TLabel;
    RegionLookup: TJvDBLookupCombo;
    grdIBranch: TDBGrid;
    edtNamaWilayah: TJvValidateEdit;
    btnGeneralEdit: TcxButton;
    AdvGlowButton1: TcxButton;
    AdvGlowButton2: TcxButton;
    AdvGlowButton3: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RegionLookupChange(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
  private
    { rocePrivate declarations }
    procedure DoOpenData;
  public
    { Public declarations }
  end;

var
  frmiBranchMain: TfrmiBranchMain;

implementation

uses fIBranchAdd, fGlobalVar, fGlobalVarDM,
  fConst, uSetting, Math;

{$R *.dfm}

procedure TfrmiBranchMain.FormCreate(Sender: TObject);
begin
	if qryRegion.Active then
  	qryRegion.Close;

  qryRegion.Connection := GlobalVarDM.DailyADOConn;

	if qryIBranch.Active then
  	qryIBranch.Close;

  qryIBranch.Connection := GlobalVarDM.DailyADOConn;

	if qryUpdate.Active then
  	qryUpdate.Close;

  qryUpdate.Connection := GlobalVarDM.DailyADOConn;
end;

procedure TfrmiBranchMain.FormShow(Sender: TObject);
begin
	with qryRegion do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + DB_TABLE_IREGION + ' ORDER BY ir_code ');
    Open;
  end;

  DoOpenData;
  grdIBranch.SetFocus;
end;

procedure TfrmiBranchMain.DoOpenData;
begin
  with qryIBranch do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT br.*, rg.ir_name FROM ' + DB_TABLE_IBRANCH + ' br ');
		SQL.Add('LEFT JOIN ' + DB_TABLE_IREGION + ' rg ON rg.ir_code=br.ib_ir_code');
    if GlobalVarForm.DBType = 1 then
    	SQL.Add('WHERE (br.ib_parent=''0'' or br.ib_parent is null or TRIM(br.ib_parent)='''') ')
    else
    	SQL.Add('WHERE (br.ib_parent=''0'' or br.ib_parent is null or LTRIM(RTRIM(br.ib_parent))='''') ');
    if Trim(RegionLookup.Value) <> '' then
    	SQL.Add(' and br.ib_ir_code=' + QuotedStr(RegionLookup.Value));
    SQL.Add(' ORDER BY ib_code');

    Open;
  end;
end;

procedure TfrmiBranchMain.RegionLookupChange(Sender: TObject);
begin
  if Trim(RegionLookup.Value) <> '' then
		edtNamaWilayah.Text := qryRegion.FieldByName('ir_name').AsString
  else
  	edtNamaWilayah.Text := '';

	DoOpenData;
end;

procedure TfrmiBranchMain.btnGeneralEditClick(Sender: TObject);
var
	intBrId : Integer;
begin
	with frmiBranchAdd do
  begin
    Tag := 1;
    Caption := 'Tambah Cabang';
  	edtSandiCabang.Clear;
    edtSandiBI.Clear;
    edtNamaCabang.Clear;
    memAddress.Clear;
    dblRegion.Value := RegionLookup.Value;
    dblWilayahKliring.ClearValue;
    cbxKoordinatorKota.Checked := False;
    dblKota.ClearValue;

    DoOpenRegion;
    ShowModal;
    if ModalResult = mrOK then
    begin
    	with qryUpdate do
      begin
        SQL.Text:=Format('INSERT INTO %s(ib_code, ib_br_code, ib_name, ib_Address, ib_parent, ib_ir_code, ib_region_code, ib_flag_city_cord, ib_city_code) ' +
         								 'VALUES(''%s'', ''%s'', ''%s'', ''%s'', ''0'', ''%s'', ''%s'', %d, ''%s'') ',
          [DB_TABLE_IBRANCH, edtSandiCabang.text, edtSandiBI.Text, edtNamaCabang.Text, memAddress.Text, dblRegion.Value, dblWilayahKliring.Value, IfThen(cbxKoordinatorKota.Checked, 1, 0), dblKota.Value]);
        try
          ExecSQL;
          GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('Tambah cabang utama [%s]', [edtSandiCabang.text]));
        except
          on E:Exception do
          begin
            if Pos('duplicate', E.Message)>0 then
              MessageDlg(Format('Cabang [%s] sudah ada.',[edtSandiCabang.Text]), mtError, [mbOK], 0)
            else
              MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        end;
      end;
      qryIBranch.Close;
      qryIBranch.Open;
    end;
  end;
end;

procedure TfrmiBranchMain.AdvGlowButton1Click(Sender: TObject);
var
	brId:string;
begin
  if (qryIBranch.RecordCount>0) and (grdIBranch.SelectedIndex>=0) then
  begin
    with frmiBranchAdd do
    begin
      DoOpenRegion;

    	brId := qryIBranch.FieldByName('ib_code').AsString;
      Caption := 'Edit Cabang';
      edtSandiCabang.Text := qryIBranch.FieldByName('ib_code').AsString;
      edtSandiBI.Text := qryIBranch.FieldByName('ib_br_code').AsString;
      edtNamaCabang.Text := qryIBranch.FieldByName('ib_name').AsString;
      memAddress.Text := qryIBranch.FieldByName('ib_address').AsString;
      dblRegion.Value := qryIBranch.FieldByName('ib_ir_code').AsString;
      dblWilayahKliring.Value := qryIBranch.FieldByName('ib_region_code').AsString;
      cbxKoordinatorKota.Checked := qryIBranch.FieldByName('ib_flag_city_cord').AsInteger = 1;
      dblKota.Value := qryIBranch.FieldByName('ib_city_code').AsString;

      Tag:=2; //Edit mode

      if ShowModal=mrOK then
      begin
        with qryUpdate do
        begin
          SQL.Text:=Format('UPDATE %s SET ib_name=''%s'', ib_br_code=''%s'', ib_address=''%s'', ib_ir_code=''%s'', ib_region_code=''%s'', ib_flag_city_cord=%d, ib_city_code=''%s'' WHERE ib_code =''%s'' ',
            [DB_TABLE_IBRANCH, edtNamaCabang.Text, edtSandiBI.Text, memAddress.Text, dblRegion.Value, dblWilayahKliring.Value, IfThen(cbxKoordinatorKota.Checked,1,0), dblKota.Value, brId]);
          try
            ExecSQL;
            GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('Edit cabang utama [%s]', [edtSandiCabang.text]));
          except
            on E:Exception do
            begin
              if Pos('duplicate', E.Message)>0 then
                MessageDlg(Format('Cabang [%s] sudah ada.',[edtSandiCabang.Text]), mtError, [mbOK], 0)
              else
                MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
          end;
        end;
        qryIBranch.Close;
        qryIBranch.Open;
      end;
    end;
  end;
end;

procedure TfrmiBranchMain.AdvGlowButton2Click(Sender: TObject);
var
	strBranchCode:string;
begin
  if (qryIBranch.RecordCount>0) and (grdIBranch.SelectedIndex>=0)
    and (MessageDlg(Format('Yakin ingin menghapus sandi cabang [%s]?',
    [qryIBranch.FieldByName('ib_code').AsString]),
     mtConfirmation, [mbYes, mbNo] ,0) = mrYes) then
  begin
  	strBranchCode := qryIBranch.FieldByName('ib_code').AsString;
    with qryUpdate do
    begin
      SQL.Text:=Format('DELETE FROM %s WHERE ib_code=''%s'' ',
        [DB_TABLE_IBRANCH, strBranchCode]);
      ExecSQL;
      GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('Hapus cabang utama [%s]', [strBranchCode]));
      qryIBranch.Close;
      qryIBranch.Open;
    end;
  end;

end;

procedure TfrmiBranchMain.AdvGlowButton3Click(Sender: TObject);
begin
	Close;
end;

end.
