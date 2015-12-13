unit fLogActivities;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, AdvDateTimePicker,
  StdCtrls, AdvGroupBox, Grids, DBGrids, DB, ADODB, Buttons, XPMan,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons;

type
	TLogType = (ltNone, ltTrx, ltUser);

  TfrmAppLog = class(TForm)
    AdvPanel1: TAdvPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    AdvGroupBox1: TAdvGroupBox;
    Label1: TLabel;
    dtTglKliring: TAdvDateTimePicker;
    qryLogTrx: TADOQuery;
    dsLog: TDataSource;
    qryLogTrxlog_id: TAutoIncField;
    qryLogTrxlog_date: TDateTimeField;
    qryLogTrxlog_user: TWideStringField;
    qryLogTrxlog_module: TSmallintField;
    qryLogTrxlog_desc: TWideStringField;
    qryLogUser: TADOQuery;
    qryLogUserlog_id: TAutoIncField;
    qryLogUserlog_time: TDateTimeField;
    qryLogUserlog_module: TSmallintField;
    qryLogUserlog_desc: TWideStringField;
    qryLogUseruser_name: TWideStringField;
    Label2: TLabel;
    edtUser: TEdit;
    Label3: TLabel;
    edtDesc: TEdit;
    XPManifest1: TXPManifest;
    btnRefresh: TcxButton;
    btnClose: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtTglKliringChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure qryLogTrxlog_moduleGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryLogTrxlog_userGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryLogUseruser_nameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryLogUserlog_moduleGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryLogTrxlog_dateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryLogUserlog_timeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
  	FLogType : TLogType;
    procedure DoOpenLog;
    { Private declarations }
  public
    { Public declarations }
    property LogType:TLogType read FLogType write FLogType;
  end;

var
  frmAppLog: TfrmAppLog;

implementation

uses fConst, fGlobalVar, fGlobalVarDM, fUserLib;

{$R *.dfm}

procedure TfrmAppLog.FormCreate(Sender: TObject);
begin
	FLogType := ltNone;

	if qryLogTrx.Active then
  	qryLogTrx.Close;
  qryLogTrx.Connection := GlobalVarDM.DailyADOConn;

	if qryLogUser.Active then
  	qryLogUser.Close;
  qryLogUser.Connection := GlobalVarDM.MainADOConn;
end;

