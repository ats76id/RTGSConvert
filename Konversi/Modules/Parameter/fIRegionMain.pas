unit fIRegionMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids, 
  ExtCtrls, AdvPanel, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons;

type
  TfrmRegionMain = class(TForm)
    dsIRegion: TDataSource;
    qryIRegion: TADOQuery;
    qryUpdate: TADOQuery;
    AdvPanel1: TAdvPanel;
    grdIRegion: TDBGrid;
    btnGeneralEdit: TcxButton;
    AdvGlowButton1: TcxButton;
    AdvGlowButton2: TcxButton;
    AdvGlowButton3: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGeneralEditClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegionMain: TfrmRegionMain;

implementation

uses fGlobalVar, fGlobalVarDM, fIRegionAdd, fConst, uSetting;

{$R *.dfm}

procedure TfrmRegionMain.FormCreate(Sender: TObject);
begin
	if qryIRegion.Active then
  	qryIRegion.Close;
  qryIRegion.Connection := GlobalVarDM.DailyADOConn;

	if qryUpdate.Active then
  	qryUpdate.Close;
  qryUpdate.Connection := GlobalVarDM.DailyADOConn;
end;

procedure TfrmRegionMain.FormShow(Sender: TObject);
begin
	with qryIRegion do
  begin
  	SQL.Text := Format('SELECT * FROM %s ORDER BY ir_code ', [DB_TABLE_IREGION]);
    Open;
  end;

  grdIRegion.SetFocus;
end;

procedure TfrmRegionMain.btnGeneralEditClick(Sender: TObject);
var
	intBrId : Integer;
begin
	with frmRegionAdd do
  begin
    Tag := 1;
    Caption := 'Tambah Wilayah';
  	edtSandiWilayah.Clear;
    edtNamaWilayah.Clear;

    ShowModal;
    if ModalResult = mrOK then
    begin
    	with qryUpdate do
      begin
        SQL.Text:=Format('INSERT INTO %s(ir_code, ir_name) VALUES(''%s'', ''%s'') ',
          [DB_TABLE_IREGION, edtSandiWilayah.Text, edtNamaWilayah.Text]);
        try
          ExecSQL;
          GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('Tambah parameter wilayah internal [%s]', [edtSandiWilayah.Text]));
        except
          on E:Exception do
          begin
            if Pos('duplicate', E.Message)>0 then
              MessageDlg(Format('Wilayah [%s] sudah ada.',[edtSandiWilayah.Text]), mtError, [mbOK], 0)
            else
              MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        end;
      end;
      qryIRegion.Close;
      qryIRegion.Open;
    end;
  end;
end;

procedure TfrmRegionMain.AdvGlowButton1Click(Sender: TObject);
var
	brCode:string;
begin
  if (qryIRegion.RecordCount>0) and (grdIRegion.SelectedIndex>=0) then
  begin
    with frmRegionAdd do
    begin
    	brCode := qryIRegion.FieldByName('ir_code').AsString;
      Caption := 'Edit Wilayah';
      edtSandiWilayah.Text := qryIRegion.FieldByName('ir_code').AsString;
      edtNamaWilayah.Text := qryIRegion.FieldByName('ir_name').AsString;

      Tag:=2; //Edit mode

      if ShowModal=mrOK then
      begin
        with qryUpdate do
        begin
          SQL.Text:=Format('UPDATE %s SET ir_name=''%s'' WHERE ir_code =''%s'' ',
            [DB_TABLE_IREGION, edtNamaWilayah.Text, brCode]);
          try
            ExecSQL;
            GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('Edit parameter wilayah internal [%s]', [brCode]));
          except
            on E:Exception do
            begin
              if Pos('duplicate', E.Message)>0 then
                MessageDlg(Format('Wilayah [%s] sudah ada.',[edtSandiWilayah.Text]), mtError, [mbOK], 0)
              else
                MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
          end;
        end;
        qryIRegion.Close;
        qryIRegion.Open;
      end;
    end;
  end;
end;

procedure TfrmRegionMain.AdvGlowButton2Click(Sender: TObject);
var
	strIRCode:string;
begin
  if (qryIRegion.RecordCount>0) and (grdIRegion.SelectedIndex>=0)
    and (MessageDlg(Format('Yakin ingin menghapus sandi wilayah [%s]?',
    [qryIRegion.FieldByName('ir_code').AsString]),
     mtConfirmation, [mbYes, mbNo] ,0) = mrYes) then
  begin
  	strIRCode := qryIRegion.FieldByName('ir_code').AsString;
    with qryUpdate do
    begin
      SQL.Text:=Format('DELETE FROM %s WHERE ir_code=''%s'' ',
        [DB_TABLE_IREGION, qryIRegion.FieldByName('ir_code').AsString]);
      ExecSQL;
      GlobalVarDM.DoWriteLogDaily(UserName, MDL_PS, Format('Hapus parameter wilayah internal [%s]', [strIRCode]));
      qryIRegion.Close;
      qryIRegion.Open;
    end;
  end;

end;

procedure TfrmRegionMain.AdvGlowButton3Click(Sender: TObject);
begin
	Close;
end;

end.
