object frmBackup: TfrmBackup
  Left = 303
  Top = 140
  BorderStyle = bsDialog
  Caption = 'Backup Database'
  ClientHeight = 363
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 363
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
      Top = 318
      Width = 369
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object btnBackup: TBitBtn
        Left = 193
        Top = 6
        Width = 85
        Height = 29
        Caption = '&Backup'
        Default = True
        TabOrder = 0
        TabStop = False
        WordWrap = True
        OnClick = btnBackupClick
        Spacing = 2
      end
      object btnCancel: TBitBtn
        Left = 283
        Top = 6
        Width = 85
        Height = 29
        Cancel = True
        Caption = '&Tutup'
        ModalResult = 2
        TabOrder = 1
        TabStop = False
        WordWrap = True
        Spacing = 2
      end
    end
    object LMDGroupBox1: TLMDGroupBox
      Left = 4
      Top = 4
      Width = 369
      Height = 81
      Align = alTop
      Bevel.Mode = bmWindows
      Caption = 'Database'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'MS Sans Serif'
      CaptionFont.Style = []
      TabOrder = 1
      object cbDBUser: TAdvOfficeCheckBox
        Left = 8
        Top = 19
        Width = 45
        Height = 20
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'User'
        ReturnIsTab = False
        Version = '1.3.6.1'
      end
      object cbDBTrx: TAdvOfficeCheckBox
        Left = 8
        Top = 44
        Width = 69
        Height = 20
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Transaksi'
        ReturnIsTab = False
        Version = '1.3.6.1'
      end
    end
    object memLogBackup: TMemo
      Left = 4
      Top = 85
      Width = 369
      Height = 233
      Align = alClient
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
  object Zipper: TAbZipper
    AutoSave = True
    DOSMode = False
    StoreOptions = [soStripDrive, soStripPath, soRemoveDots]
    Left = 188
    Top = 32
  end
end
