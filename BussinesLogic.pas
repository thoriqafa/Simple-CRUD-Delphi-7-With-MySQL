unit BussinesLogic;

interface

uses
  SysUtils, DataModule;

type
  TBussinesLogic = class
  private
    FEmpId: Integer;
    FName: string;
    FDataModule: TDataModule2;
  public
    constructor Create(ADataModule: TDataModule2);
    procedure SaveEmployee;
    procedure UpdateEmployee;
    procedure DeleteEmployee;
    procedure SoftDeleteEmployee;
    procedure RefreshEmpData;
    property Name: string read FName write FName;
    property EmpId: Integer read FEmpId write FEmpId;
  end;

implementation

constructor TBussinesLogic.Create(ADataModule: TDataModule2);
begin
  FDataModule := ADataModule;
end;

procedure TBussinesLogic.SaveEmployee;
begin
  with FDataModule.ZQueryEmployee do
  begin
    Connection := FDataModule.ZConnection1;
    Active := False;
    SQL.Clear;
    SQL.Text := 'INSERT INTO tm_employee (name, created_at) VALUES (:FName, :CreatedAt)';
    Params[0].AsString := FName;
    Params[1].AsDateTime := Now;
    ExecSQL;
  end;
  RefreshEmpData;
end;

procedure TBussinesLogic.UpdateEmployee;
begin
  if EmpId <= 0 then
    raise Exception.Create('Id Karyawan tidak valid');

  with FDataModule.ZQueryEmployee do
  begin
    Connection := FDataModule.ZConnection1;
    Active := False;
    SQL.Clear;
    SQL.Text := 'UPDATE tm_employee SET name = :FName, updated_at = :UpdatedAt WHERE id = :EmpId';
    Params[0].AsString := FName;
    Params[1].AsDateTime := Now;
    Params[2].AsInteger := EmpId;
    ExecSQL;
  end;
  RefreshEmpData;
end;

procedure TBussinesLogic.SoftDeleteEmployee;
begin
  if EmpId <= 0 then
    raise Exception.Create('Id Karyawan tidak valid');

  with FDataModule.ZQueryEmployee do
  begin
    Connection := FDataModule.ZConnection1;
    Active := False;
    SQL.Clear;
    SQL.Text := 'UPDATE tm_employee SET name = :FName, deleted_at = :DeletedAt,'+
                'is_delete = :IsDelete  WHERE id = :EmpId';
    Params[0].AsString := FName;
    Params[1].AsDateTime := Now;
    Params[2].AsInteger := 1;
    Params[3].AsInteger := EmpId;
    ExecSQL;
  end;
  RefreshEmpData;
end;

procedure TBussinesLogic.DeleteEmployee;
begin
  if EmpId <= 0 then
    raise Exception.Create('Id Karyawan tidak valid');

  with FDataModule.ZQueryEmployee do
  begin
    Connection := FDataModule.ZConnection1;
    Active := False;
    SQL.Clear;
    SQL.Text := 'DELETE FROM tm_employee WHERE id = :EmpId';
    Params[0].AsInteger := FEmpId;
    ExecSQL;
  end;
  RefreshEmpData;
end;

procedure TBussinesLogic.RefreshEmpData;
begin
  with FDataModule.ZQueryEmployee do
  begin
    SQL.Text := 'SELECT id, name, created_at, updated_at, deleted_at FROM tm_employee WHERE is_delete = 0';
    Close;
    Open;
  end;
end;

end.

