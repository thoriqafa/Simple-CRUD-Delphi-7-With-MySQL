object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 150
  Width = 215
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'self_schema'
    User = 'root'
    Protocol = 'mysql'
    Left = 16
    Top = 24
  end
  object ZQueryEmployee: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      
        'SELECT name, created_at, updated_at, deleted_at FROM tm_employee' +
        ';')
    Params = <>
    Left = 152
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ZQueryEmployee
    Left = 152
    Top = 72
  end
end
