program Project1_thoriq;

uses
  Forms,
  UnitModule in 'UnitModule.pas' {Form1},
  DataModule in 'DataModule.pas' {DataModule2: TDataModule},
  BussinesLogic in 'BussinesLogic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
