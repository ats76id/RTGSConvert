object frmSOD: TfrmSOD
  Left = 389
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Buka Hari/Tutup Hari'
  ClientHeight = 263
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 275
    Height = 263
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
    object Panel2: TPanel
      Left = 4
      Top = 214
      Width = 267
      Height = 45
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object btnSOD: TBitBtn
        Left = 47
        Top = 12
        Width = 85
        Height = 29
        Caption = 'Awal Hari'
        Default = True
        TabOrder = 0
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralEditClick
        Spacing = 2
      end
      object btnGeneralSave: TBitBtn
        Left = 137
        Top = 12
        Width = 85
        Height = 29
        Cancel = True
        Caption = '&Batal'
        TabOrder = 1
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralSaveClick
        Spacing = 2
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 267
      Height = 210
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 20
        Top = 28
        Width = 106
        Height = 13
        Alignment = taCenter
        Caption = 'Tanggal Kliring :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dtTglKliring: TAdvDateTimePicker
        Left = 136
        Top = 24
        Width = 106
        Height = 21
        Date = 41320.169918981480000000
        Time = 41320.169918981480000000
        Kind = dkDate
        TabOrder = 0
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 41320.169918981480000000
        Version = '1.2.0.5'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
      end
      object meLog: TLMDMemo
        Left = 8
        Top = 76
        Width = 249
        Height = 117
        Bevel.Mode = bmStandard
        Caret.BlinkRate = 530
        TabOrder = 1
        Transparent = True
        ReadOnly = True
        ScrollBars = skVertical
        WordWrap = False
        HorizScrollBar.Back.Style = sfBrush
        HorizScrollBar.Back.Brush.Color = clBlue
        HorizScrollBar.Bevel.Mode = bmStandard
        VertScrollBar.Back.Style = sfBrush
        VertScrollBar.Back.Brush.Color = clBlue
        VertScrollBar.Bevel.Mode = bmStandard
      end
    end
  end
  object JvGradientCaption1: TJvGradientCaption
    Captions = <>
    FormCaption = 'Buka Hari/Tutup Hari'
    GradientInactive = True
    EndColor = clTeal
    Left = 68
    Top = 8
  end
  object qryTemp: TADOQuery
    Parameters = <>
    Left = 4
    Top = 6
  end
end
