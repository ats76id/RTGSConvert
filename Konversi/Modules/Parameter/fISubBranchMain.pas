unit fISubBranchMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, JvExControls, JvDBLookup, StdCtrls,
  ExtCtrls, Buttons, JvExStdCtrls, JvEdit, JvValidateEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox, 
  AdvPanel, AdvEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons;

type
  TfrmISubBranchMain = class(TForm)
    dsISubbranch: TDataSource;
    qryISubBranch: TADOQuery;
    qryUpdate: TADOQuery;
    qryRegion: TADOQuery;
    dsRegion: TDataSource;
    qryBranch: TADOQuery;
    dsBranch: TDataSource;
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    grdIBranch: TDBGrid;
    LMDGroupBox1: TLMDGroupBox;
    Label1: TLabel;
    RegionLookup: TJvDBLookupCombo;
    branchLookup: TJvDBLookupCombo;
    Label2: TLabel;
    edtNamaWilayah: TAdvEdit;
    edtNamaCabang: TAdvEdit;
    btnGeneralEdit: TcxButton;
    AdvGlowButton1: TcxButton;
    AdvGlowButton2: TcxButton;
    AdvGlowButton3: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RegionLookupChange(Sender: TObject);
    procedure branchLookupChange(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
    procedure DoOpenRegion;
    procedure DoOpenBranch;
    procedure DoOpenData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmISubBranchMain: TfrmISubBranchMain;

implementation

uses fGlobalVar, fGlobalVarDM, fISubBranchAdd, fConst, uSetting;

{$R *.dfm}

procedure TfrmISubBranchMain.FormCreate(Sender: TObject);
begin
	if qryRegion.Active then
  	qryRegion.Close;

  qryRegion.Connection := GlobalVarDM.DailyADOConn;

	if qryBranch.Active then
  	qryBranch.Close;

  qryBranch.Connection := GlobalVarDM.DailyADOConn;

	if qryISubBranch.Active then
  	qryISubBranch.Close;

  qryISubBranch.Connection := GlobalVarDM.DailyADOConn;

	if qryUpdate.Active then
  	qryUpdate.Close;

  qryUpdate.Connection := GlobalVarDM.DailyADOConn;
end;

procedure TfrmISubBranchMain.DoOpenRegion;
begin
	with qryRegion do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + DB_TABLE_IREGION + ' ORDER BY ir_code ');
    Open;
  end;
end;

procedure TfrmISubBranchMain.DoOpenBranch;
begin
	with qryBranch do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT ib_code, ib_name FROM ' + DB_TABLE_IBRANCH);
    if GlobalVarForm.DBType = 1 then
    	SQL.Add(' WHERE (ib_parent=''0'' or ib_parent is null or TRIM(ib_parent)='''') ')
    else
    	SQL.Add(' WHERE (ib_parent=''0'' or ib_parent is null or LTRIM(RTRIM(ib_parent))='''') ');
    if Trim(RegionLookup.Value) <> '' then
    	SQL.Add(' and ib_ir_code=' + QuotedStr(RegionLookup.Value));
    SQL.Add('ORDER BY ib_code ');
    Open;
  end;
end;

procedure TfrmISubBranchMain.DoOpenData;
begin
  with qryISubBranch do
  begin
  	if Active then
    	Close;
    SQL.Clear;
    SQL.Add('SELECT br.*, rg.ir_name FROM ' + DB_TABLE_IBRANCH + ' br ');
		SQL.Add('LEFT JOIN ' + DB_TABLE_IREGION + ' rg ON rg.ir_code=br.ib_ir_code ');
    if Trim(branchLookup.Value) = '' then
    begin
      if GlobalVarForm.DBType = 1 then
    		SQL.Add(' WHERE (br.ib_parent<>''0'' and br.ib_parent is not null and TRIM(br.ib_parent)<>'''') ')
      else
      	SQL.Add(' WHERE (br.ib_parent<>''0'' and br.ib_parent is not null and LTRIM(RTRIM(br.ib_parent))<>'''') ');
    end
    else
    	SQL.Add(' Where br.ib_parent=' +  QuotedStr(branchLookup.Value));

    if Trim(RegionLookup.Value) <> '' then
    	SQL.Add(' and br.ib_ir_code=' + QuotedStr(RegionLookup.Value));

    SQL.Add(' ORDER BY br.ib_code');
    //ShowMessage(sql.Text);
    Open;
  end;
end;

procedure TfrmISubBranchMain.FormShow(Sender: TObject);
begin
  DoOpenRegion;
  DoOpenBranch;
  DoOpenData;

  grdIBranch.SetFocus;
end;

procedure TfrmISubBranchMain.RegionLookupChange(Sender: TObject);
begin
  if Trim(RegionLookup.Value) = '' then
  	edtNamaWilayah.Text := ''
  else
  	edtNamaWilayah.Text := qryRegion.FieldByName('ir_name').AsString;

	DoOpenBranch;
  DoOpenData;
end;

procedure TfrmISubBranchMain.branchLookupChange(Sender: TObject);
begin
  if Trim(branchLookup.Value) = '' then
  	edtNamaCabang.Text := ''
  else
  	edtNamaCabang.Text := qryBranch.FieldByName('ib_name').AsString;

	DoOpenData;
