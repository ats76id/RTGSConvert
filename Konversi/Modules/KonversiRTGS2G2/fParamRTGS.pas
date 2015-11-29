unit fParamRTGS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvEdBtn, AdvDirectoryEdit, AdvOfficeButtons, StdCtrls, AdvEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox, Buttons, ExtCtrls,
  AdvPanel, Grids, DBGrids, CEnterAsTab, AdvOfficePager,
  AdvOfficePagerStylers, DB, ADODB, LMDCustomComboBox, LMDComboBox, XPMan;

type
  TfrmParamRTGSConvert = class(TForm)
    AdvPanelStyler1: TAdvPanelStyler;
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    btnGeneralEdit: TBitBtn;
    btnGeneralSave: TBitBtn;
    pgcStyler: TAdvOfficePagerOfficeStyler;
    pageControl: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    AdvOfficePager12: TAdvOfficePage;
    EnterAsTab2: TEnterAsTab;
    AdvGlowButton1: TBitBtn;
    btnOpenDir: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtFileName: TAdvEdit;
    cbxMultipleOption: TAdvOfficeCheckBox;
    edtFolder: TAdvDirectoryEdit;
    Panel1: TPanel;
    grdTC: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tblKonversiTC: TADOTable;
    dsKonversiTC: TDataSource;
    LMDGroupBox1: TLMDGroupBox;
    lstTRN: TListBox;
    cboTRN: TLMDComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    XPManifest1: TXPManifest;
    procedure FormShow(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
    procedure btnGeneralSaveClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    procedure FillTRN;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRTGSConvert: TfrmParamRTGSConvert;

implementation

uses fGlobalVar, fGlobalVarDM, fAddTC;

{$R *.dfm}

procedure TfrmParamRTGSConvert.FormShow(Sender: TObject);
begin
	edtFileName.Text 	:= GlobalVarForm.RTGSConvertFileName;
  edtFolder.Text 		:= GlobalVarForm.RTGSConvertFolder;
  cbxMultipleOption.Checked := GlobalVarForm.RTGSConvertMultipleConvert;

  lstTRN.Items.DelimitedText := GlobalVarForm.RTGSListTRNConvert;
  tblKonversiTC.Open;
  FillTRN;
  pageControl.ActivePageIndex := 0;
end;

procedure TfrmParamRTGSConvert.btnGeneralEditClick(Sender: TObject);
begin
	GlobalVarForm.RTGSConvertFileName := edtFileName.Text;
  GlobalVarForm.RTGSConvertFolder := edtFolder.Text;
  GlobalVarForm.RTGSConvertMultipleConvert := cbxMultipleOption.Checked;
  GlobalVarForm.RTGSListTRNConvert := lstTRN.Items.DelimitedText;

  Application.MessageBox('Parameter berhasil disimpan.', PChar(Application.Title), MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;
end;

procedure TfrmParamRTGSConvert.btnGeneralSaveClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TfrmParamRTGSConvert.BitBtn1Click(Sender: TObject);
begin
  frmAddTC.Caption := 'Tambah Mapping TRN';
  frmAddTC.edtTCLama.Text := '';
  frmAddTC.edtTCBaru.Text := '';
  frmAddTC.edtTCLama.Enabled := True;
	frmAddTC.ShowModal;
  if frmAddTC.ModalResult = mrOK then
  begin
  	try
      tblKonversiTC.Insert;
      tblKonversiTC.FieldByName('TC_LAMA').AsString := frmAddTC.TCLama;
      tblKonversiTC.FieldByName('TC_BARU').AsString := frmAddTC.TCBaru;
      tblKonversiTC.Post;

      FillTRN;
    except
      On E:Exception do
      begin
        if Pos('duplicate', e.Message) > 0 then
        begin
        	Application.MessageBox(PChar(Format('Konversi %s -> %s sudah ada. Proses dibatalkan.', [frmAddTC.TCLama, frmAddTC.TCBaru])),
           PChar(Self.Caption), MB_OK + MB_ICONSTOP);
          if tblKonversiTC.State in [dsInsert, dsEdit] then
          	tblKonversiTC.Cancel;
        end
        else
        	Application.MessageBox(PChar(E.Message), PChar(Self.Caption), MB_OK + MB_ICONSTOP);
      end;
    end;
  end;
end;

procedure TfrmParamRTGSConvert.FormCreate(Sender: TObject);
begin
	if tblKonversiTC.Active then
  	tblKonversiTC.Close;
  tblKonversiTC.Connection := GlobalVarDM.DailyADOConn;
  tblKonversiTC.TableName := DB_TABLE_REF_KONVERSI_TC;
end;

procedure TfrmParamRTGSConvert.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	if tblKonversiTC.Active then
  	tblKonversiTC.Close;
end;

procedure TfrmParamRTGSConvert.BitBtn2Click(Sender: TObject);
begin
	if (tblKonversiTC.RecordCount>0) and (grdTC.SelectedIndex >= 0) then
  begin
    with frmAddTC do
    begin
      frmAddTC.Caption := 'Edit Mapping TRN';
      edtTCLama.Text := tblKonversiTC.FieldByName('TC_LAMA').AsString;
      edtTCBaru.Text := tblKonversiTC.FieldByName('TC_BARU').AsString;
      edtTCLama.Enabled := False;
      ShowModal;

      if ModalResult = mrOK then
      begin
        try
        	tblKonversiTC.Edit;
        	tblKonversiTC.FieldByName('TC_BARU').AsString := edtTCBaru.Text;
        	tblKonversiTC.Post;

          FillTRN;
        except
          on E:Exception do
          begin
            if Pos('duplicate', e.Message) > 0 then
            begin
              Application.MessageBox(PChar(Format('Konversi %s -> %s sudah ada. Proses dibatalkan.', [frmAddTC.TCLama, frmAddTC.TCBaru])),
               PChar(Self.Caption), MB_OK + MB_ICONSTOP);
              if tblKonversiTC.State in [dsInsert, dsEdit] then
                tblKonversiTC.Cancel;
            end
            else
              Application.MessageBox(PChar(E.Message), PChar(Self.Caption), MB_OK + MB_ICONSTOP);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmParamRTGSConvert.BitBtn3Click(Sender: TObject);
begin
	if (tblKonversiTC.RecordCount>0) and (grdTC.SelectedIndex >= 0) then
	begin
    if Application.MessageBox(PChar(Format('Konversi TC %s -> %s akan dihapus. Lanjutkan ?', [tblKonversiTC.FieldByName('TC_LAMA').AsString, tblKonversiTC.FieldByName('TC_BARU').AsString])),
    	PChar(Self.Caption), MB_YESNO + MB_ICONQUESTION) =
      IDYES then
    begin
			try
      	tblKonversiTC.Delete;
        FillTRN;
      except
        On E:Exception do
        begin
          Application.MessageBox(PChar(E.Message), PChar(Self.Caption), MB_OK + MB_ICONSTOP);
        end;
      end;
    end;

  end;
end;

procedure TfrmParamRTGSConvert.FillTRN;
var
  book:TBookmark;
begin
  cboTRN.Clear;
  book := tblKonversiTC.GetBookmark;
	try
  	tblKonversiTC.DisableControls;
    with tblKonversiTC do
    begin
      First;
      while not eof do
      begin
      	if cboTRN.Items.IndexOf(tblKonversiTC.FieldByName('TC_LAMA').AsString) < 0 then
        	cboTRN.Items.Add(tblKonversiTC.FieldByName('TC_LAMA').AsString);
        Next;
      end;
    end;

    tblKonversiTC.GotoBookmark(book);
    (*
    if cboTRN.Items.Count > 0 then
    	cboTRN.ItemIndex := 0;
    *)
    cboTRN.ItemIndex := -1;
    cboTRN.Text := '';
  finally
  	tblKonversiTC.FreeBookmark(book);
    tblKonversiTC.EnableControls;
  end;
end;

procedure TfrmParamRTGSConvert.BitBtn4Click(Sender: TObject);
begin
  if Trim(cboTRN.Text)='' then
  begin
    Application.MessageBox('Silahkan Pilih TRN.', PChar(Self.Caption), MB_OK + MB_ICONWARNING);
    cboTRN.SetFocus;
  	Exit;
  end;

	if lstTRN.Items.IndexOf(cboTRN.Text) < 0 then
  begin
  	lstTRN.Items.Add(cboTRN.Text);
    cboTRN.ItemIndex := -1;
    cboTRN.Text := '';
  end
  else begin
    Application.MessageBox(PChar(Format('TRN %s Sudah ada.',[cboTRN.Text])), PChar(Self.Caption), MB_OK + MB_ICONINFORMATION);
    lstTRN.ItemIndex := lstTRN.Items.IndexOf(cboTRN.Text);
    cboTRN.ItemIndex := -1;
    cboTRN.Text := '';
  end;
end;

procedure TfrmParamRTGSConvert.BitBtn5Click(Sender: TObject);
begin
	if lstTRN.ItemIndex >= 0 then
  begin
  	lstTRN.Items.Delete(lstTRN.ItemIndex);
  end;
end;

end.