procedure TfrmAppLog.DoOpenLog;
begin
	case FLogType of
  	ltTrx :
    	begin
      	dsLog.DataSet := qryLogTrx;
        with qryLogTrx do
        begin
          if Active then
            Close;
          sql.Clear;
          SQL.Add('SELECT * FROM ' + DB_TABLE_TRX_LOGS);
          if GlobalVarForm.DBType = 1 then
          	SQL.Add(Format('where (Format(log_date, ''mm/dd/yyyy'')=''%s'') ', [FormatDateTime('mm/dd/yyyy', dtTglKliring.Date)]))
          else
          	SQL.Add(Format('where convert(varchar, log_date, 101)=''%s'' ', [FormatDateTime('mm/dd/yyyy', dtTglKliring.Date)]));

          if Trim(edtUser.Text) <> '' then
          	SQL.Add(' AND (log_user=''' + frmUserLib.encUser(Trim(edtUser.Text)) + ''') ');

          if Trim(edtDesc.Text) <> '' then
          	 SQL.Add(' AND log_desc Like ''%' + Format('%s', [Trim(edtDesc.Text)]) + '%'' ');

          SQL.Add('ORDER BY log_date');
          Open;
        end;
      end;

    ltUser :
    	begin
      	dsLog.DataSet := qryLogUser;
        with qryLogUser do
        begin
          if Active then
            Close;
          sql.Clear;
          SQL.Add('SELECT * FROM ' + DB_TABLE_USER_LOGS);
          if GlobalVarForm.DBType = 1 then
          	SQL.Add(Format('where Format(log_time, ''mm/dd/yyyy'')=''%s'' ', [FormatDateTime('mm/dd/yyyy', dtTglKliring.Date)]))
          else
          	SQL.Add(Format('where convert(varchar, log_time, 101)=''%s'' ', [FormatDateTime('mm/dd/yyyy', dtTglKliring.Date)]));

          if Trim(edtUser.Text) <> '' then
          	SQL.Add(' AND user_name=''' + frmUserLib.encUser(Trim(edtUser.Text)) + ''' ');

          if Trim(edtDesc.Text) <> '' then
          	SQL.Add(' AND log_desc Like ''%' + Format('%s', [Trim(edtDesc.Text)]) + '%'' ');
            //SQL.Add(' AND log_desc LIKE ''*' + Trim(edtDesc.Text) + '*'' ');

          SQL.Add('ORDER BY log_time');
          Open;
        end;
      end;
    else
    	begin
      	dsLog.DataSet := qryLogTrx;
        with qryLogTrx do
        begin
          if Active then
            Close;
          sql.Clear;
          SQL.Add('SELECT * FROM ' + DB_TABLE_TRX_LOGS);
          if GlobalVarForm.DBType = 1 then
          	SQL.Add(Format('where Format(log_date, ''mm/dd/yyyy'')=''%s'' ', [FormatDateTime('mm/dd/yyyy', dtTglKliring.Date)]))
          else
          	SQL.Add(Format('where convert(varchar, log_date, 101)=''%s'' ', [FormatDateTime('mm/dd/yyyy', dtTglKliring.Date)]));

          if Trim(edtUser.Text) <> '' then
          	SQL.Add(' AND log_user=''' + frmUserLib.encUser(Trim(edtUser.Text)) + ''' ');

          if Trim(edtDesc.Text) <> '' then
          	SQL.Add(' AND log_desc Like ''%' + Format('%s', [Trim(edtDesc.Text)]) + '%'' ');
            //SQL.Add(' AND log_desc LIKE ''*' + Trim(edtDesc.Text) + '*'' ');

          SQL.Add('ORDER BY log_date');
          Open;
        end;
      end;
  end;
end;

procedure TfrmAppLog.FormShow(Sender: TObject);
begin
	case FLogType of
  	ltTrx : Self.Caption := 'View Log - Aktifitas';
    ltUser : Self.Caption := 'View Log - User';
    else
    	Self.Caption := 'View Log - Aktifitas';
  end;

	dtTglKliring.Date := Now; //GlobalVarForm.SystemToday;
  DoOpenLog;
end;

procedure TfrmAppLog.dtTglKliringChange(Sender: TObject);
begin
	DoOpenLog;
end;

procedure TfrmAppLog.btnRefreshClick(Sender: TObject);
begin
	DoOpenLog;
end;

procedure TfrmAppLog.btnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmAppLog.qryLogTrxlog_moduleGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if not qryLogTrx.FieldByName('log_id').IsNull then
  begin
    case Sender.AsInteger of
      MDL_Login	: Text := MDL_Login_TEXT;
      MDL_SE		: Text := MDL_SE_TEXT;
      MDL_TRX		: Text := MDL_TRX_TEXT;
      MDL_RPT		: Text := MDL_RPT_TEXT;
      MDL_FI		: Text := MDL_FI_TEXT;
      MDL_PS		: Text := MDL_PS_TEXT;
      MDL_UMC		: Text := MDL_UMC_TEXT;
      MDL_MDB		: Text := MDL_MDB_TEXT;
      else
        Text := '';
    end;
  end
  else
  	Text := '';
end;

procedure TfrmAppLog.qryLogTrxlog_userGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Text := frmUserLib.decUser(Sender.AsString);
end;

procedure TfrmAppLog.qryLogUseruser_nameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Text := frmUserLib.decUser(Sender.AsString);
end;

procedure TfrmAppLog.qryLogUserlog_moduleGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not qryLogUser.FieldByName('log_id').IsNull then
  begin
    case Sender.AsInteger of
      MDL_Login	: Text := MDL_Login_TEXT;
      MDL_SE		: Text := MDL_SE_TEXT;
      MDL_TRX		: Text := MDL_TRX_TEXT;
      MDL_RPT		: Text := MDL_RPT_TEXT;
      MDL_FI		: Text := MDL_FI_TEXT;
      MDL_PS		: Text := MDL_PS_TEXT;
      MDL_UMC		: Text := MDL_UMC_TEXT;
      MDL_MDB		: Text := MDL_MDB_TEXT;
      else
        Text := '';
    end;
  end
  else
  	Text := '';
end;

procedure TfrmAppLog.qryLogTrxlog_dateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if Sender.IsNull then
  	Text := ''
  else
  	Text := FormatDateTime('hh:nn:ss', Sender.AsDateTime);
end;

procedure TfrmAppLog.qryLogUserlog_timeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if Sender.IsNull then
  	Text := ''
  else
  	Text := FormatDateTime('hh:nn:ss', Sender.AsDateTime);
end;

end.
