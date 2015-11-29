object frmChangeLog: TfrmChangeLog
  Left = 368
  Top = 194
  BorderStyle = bsDialog
  Caption = 'Change Log'
  ClientHeight = 364
  ClientWidth = 245
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
    Width = 245
    Height = 364
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
      Top = 315
      Width = 237
      Height = 45
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object btnGeneralEdit: TBitBtn
        Left = 77
        Top = 8
        Width = 85
        Height = 29
        Caption = '&Tutup'
        Default = True
        TabOrder = 0
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralEditClick
        Spacing = 2
      end
    end
    object meLog: TLMDMemo
      Left = 4
      Top = 4
      Width = 237
      Height = 311
      Bevel.Mode = bmStandard
      Caret.BlinkRate = 530
      TabOrder = 1
      Align = alClient
      ReadOnly = True
      ScrollBars = skVertical
      Text = 
        '2013-02-19'#13#10'--------------------------------------'#13#10'- Initial De' +
        'mo Version'#13#10'- Download BIMC'#13#10'- Reject-Repair'#13#10'- Generate DPO'#13#10'- ' +
        'Konfigurasi'#13#10'- SOD/EOD'#13#10#13#10
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
