object fmNewUser: TfmNewUser
  Left = 371
  Top = 250
  BorderStyle = bsDialog
  Caption = 'Buat User Baru'
  ClientHeight = 158
  ClientWidth = 374
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
    Width = 374
    Height = 158
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
    object Label1: TLabel
      Left = 20
      Top = 28
      Width = 51
      Height = 13
      Caption = 'Name &user'
      FocusControl = edName
      Transparent = True
    end
    object Label2: TLabel
      Left = 20
      Top = 58
      Width = 69
      Height = 13
      Caption = 'Nama &lengkap'
      FocusControl = edFullName
      Transparent = True
    end
    object edGroup: TLabel
      Left = 20
      Top = 86
      Width = 23
      Height = 13
      Caption = '&Grup'
      FocusControl = cbGroup
      Transparent = True
    end
    object edName: TEdit
      Left = 121
      Top = 24
      Width = 205
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = 'edName'
      OnChange = edFullNameChange
    end
    object edFullName: TEdit
      Left = 121
      Top = 52
      Width = 205
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'edFullName'
      OnChange = edFullNameChange
    end
    object cbGroup: TComboBox
      Left = 121
      Top = 80
      Width = 205
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 4
    end
    object bnCreate: TBitBtn
      Left = 200
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Buat'
      Default = True
      TabOrder = 0
      OnClick = bnCreateClick
      Spacing = 2
    end
    object bnCancel: TBitBtn
      Left = 284
      Top = 120
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Batal'
      ModalResult = 2
      TabOrder = 1
      Spacing = 2
    end
  end
  object LMDFormShadow1: TLMDFormShadow
    Left = 338
    Top = 4
  end
  object XPManifest1: TXPManifest
    Left = 184
    Top = 88
  end
end
