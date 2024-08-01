unit UnitModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractConnection, ZConnection, StdCtrls, Buttons, Grids, DBGrids,
  BussinesLogic;

type
  TForm1 = class(TForm)
    Name: TLabel;
    BtnSimpan: TBitBtn;
    TxtName: TEdit;
    BtnHapus: TBitBtn;
    BtnEdit: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnEditClick(Sender: TObject);
  private
    FBussinesLogic: TBussinesLogic;
    procedure RefreshData;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation

uses DataModule;

{$R *.dfm}

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DataModule2 := TDataModule2.Create(nil);
  FBussinesLogic := TBussinesLogic.Create(DataModule2);
end;

destructor TForm1.Destroy;
begin
  FBussinesLogic.Free;
  inherited Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RefreshData;
  DBGrid1.Columns[0].Visible := False;
end;

procedure TForm1.RefreshData;
begin
  FBussinesLogic.RefreshEmpData;
end;

procedure TForm1.BtnSimpanClick(Sender: TObject);
begin
  if TxtName.Text = '' then
  begin
    ShowMessage('Nama tidak boleh kosong !');
    TxtName.SetFocus();
  end
  else
  begin
    FBussinesLogic.Name := TxtName.Text;
    try
       FBussinesLogic.SaveEmployee;
       ShowMessage('Data Berhasil Dimasukkan!');
       RefreshData;
    except
       on E: Exception do
      ShowMessage('Gagal !' + E.message);
    end;

    TxtName.Clear;
    TxtName.SetFocus;
  end;
end;

procedure TForm1.BtnEditClick(Sender: TObject);
begin
  if FBussinesLogic.EmpId <= 0 then
  begin
    ShowMessage('Pilih data yang ingin diperbarui!');
  end;

  if TxtName.Text = '' then
  begin
    ShowMessage('Nama kosong!');
    TxtName.SetFocus;
    Exit;
  end;

  FBussinesLogic.Name := TxtName.Text;
  try
    FBussinesLogic.UpdateEmployee;
    ShowMessage('Data berhasil diupdate');
    RefreshData;
  except
    on E: Exception do
      ShowMessage('Gagal! ' + E.Message);
  end;
end;

procedure TForm1.BtnHapusClick(Sender: TObject);
var
  EmpId: Integer;
begin
  if DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger > 0 then
  begin
    EmpId := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
    FBussinesLogic.EmpId := EmpId;
    try
      FBussinesLogic.SoftDeleteEmployee;
      ShowMessage('Data berhasil dihapus');
      RefreshData;
    except
      on E: Exception do
        ShowMessage('Gagal! ' + E.Message);
    end;
  end
  else
    ShowMessage('Pilih data yang ingin dihapus!');
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  TxtName.Clear;
  FBussinesLogic.EmpId := 0;

  TxtName.Text := DBGrid1.DataSource.DataSet.FieldByName('name').AsString;
  FBussinesLogic.EmpId := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
end;
end.