unit DataModule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TDataModule2 = class(TDataModule)
    ZConnection1: TZConnection;
    ZQueryEmployee: TZQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    procedure LoadEmployees;
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

procedure TDataModule2.LoadEmployees;
begin
  ZQueryEmployee.SQL.Text := 'SELECT id, name, created_at, updated_at, deleted_at FROM tm_employee WHERE is_delete = 0';
  ZQueryEmployee.Open;
end;

end.