end;

procedure TfrmISubBranchMain.AdvGlowButton3Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmISubBranchMain.btnGeneralEditClick(Sender: TObject);
begin
	with frmISubBranchAdd do
  begin
  	Tag := 1;
  	Caption := 'Tambah Capem';
    edtNamaCabang.Clear;
    dblSandaiCabang.Value := branchLookup.Value;
		edtSandiCApem.Clear;
    edtSandiBI.Clear;
    edtNamaCapem.Clear;
    memAddress.Clear;
    dblRegion.Value := RegionLookup.Value;
    dblWilayahKliring.ClearValue;
    dblKota.ClearValue;

    DoOpenReference;
    ShowModal;
    if ModalResult = mrOK then
    begin
    	with qryUpdate do
      begin
        SQL.Text:=Format('INSERT INTO %s(ib_code, ib_br_code, ib_name, ib_Address, ib_parent, ib_ir_code, ib_region_code, ib_city_code) ' +
         								 'VALUES(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'') ',
          [DB_TABLE_IBRANCH, edtSandiCApem.Text, edtSandiBI.Text, edtNamaCapem.Text, memAddress.Text, dblSandaiCabang.Value, dblRegion.Value, dblWilayahKliring.Value, dblKota.Value]);
        try
          ExecSQL;
          GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('Tambah parameter sub branch [%s]', [edtSandiCApem.Text]));
        except
          on E:Exception do
          begin
            if Pos('duplicate', E.Message)>0 then
              MessageDlg(Format('Cabang [%s] sudah ada.',[edtSandiCApem.Text]), mtError, [mbOK], 0)
            else
              MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        end;
      end;
      qryISubBranch.Close;
      qryISubBranch.Open;
    end;
  end;
end;

procedure TfrmISubBranchMain.AdvGlowButton1Click(Sender: TObject);
var
	brId:string;
begin
  if (qryISubBranch.RecordCount>0) and (grdIBranch.SelectedIndex>=0) then
  begin
    with frmISubBranchAdd do
    begin
      DoOpenReference;

    	brId := qryISubBranch.FieldByName('ib_code').AsString;
      Caption := 'Edit Capem';
      dblSandaiCabang.Value := qryISubBranch.FieldByName('ib_parent').AsString;
      edtSandiCApem.Text := qryISubBranch.FieldByName('ib_code').AsString;
      edtSandiBI.Text := qryISubBranch.FieldByName('ib_br_code').AsString;
      edtNamaCapem.Text := qryISubBranch.FieldByName('ib_name').AsString;
      memAddress.Text := qryISubBranch.FieldByName('ib_address').AsString;
      dblRegion.Value := qryISubBranch.FieldByName('ib_ir_code').AsString;
      dblWilayahKliring.Value := qryISubBranch.FieldByName('ib_region_code').AsString;
      dblKota.Value := qryISubBranch.FieldByName('ib_city_code').AsString;

      Tag:=2; //Edit mode
      ShowModal;
      if ModalResult=mrOK then
      begin
        with qryUpdate do
        begin
          SQL.Text:=Format('UPDATE %s SET ib_name=''%s'', ib_br_code=''%s'', ib_address=''%s'', ib_ir_code=''%s'', ib_region_code=''%s'', ib_parent=''%s'', ib_city_code=''%s'' WHERE ib_code =''%s'' ',
            [DB_TABLE_IBRANCH, edtNamaCapem.Text, edtSandiBI.Text, memAddress.Text, dblRegion.Value, dblWilayahKliring.Value, dblSandaiCabang.Value, dblKota.Value, brId]);
          try
            ExecSQL;
            GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('Edit parameter sub branch [%s]', [brId]));
          except
            on E:Exception do
            begin
              if Pos('duplicate', E.Message)>0 then
                MessageDlg(Format('Cabang [%s] sudah ada.',[edtSandiCApem.Text]), mtError, [mbOK], 0)
              else
                MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
          end;
        end;
        qryISubBranch.Close;
        qryISubBranch.Open;
      end;
    end;
  end;
end;

procedure TfrmISubBranchMain.AdvGlowButton2Click(Sender: TObject);
var
	strBrCode:string;
begin
  if (qryISubBranch.RecordCount>0) and (grdIBranch.SelectedIndex>=0)
    and (MessageDlg(Format('Yakin ingin menghapus sandi capem [%s]?',
    [qryISubBranch.FieldByName('ib_code').AsString]),
     mtConfirmation, [mbYes, mbNo] ,0) = mrYes) then
  begin
  	strBrCode := qryISubBranch.FieldByName('ib_code').AsString;
    with qryUpdate do
    begin
      SQL.Text:=Format('DELETE FROM %s WHERE ib_code=''%s'' ',
        [DB_TABLE_IBRANCH, qryISubBranch.FieldByName('ib_code').AsString]);
      ExecSQL;
      GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('Hapus parameter sub branch [%s]', [strBrCode]));
      qryISubBranch.Close;
      qryISubBranch.Open;
    end;
  end;
end;

end.
