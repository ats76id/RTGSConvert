object frmImportDBTPK: TfrmImportDBTPK
  Left = 284
  Top = 213
  BorderStyle = bsDialog
  Caption = 'Impor Tabel Dimensi SPK'
  ClientHeight = 69
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 69
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.2.1.0'
    BorderColor = clNone
    BorderWidth = 4
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    GradientDirection = gdHorizontal
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    FullHeight = 0
    object ProgressLabel: TLabel
      Left = 12
      Top = 12
      Width = 21
      Height = 13
      Caption = '.......'
    end
    object ProgressBar1: TAdvProgressBar
      Left = 9
      Top = 37
      Width = 464
      Height = 18
      BackgroundColor = clBtnFace
      CompletionSmooth = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Level0Color = clMenuHighlight
      Level0ColorTo = 14811105
      Level1Color = clMenuHighlight
      Level1ColorTo = 13303807
      Level2Color = clMenuHighlight
      Level2ColorTo = 11064319
      Level3Color = clMenuHighlight
      Level3ColorTo = 13290239
      Level1Perc = 70
      Level2Perc = 90
      Position = 0
      Rounded = False
      ShowBorder = True
      ShowGradient = False
      Version = '1.2.0.2'
    end
    object ProgressBar11: TProgressBar
      Left = 12
      Top = 108
      Width = 517
      Height = 17
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 52
  end
  object LMDFormShadow1: TLMDFormShadow
    Left = 8
    Top = 4
  end
  object TPKQuery: TADOQuery
    Connection = TPKConn
    Parameters = <>
    Left = 88
    Top = 1
  end
  object MainDBQuery: TADOQuery
    Connection = GlobalVarDM.DailyADOConn
    Parameters = <>
    Left = 120
    Top = 65535
  end
  object TPKConn: TADOConnection
    LoginPrompt = False
    Left = 192
    Top = 2
  end
end
