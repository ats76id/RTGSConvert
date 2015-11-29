object frmMainCompact: TfrmMainCompact
  Left = 335
  Top = 174
  BorderStyle = bsDialog
  Caption = 'Compact And Repair Access Database'
  ClientHeight = 118
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 65
    Height = 13
    Caption = 'File Database'
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object BitBtn1: TBitBtn
    Left = 12
    Top = 76
    Width = 75
    Height = 25
    Caption = 'Compact'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object edtFileSource: TJvFilenameEdit
    Left = 88
    Top = 8
    Width = 273
    Height = 21
    Filter = 'mdb files (*.mdb)|*.mdb'
    TabOrder = 1
  end
  object edtPassword: TEdit
    Left = 88
    Top = 32
    Width = 273
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 92
    Top = 76
  end
end
