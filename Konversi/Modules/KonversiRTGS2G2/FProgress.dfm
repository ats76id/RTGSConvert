object pf: Tpf
  Left = 209
  Top = 245
  Width = 414
  Height = 97
  BorderIcons = [biHelp]
  Caption = 'Progress Bar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pl1: TLabel
    Left = 24
    Top = 24
    Width = 44
    Height = 13
    Caption = 'Data ke :'
  end
  object pl: TLabel
    Left = 72
    Top = 24
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblStatus: TLabel
    Left = 24
    Top = 4
    Width = 40
    Height = 13
    Caption = 'lblStatus'
  end
  object Progress: TProgressBar
    Left = 20
    Top = 41
    Width = 365
    Height = 16
    Step = 1
    TabOrder = 0
  end
  object XPManifest1: TXPManifest
    Left = 40
    Top = 8
  end
end
