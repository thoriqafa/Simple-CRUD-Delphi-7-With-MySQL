object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 389
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Name: TLabel
    Left = 72
    Top = 53
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object BtnSimpan: TBitBtn
    Left = 72
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Simpan'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BtnSimpanClick
  end
  object TxtName: TEdit
    Left = 128
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtnHapus: TBitBtn
    Left = 272
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Hapus'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BtnHapusClick
  end
  object BtnEdit: TBitBtn
    Left = 174
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Edit'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BtnEditClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 103
    Width = 489
    Height = 258
    DataSource = DataModule2.DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
end
