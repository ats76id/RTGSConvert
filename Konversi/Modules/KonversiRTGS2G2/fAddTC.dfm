object frmAddTC: TfrmAddTC
  Left = 329
  Top = 264
  BorderStyle = bsDialog
  Caption = 'Tambah Mapping TRN'
  ClientHeight = 81
  ClientWidth = 285
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
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 285
    Height = 81
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
    object Bevel1: TBevel
      Left = 167
      Top = -1
      Width = 9
      Height = 102
      Shape = bsLeftLine
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 23
      Height = 13
      Caption = 'TRN'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 14
      Height = 13
      Caption = 'TC'
    end
    object edtTCBaru: TEdit
      Left = 65
      Top = 40
      Width = 85
      Height = 21
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 1
    end
    object AdvGlowButton1: TBitBtn
      Left = 180
      Top = 8
      Width = 85
      Height = 29
      Caption = '&OK'
      Default = True
      TabOrder = 2
      TabStop = False
      WordWrap = True
      OnClick = AdvGlowButton1Click
      Spacing = 2
    end
    object AdvGlowButton2: TBitBtn
      Left = 180
      Top = 40
      Width = 85
      Height = 29
      Cancel = True
      Caption = '&Batal'
      TabOrder = 3
      TabStop = False
      WordWrap = True
      OnClick = AdvGlowButton2Click
      Spacing = 2
    end
    object edtTCLama: TEdit
      Left = 65
      Top = 12
      Width = 85
      Height = 21
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 0
    end
  end
  object LMDFormShadow1: TLMDFormShadow
    Left = 20
    Top = 52
  end
  object XPManifest1: TXPManifest
    Left = 40
    Top = 8
  end
end
