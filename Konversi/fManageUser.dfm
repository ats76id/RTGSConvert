object fmManageUser: TfmManageUser
  Left = 324
  Top = 66
  BorderStyle = bsDialog
  Caption = 'Pengaturan User'
  ClientHeight = 377
  ClientWidth = 403
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
    Width = 403
    Height = 377
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
      Left = 19
      Top = 24
      Width = 51
      Height = 13
      Caption = 'Name user'
      Transparent = True
    end
    object Label2: TLabel
      Left = 19
      Top = 49
      Width = 69
      Height = 13
      Caption = 'Nama &lengkap'
      FocusControl = edFullName
      Transparent = True
    end
    object Bevel2: TBevel
      Left = 10
      Top = 168
      Width = 380
      Height = 9
      Shape = bsBottomLine
    end
    object Label5: TLabel
      Left = 19
      Top = 194
      Width = 95
      Height = 13
      Caption = 'Nama pembuat user'
      Transparent = True
    end
    object Label6: TLabel
      Left = 19
      Top = 219
      Width = 95
      Height = 13
      Caption = 'Nama pengedit user'
      Transparent = True
    end
    object Label7: TLabel
      Left = 19
      Top = 245
      Width = 109
      Height = 13
      Caption = 'Nama pemvalidasi user'
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 10
      Top = 96
      Width = 380
      Height = 9
      Shape = bsBottomLine
    end
    object lblStatus: TLabel
      Left = 19
      Top = 120
      Width = 30
      Height = 13
      Caption = 'Status'
      Transparent = True
    end
    object edGroup: TLabel
      Left = 19
      Top = 74
      Width = 23
      Height = 13
      Caption = '&Grup'
      FocusControl = cbGroup
      Transparent = True
    end
    object Bevel3: TBevel
      Left = 10
      Top = 272
      Width = 380
      Height = 9
      Shape = bsBottomLine
    end
    object Label3: TLabel
      Left = 20
      Top = 146
      Width = 62
      Height = 13
      Caption = 'Sedang login'
      Transparent = True
      Visible = False
    end
    object Bevel4: TBevel
      Left = 10
      Top = 324
      Width = 380
      Height = 9
      Shape = bsBottomLine
    end
    object edName: TEdit
      Left = 168
      Top = 20
      Width = 205
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      Text = 'edName'
    end
    object edFullName: TEdit
      Left = 168
      Top = 44
      Width = 205
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'edFullName'
      OnChange = edFullNameChange
    end
    object edCreateUser: TEdit
      Left = 168
      Top = 192
      Width = 205
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
      Text = 'edCreateUser'
    end
    object edEditUser: TEdit
      Left = 168
      Top = 216
      Width = 205
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
      Text = 'edEditUser'
    end
    object edValidateUser: TEdit
      Left = 168
      Top = 240
      Width = 205
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
      Text = 'edValidateUser'
    end
    object edStatus: TEdit
      Left = 168
      Top = 116
      Width = 205
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 7
      Text = 'edStatus'
    end
    object cbGroup: TComboBox
      Left = 168
      Top = 68
      Width = 205
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 8
      OnChange = cbGroupChange
    end
    object edActive: TEdit
      Left = 168
      Top = 140
      Width = 205
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 11
      Text = 'edStatus'
      Visible = False
    end
    object bnValidate: TBitBtn
      Left = 10
      Top = 294
      Width = 90
      Height = 25
      Caption = '&Validasi'
      TabOrder = 9
      OnClick = bnValidateClick
      Spacing = 2
    end
    object bnLock: TBitBtn
      Left = 106
      Top = 294
      Width = 90
      Height = 25
      Caption = '&Lock'
      TabOrder = 12
      OnClick = bnLockClick
      Spacing = 2
    end
    object bnUnlock: TBitBtn
      Left = 202
      Top = 294
      Width = 90
      Height = 25
      Caption = 'Unl&ock'
      TabOrder = 10
      OnClick = bnUnlockClick
      Spacing = 2
    end
    object bnResetPassword: TBitBtn
      Left = 298
      Top = 294
      Width = 90
      Height = 25
      Caption = 'Reset &Password'
      TabOrder = 13
      OnClick = bnResetPasswordClick
      Spacing = 2
    end
    object bnSave: TBitBtn
      Left = 204
      Top = 344
      Width = 90
      Height = 25
      Caption = '&Simpan'
      Default = True
      TabOrder = 0
      OnClick = bnSaveClick
      Spacing = 2
    end
    object bnCancel: TBitBtn
      Left = 300
      Top = 344
      Width = 90
      Height = 25
      Cancel = True
      Caption = '&Batal'
      ModalResult = 2
      TabOrder = 1
      OnClick = bnCancelClick
      Spacing = 2
    end
  end
  object LMDFormShadow1: TLMDFormShadow
    Left = 372
    Top = 4
  end
  object XPManifest1: TXPManifest
    Left = 192
    Top = 192
  end
end
