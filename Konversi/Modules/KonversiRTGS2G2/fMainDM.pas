unit fMainDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TMainDM = class(TDataModule)
    qryTemp: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDM: TMainDM;

implementation

uses fGlobalVarDM;

{$R *.dfm}

procedure TMainDM.DataModuleCreate(Sender: TObject);
begin
	with qryTemp do
  begin
    if Active then
    	Close;
    Connection := GlobalVarDM.DailyADOConn;
  end;
end;

end.
