object frmKonfigurasi: TfrmKonfigurasi
  Left = 326
  Top = 110
  BorderStyle = bsDialog
  Caption = 'Parameter'
  ClientHeight = 480
  ClientWidth = 522
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object EnterAsTab1: TEnterAsTab
    Left = 468
    Top = 334
    Width = 27
    Height = 27
    Caption = 'ET'
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 480
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    UseDockManager = True
    Version = '2.2.1.0'
    BorderColor = clGray
    Caption.Color = clSilver
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 4
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    GradientDirection = gdHorizontal
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = clSilver
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    FullHeight = 0
    object Panel2: TPanel
      Left = 0
      Top = 431
      Width = 522
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        522
        49)
      object btnGeneralEdit: TcxButton
        Left = 329
        Top = 4
        Width = 92
        Height = 35
        Anchors = [akTop, akRight]
        Caption = '&Simpan'
        Default = True
        TabOrder = 0
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralEditClick
        LookAndFeel.NativeStyle = True
        OptionsImage.ImageIndex = 14
        OptionsImage.Images = GlobalVarForm.listGlobalImage
        OptionsImage.Spacing = 2
      end
      object btnGeneralSave: TcxButton
        Left = 425
        Top = 4
        Width = 92
        Height = 35
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = '&Batal'
        TabOrder = 1
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralSaveClick
        LookAndFeel.NativeStyle = True
        OptionsImage.ImageIndex = 17
        OptionsImage.Images = GlobalVarForm.listGlobalImage
        OptionsImage.Spacing = 2
      end
    end
    object pageControl: TAdvOfficePager
      Left = 0
      Top = 0
      Width = 522
      Height = 431
      AdvOfficePagerStyler = pgcStyler
      Align = alClient
      ActivePage = AdvOfficePager11
      ButtonSettings.CloseButtonPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001000001010100000100
        0000000202000100020200000000000202020002020200000000010002020202
        0200010000000101000202020001010000000100020202020200010000000002
        0202000202020000000000020200010002020000000001000001010100000100
        0000}
      ButtonSettings.PageListButtonPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010101000101010100
        0000010101000200010101000000010100020202000101000000010002020202
        0200010000000002020200020202000000000002020001000202000000000100
        0001010100000100000001010101010101010100000001010101010101010100
        0000}
      ButtonSettings.ScrollButtonPrevPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010101000001010100
        0000010101000202000101000000010100020202000101000000010002020200
        0101010000000002020200010101010000000100020202000101010000000101
        0002020200010100000001010100020200010100000001010101000001010100
        0000}
      ButtonSettings.ScrollButtonNextPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010000010101010100
        0000010002020001010101000000010002020200010101000000010100020202
        0001010000000101010002020200010000000101000202020001010000000100
        0202020001010100000001000202000101010100000001010000010101010100
        0000}
      ButtonSettings.ScrollButtonFirstPicture.Data = {
        424DC60400000000000036040000280000001000000009000000010008000000
        000000000000C40E0000C40E00000001000000010000427B84FFDEEFEFFFFFFF
        FFFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF01010101010000010101
        0101000001010101010100020200010101000202000101010100020202000101
        0002020200010101000202020001010002020200010101000202020001010002
        0202000101010101000202020001010002020200010101010100020202000101
        0002020200010101010100020200010101000202000101010101010000010101
        010100000101}
      ButtonSettings.ScrollButtonLastPicture.Data = {
        424DC60400000000000036040000280000001000000009000000010008000000
        000000000000C40E0000C40E00000001000000010000427B84FFDEEFEFFFFFFF
        FFFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF01010000010101010100
        0001010101010100020200010101000202000101010101000202020001010002
        0202000101010101000202020001010002020200010101010100020202000101
        0002020200010101000202020001010002020200010101000202020001010002
        0202000101010100020200010101000202000101010101010000010101010100
        000101010101}
      ButtonSettings.ClosedListButtonPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010101000101010100
        0000010101000200010101000000010100020202000101000000010002020202
        0200010000000002020200020202000000000002020001000202000000000100
        0001010100000100000001010101010101010100000001010101010101010100
        0000}
      ButtonSettings.CloseButtonHint = 'Close'
      ButtonSettings.InsertButtonHint = 'Insert new page'
      ButtonSettings.PageListButtonHint = 'Page List'
      ButtonSettings.ScrollButtonNextHint = 'Next'
      ButtonSettings.ScrollButtonPrevHint = 'Previous'
      ButtonSettings.ScrollButtonFirstHint = 'First'
      ButtonSettings.ScrollButtonLastHint = 'Last'
      ButtonSettings.ClosedListButtonHint = 'Closed Pages'
      TabSettings.Shape = tsRightRamp
      ShowShortCutHints = False
      TabOrder = 1
      NextPictureChanged = False
      PrevPictureChanged = False
      object AdvOfficePager11: TAdvOfficePage
        Left = 1
        Top = 26
        Width = 520
        Height = 403
        Caption = 'Identitas'
        PageAppearance.BorderColor = clGray
        PageAppearance.Color = clBtnFace
        PageAppearance.ColorTo = clBtnFace
        PageAppearance.ColorMirror = clBtnFace
        PageAppearance.ColorMirrorTo = clBtnFace
        PageAppearance.Gradient = ggVertical
        PageAppearance.GradientMirror = ggVertical
        TabAppearance.BorderColor = clGray
        TabAppearance.BorderColorHot = clGray
        TabAppearance.BorderColorSelected = clHighlight
        TabAppearance.BorderColorSelectedHot = clGray
        TabAppearance.BorderColorDisabled = clNone
        TabAppearance.BorderColorDown = clNone
        TabAppearance.Color = clBtnFace
        TabAppearance.ColorTo = clWhite
        TabAppearance.ColorSelected = clHighlight
        TabAppearance.ColorSelectedTo = clHighlight
        TabAppearance.ColorDisabled = clGray
        TabAppearance.ColorDisabledTo = clGray
        TabAppearance.ColorHot = clSilver
        TabAppearance.ColorHotTo = clSilver
        TabAppearance.ColorMirror = clWhite
        TabAppearance.ColorMirrorTo = clWhite
        TabAppearance.ColorMirrorHot = clSilver
        TabAppearance.ColorMirrorHotTo = clSilver
        TabAppearance.ColorMirrorSelected = clHighlight
        TabAppearance.ColorMirrorSelectedTo = clHighlight
        TabAppearance.ColorMirrorDisabled = clGray
        TabAppearance.ColorMirrorDisabledTo = clGray
        TabAppearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Font.Color = clWindowText
        TabAppearance.Font.Height = -11
        TabAppearance.Font.Name = 'Tahoma'
        TabAppearance.Font.Style = []
        TabAppearance.Gradient = ggVertical
        TabAppearance.GradientMirror = ggVertical
        TabAppearance.GradientHot = ggVertical
        TabAppearance.GradientMirrorHot = ggVertical
        TabAppearance.GradientSelected = ggVertical
        TabAppearance.GradientMirrorSelected = ggVertical
        TabAppearance.GradientDisabled = ggVertical
        TabAppearance.GradientMirrorDisabled = ggVertical
        TabAppearance.TextColor = clBlack
        TabAppearance.TextColorHot = clBlack
        TabAppearance.TextColorSelected = clWhite
        TabAppearance.TextColorDisabled = clGray
        TabAppearance.ShadowColor = clGray
        TabAppearance.HighLightColor = 16775871
        TabAppearance.HighLightColorHot = clGray
        TabAppearance.HighLightColorSelected = clBtnFace
        TabAppearance.HighLightColorSelectedHot = clHighlight
        TabAppearance.HighLightColorDown = clHighlight
        TabAppearance.BackGround.Color = clBtnFace
        TabAppearance.BackGround.ColorTo = clBtnFace
        TabAppearance.BackGround.Direction = gdHorizontal
        object Label1: TLabel
          Left = 17
          Top = 33
          Width = 65
          Height = 13
          Caption = 'Sandi Bank'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label2: TLabel
          Left = 17
          Top = 59
          Width = 80
          Height = 13
          Caption = 'Sandi Cabang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label8: TLabel
          Left = 17
          Top = 85
          Width = 49
          Height = 13
          Caption = 'Sandi BI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 17
          Top = 135
          Width = 66
          Height = 13
          Caption = 'Nama Bank'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label7: TLabel
          Left = 17
          Top = 161
          Width = 85
          Height = 13
          Caption = 'Wil.Kliring SKN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label14: TLabel
          Left = 17
          Top = 110
          Width = 58
          Height = 13
          Caption = 'Sandi BIC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lmeSandiBank: TAdvEdit
          Left = 140
          Top = 29
          Width = 101
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
          Version = '3.1.1.1'
        end
        object lmeSandiCabang: TAdvEdit
          Left = 140
          Top = 55
          Width = 101
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
          Version = '3.1.1.1'
        end
        object lmeSandiBI: TAdvEdit
          Left = 140
          Top = 81
          Width = 101
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 2
          Visible = True
          Version = '3.1.1.1'
        end
        object lmeNamaBank: TAdvEdit
          Left = 140
          Top = 131
          Width = 347
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 3
          Visible = True
          Version = '3.1.1.1'
        end
        object RegionLookup: TJvDBLookupCombo
          Left = 140
          Top = 157
          Width = 347
          Height = 21
          LookupField = 'SANDI_WILAYAH_KLIRING'
          LookupDisplay = 'NAMA_WILAYAH_KLIRING'
          LookupSource = dsRefWilayah
          TabOrder = 4
        end
        object lmeSandiPeserta: TAdvEdit
          Left = 140
          Top = 106
          Width = 101
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 5
          Visible = True
          Version = '3.1.1.1'
        end
      end
      object AdvOfficePager12: TAdvOfficePage
        Left = 1
        Top = 26
        Width = 520
        Height = 403
        Caption = 'Database'
        PageAppearance.BorderColor = clGray
        PageAppearance.Color = clBtnFace
        PageAppearance.ColorTo = clBtnFace
        PageAppearance.ColorMirror = clBtnFace
        PageAppearance.ColorMirrorTo = clBtnFace
        PageAppearance.Gradient = ggVertical
        PageAppearance.GradientMirror = ggVertical
        TabAppearance.BorderColor = clGray
        TabAppearance.BorderColorHot = clGray
        TabAppearance.BorderColorSelected = clHighlight
        TabAppearance.BorderColorSelectedHot = clGray
        TabAppearance.BorderColorDisabled = clNone
        TabAppearance.BorderColorDown = clNone
        TabAppearance.Color = clBtnFace
        TabAppearance.ColorTo = clWhite
        TabAppearance.ColorSelected = clHighlight
        TabAppearance.ColorSelectedTo = clHighlight
        TabAppearance.ColorDisabled = clGray
        TabAppearance.ColorDisabledTo = clGray
        TabAppearance.ColorHot = clSilver
        TabAppearance.ColorHotTo = clSilver
        TabAppearance.ColorMirror = clWhite
        TabAppearance.ColorMirrorTo = clWhite
        TabAppearance.ColorMirrorHot = clSilver
        TabAppearance.ColorMirrorHotTo = clSilver
        TabAppearance.ColorMirrorSelected = clHighlight
        TabAppearance.ColorMirrorSelectedTo = clHighlight
        TabAppearance.ColorMirrorDisabled = clGray
        TabAppearance.ColorMirrorDisabledTo = clGray
        TabAppearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Font.Color = clWindowText
        TabAppearance.Font.Height = -11
        TabAppearance.Font.Name = 'Tahoma'
        TabAppearance.Font.Style = []
        TabAppearance.Gradient = ggVertical
        TabAppearance.GradientMirror = ggVertical
        TabAppearance.GradientHot = ggVertical
        TabAppearance.GradientMirrorHot = ggVertical
        TabAppearance.GradientSelected = ggVertical
        TabAppearance.GradientMirrorSelected = ggVertical
        TabAppearance.GradientDisabled = ggVertical
        TabAppearance.GradientMirrorDisabled = ggVertical
        TabAppearance.TextColor = clBlack
        TabAppearance.TextColorHot = clBlack
        TabAppearance.TextColorSelected = clWhite
        TabAppearance.TextColorDisabled = clGray
        TabAppearance.ShadowColor = clGray
        TabAppearance.HighLightColor = 16775871
        TabAppearance.HighLightColorHot = clGray
        TabAppearance.HighLightColorSelected = clBtnFace
        TabAppearance.HighLightColorSelectedHot = clHighlight
        TabAppearance.HighLightColorDown = clHighlight
        TabAppearance.BackGround.Color = clBtnFace
        TabAppearance.BackGround.ColorTo = clBtnFace
        TabAppearance.BackGround.Direction = gdHorizontal
        object lbDBPath: TLabel
          Left = 17
          Top = 59
          Width = 71
          Height = 13
          Caption = 'Data Source'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbDBUser: TLabel
          Left = 17
          Top = 84
          Width = 47
          Height = 13
          Caption = 'DB User'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbDBPass: TLabel
          Left = 17
          Top = 108
          Width = 75
          Height = 13
          Caption = 'DB Password'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object EnterAsTab2: TEnterAsTab
          Left = 468
          Top = 104
          Width = 27
          Height = 27
          Caption = 'ET'
        end
        object lMDAC: TLabel
          Left = 16
          Top = 364
          Width = 36
          Height = 13
          Caption = 'MDAC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 17
          Top = 178
          Width = 72
          Height = 13
          Caption = 'Koneksi SPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label9: TLabel
          Left = 17
          Top = 134
          Width = 100
          Height = 13
          Caption = 'Retensi Database'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label10: TLabel
          Left = 205
          Top = 134
          Width = 23
          Height = 13
          Caption = 'Hari'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 17
          Top = 297
          Width = 81
          Height = 13
          Caption = 'Folder Backup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label12: TLabel
          Left = 16
          Top = 34
          Width = 86
          Height = 13
          Caption = 'Jenis Database'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label13: TLabel
          Left = 17
          Top = 321
          Width = 119
          Height = 13
          Caption = 'Share Folder Backup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label15: TLabel
          Left = 17
          Top = 202
          Width = 93
          Height = 13
          Caption = 'Webservice SPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label16: TLabel
          Left = 17
          Top = 226
          Width = 60
          Height = 13
          Caption = 'Auth.Code'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label17: TLabel
          Left = 17
          Top = 250
          Width = 86
          Height = 13
          Caption = 'Folder File DKE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object edDBPATH: TAdvEdit
          Left = 140
          Top = 55
          Width = 320
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
          Version = '3.1.1.1'
        end
        object edDBUser: TAdvEdit
          Left = 140
          Top = 80
          Width = 251
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 3
          Visible = True
          Version = '3.1.1.1'
        end
        object edtTPKConnection: TAdvEdit
          Left = 140
          Top = 174
          Width = 320
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 6
          Visible = True
          Version = '3.1.1.1'
        end
        object edtRetensiDatabase: TJvValidateEdit
          Left = 140
          Top = 130
          Width = 61
          Height = 21
          Alignment = taLeftJustify
          BevelKind = bkFlat
          BorderStyle = bsNone
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          MaxValue = 365.000000000000000000
          TabOrder = 5
        end
        object dirFolderBackup: TAdvDirectoryEdit
          Left = 140
          Top = 293
          Width = 321
          Height = 21
          EmptyTextStyle = []
          Flat = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          ReadOnly = False
          TabOrder = 8
          Visible = True
          Version = '1.3.4.2'
          ButtonStyle = bsButton
          ButtonWidth = 18
          Etched = False
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000C0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000FFF
            00000088888880FF00000B088888880F00000BB08888888000000BBB00000000
            00000BBBBBBB0B0F00000BBB00000B0F0000F000BBBBBB0F0000FF0BBBBBBB0F
            0000FF0BBB00000F0000FFF000FFFFFF0000}
          BrowseDialogText = 'Select Directory'
        end
        object edDBPass: TEdit
          Left = 140
          Top = 105
          Width = 251
          Height = 21
          BevelKind = bkFlat
          BorderStyle = bsNone
          PasswordChar = '*'
          TabOrder = 4
        end
        object AdvGlowButton1: TBitBtn
          Left = 461
          Top = 173
          Width = 23
          Height = 21
          Caption = '::'
          TabOrder = 2
          TabStop = False
          WordWrap = True
          OnClick = AdvGlowButton1Click
          Spacing = 2
        end
        object btnOpenDir: TBitBtn
          Left = 461
          Top = 55
          Width = 23
          Height = 21
          Caption = '::'
          TabOrder = 7
          TabStop = False
          WordWrap = True
          OnClick = btnOpenDirClick
          Spacing = 2
        end
        object cbDBType: TJvComboBox
          Left = 139
          Top = 29
          Width = 90
          Height = 22
          BevelKind = bkFlat
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 0
          Text = 'ACCESS'
          OnClick = cbDBTypeClick
          Items.Strings = (
            'ACCESS'
            'MSSQL')
          ItemIndex = 0
        end
        object dirShareBackup: TAdvDirectoryEdit
          Left = 140
          Top = 317
          Width = 321
          Height = 21
          EmptyTextStyle = []
          Flat = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          ReadOnly = False
          TabOrder = 9
          Visible = True
          Version = '1.3.4.2'
          ButtonStyle = bsButton
          ButtonWidth = 18
          Etched = False
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000C0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000FFF
            00000088888880FF00000B088888880F00000BB08888888000000BBB00000000
            00000BBBBBBB0B0F00000BBB00000B0F0000F000BBBBBB0F0000FF0BBBBBBB0F
            0000FF0BBB00000F0000FFF000FFFFFF0000}
          BrowseDialogText = 'Select Directory'
        end
        object edtWSDLTPK: TAdvEdit
          Left = 140
          Top = 198
          Width = 320
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 10
          Visible = True
          Version = '3.1.1.1'
        end
        object edtWSDLAuthCode: TAdvEdit
          Left = 140
          Top = 222
          Width = 125
          Height = 21
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          Ctl3D = True
          ParentCtl3D = False
          PasswordChar = '*'
          TabOrder = 11
          Visible = True
          Version = '3.1.1.1'
        end
        object edtFolderDKE: TAdvDirectoryEdit
          Left = 140
          Top = 246
          Width = 321
          Height = 21
          EmptyTextStyle = []
          Flat = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clWindow
          ReadOnly = False
          TabOrder = 12
          Visible = True
          Version = '1.3.4.2'
          ButtonStyle = bsButton
          ButtonWidth = 18
          Etched = False
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000C0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000FFF
            00000088888880FF00000B088888880F00000BB08888888000000BBB00000000
            00000BBBBBBB0B0F00000BBB00000B0F0000F000BBBBBB0F0000FF0BBBBBBB0F
            0000FF0BBB00000F0000FFF000FFFFFF0000}
          BrowseDialogText = 'Select Directory'
        end
      end
      object AdvOfficePage2: TAdvOfficePage
        Left = 1
        Top = 26
        Width = 520
        Height = 403
        Caption = 'Lain-Lain'
        PageAppearance.BorderColor = clGray
        PageAppearance.Color = clBtnFace
        PageAppearance.ColorTo = clBtnFace
        PageAppearance.ColorMirror = clBtnFace
        PageAppearance.ColorMirrorTo = clBtnFace
        PageAppearance.Gradient = ggVertical
        PageAppearance.GradientMirror = ggVertical
        TabAppearance.BorderColor = clGray
        TabAppearance.BorderColorHot = clGray
        TabAppearance.BorderColorSelected = clHighlight
        TabAppearance.BorderColorSelectedHot = clGray
        TabAppearance.BorderColorDisabled = clNone
        TabAppearance.BorderColorDown = clNone
        TabAppearance.Color = clBtnFace
        TabAppearance.ColorTo = clWhite
        TabAppearance.ColorSelected = clHighlight
        TabAppearance.ColorSelectedTo = clHighlight
        TabAppearance.ColorDisabled = clGray
        TabAppearance.ColorDisabledTo = clGray
        TabAppearance.ColorHot = clSilver
        TabAppearance.ColorHotTo = clSilver
        TabAppearance.ColorMirror = clWhite
        TabAppearance.ColorMirrorTo = clWhite
        TabAppearance.ColorMirrorHot = clSilver
        TabAppearance.ColorMirrorHotTo = clSilver
        TabAppearance.ColorMirrorSelected = clHighlight
        TabAppearance.ColorMirrorSelectedTo = clHighlight
        TabAppearance.ColorMirrorDisabled = clGray
        TabAppearance.ColorMirrorDisabledTo = clGray
        TabAppearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Font.Color = clWindowText
        TabAppearance.Font.Height = -11
        TabAppearance.Font.Name = 'Tahoma'
        TabAppearance.Font.Style = []
        TabAppearance.Gradient = ggVertical
        TabAppearance.GradientMirror = ggVertical
        TabAppearance.GradientHot = ggVertical
        TabAppearance.GradientMirrorHot = ggVertical
        TabAppearance.GradientSelected = ggVertical
        TabAppearance.GradientMirrorSelected = ggVertical
        TabAppearance.GradientDisabled = ggVertical
        TabAppearance.GradientMirrorDisabled = ggVertical
        TabAppearance.TextColor = clBlack
        TabAppearance.TextColorHot = clBlack
        TabAppearance.TextColorSelected = clWhite
        TabAppearance.TextColorDisabled = clGray
        TabAppearance.ShadowColor = clGray
        TabAppearance.HighLightColor = 16775871
        TabAppearance.HighLightColorHot = clGray
        TabAppearance.HighLightColorSelected = clBtnFace
        TabAppearance.HighLightColorSelectedHot = clHighlight
        TabAppearance.HighLightColorDown = clHighlight
        TabAppearance.BackGround.Color = clBtnFace
        TabAppearance.BackGround.ColorTo = clBtnFace
        TabAppearance.BackGround.Direction = gdHorizontal
        object lblKodePostingTerima: TLabel
          Left = 256
          Top = 99
          Width = 241
          Height = 13
          AutoSize = False
          Visible = False
        end
        object lblKodePostingReject: TLabel
          Left = 256
          Top = 122
          Width = 241
          Height = 13
          AutoSize = False
          Visible = False
        end
        object cbxUseTanggalPolaSiklus: TAdvOfficeCheckBox
          Left = 16
          Top = 16
          Width = 473
          Height = 20
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 
            'Gunakan Tanggal Transaksi  Debet Penyerahan Untuk Interface SPK ' +
            'Sesuai Pola Siklus Kliring'
          ReturnIsTab = False
          Version = '1.3.6.1'
        end
        object cbxParsialSyncOpsData: TAdvOfficeCheckBox
          Left = 16
          Top = 35
          Width = 233
          Height = 20
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Sinkronisasi Parsial Tabel Dimensi OPS'
          ReturnIsTab = False
          Version = '1.3.6.1'
        end
      end
    end
  end
  object DirDlg: TLMDDirDlg
    Left = 404
    Top = 128
  end
  object pgcStyler: TAdvOfficePagerOfficeStyler
    Style = psTerminal
    GlowButtonAppearance.BorderColor = clGray
    GlowButtonAppearance.BorderColorHot = clGray
    GlowButtonAppearance.BorderColorDown = clHighlight
    GlowButtonAppearance.BorderColorChecked = 4548219
    GlowButtonAppearance.BorderColorDisabled = 13882323
    GlowButtonAppearance.Color = clBtnFace
    GlowButtonAppearance.ColorTo = clBtnFace
    GlowButtonAppearance.ColorChecked = clGray
    GlowButtonAppearance.ColorCheckedTo = clGray
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = clHighlight
    GlowButtonAppearance.ColorDownTo = clHighlight
    GlowButtonAppearance.ColorHot = clSilver
    GlowButtonAppearance.ColorHotTo = clSilver
    GlowButtonAppearance.ColorMirror = clBtnFace
    GlowButtonAppearance.ColorMirrorTo = clBtnFace
    GlowButtonAppearance.ColorMirrorHot = clSilver
    GlowButtonAppearance.ColorMirrorHotTo = clSilver
    GlowButtonAppearance.ColorMirrorDown = clHighlight
    GlowButtonAppearance.ColorMirrorDownTo = clHighlight
    GlowButtonAppearance.ColorMirrorChecked = clGray
    GlowButtonAppearance.ColorMirrorCheckedTo = clGray
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    PageAppearance.BorderColor = clGray
    PageAppearance.Color = clBtnFace
    PageAppearance.ColorTo = clBtnFace
    PageAppearance.ColorMirror = clBtnFace
    PageAppearance.ColorMirrorTo = clBtnFace
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    TabAppearance.BorderColor = clGray
    TabAppearance.BorderColorHot = clGray
    TabAppearance.BorderColorSelected = clHighlight
    TabAppearance.BorderColorSelectedHot = clGray
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = clHighlight
    TabAppearance.ColorSelectedTo = clHighlight
    TabAppearance.ColorDisabled = clGray
    TabAppearance.ColorDisabledTo = clGray
    TabAppearance.ColorHot = clSilver
    TabAppearance.ColorHotTo = clSilver
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = clSilver
    TabAppearance.ColorMirrorHotTo = clSilver
    TabAppearance.ColorMirrorSelected = clHighlight
    TabAppearance.ColorMirrorSelectedTo = clHighlight
    TabAppearance.ColorMirrorDisabled = clGray
    TabAppearance.ColorMirrorDisabledTo = clGray
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = clBlack
    TabAppearance.TextColorHot = clBlack
    TabAppearance.TextColorSelected = clWhite
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = clGray
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = clGray
    TabAppearance.HighLightColorSelected = clBtnFace
    TabAppearance.HighLightColorSelectedHot = clHighlight
    TabAppearance.HighLightColorDown = clHighlight
    TabAppearance.BackGround.Color = clBtnFace
    TabAppearance.BackGround.ColorTo = clBtnFace
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 456
    Top = 156
  end
  object AdvPanelStyler1: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = clGray
    Settings.BorderShadow = False
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = clSilver
    Settings.Caption.ColorTo = clNone
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clBlack
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'MS Sans Serif'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 4
    Settings.Caption.ShadeLight = 255
    Settings.Caption.Visible = True
    Settings.Collaps = False
    Settings.CollapsColor = clHighlight
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = clBtnFace
    Settings.ColorTo = clNone
    Settings.ColorMirror = clNone
    Settings.ColorMirrorTo = clNone
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = clBlack
    Settings.Font.Height = -11
    Settings.Font.Name = 'MS Sans Serif'
    Settings.Font.Style = []
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clNone
    Settings.HoverFontColor = clNone
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = clBlack
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = clSilver
    Settings.StatusBar.GradientDirection = gdVertical
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psTerminal
    Left = 424
    Top = 156
  end
  object FolderDialog1: TFolderDialog
    DialogX = 0
    DialogY = 0
    Version = '1.1.0.2'
    Left = 489
    Top = 154
  end
  object tblRefWilayah: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=V:\Client\DB\DBSIK.' +
      'mdb;Persist Security Info=False'
    CursorType = ctStatic
    TableName = 'REF_WILAYAH_KLIRING'
    Left = 321
    Top = 38
  end
  object dsRefWilayah: TDataSource
    DataSet = tblRefWilayah
    Left = 289
    Top = 38
  end
  object qryGelarSingkatan: TADOQuery
    Parameters = <>
    Left = 481
    Top = 219
  end
  object dsGelarSingkatan: TDataSource
    DataSet = qryGelarSingkatan
    Left = 441
    Top = 219
  end
  object dlgInputGalar: TAdvInputTaskDialog
    CommonButtons = [cbOK]
    DefaultButton = 0
    InputType = itEdit
    Instruction = 'Gelar/Singkatan'
    Title = 'Input Gelar/Singkatan'
    Left = 483
    Top = 252
  end
  object qryTemp: TADOQuery
    Parameters = <>
    Left = 441
    Top = 251
  end
  object dsAlasan: TDataSource
    DataSet = qryAlasan
    Left = 441
    Top = 291
  end
  object qryAlasan: TADOQuery
    Parameters = <>
    Left = 481
    Top = 291
  end
  object qryKodePosting: TADOQuery
    Parameters = <>
    Left = 481
    Top = 187
  end
  object dsKodePosting: TDataSource
    DataSet = qryKodePosting
    Left = 441
    Top = 187
  end
end
