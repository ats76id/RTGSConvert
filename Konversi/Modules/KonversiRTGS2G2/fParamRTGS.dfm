object frmParamRTGSConvert: TfrmParamRTGSConvert
  Left = 354
  Top = 186
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Parameter Konversi RTGS'
  ClientHeight = 352
  ClientWidth = 391
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
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 391
    Height = 352
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
      Top = 311
      Width = 391
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        391
        41)
      object btnGeneralEdit: TBitBtn
        Left = 204
        Top = 4
        Width = 85
        Height = 29
        Anchors = [akTop, akRight]
        Caption = '&Simpan'
        Default = True
        TabOrder = 0
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralEditClick
        Spacing = 2
      end
      object btnGeneralSave: TBitBtn
        Left = 294
        Top = 4
        Width = 85
        Height = 29
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = '&Batal'
        TabOrder = 1
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralSaveClick
        Spacing = 2
      end
    end
    object pageControl: TAdvOfficePager
      Left = 0
      Top = 0
      Width = 391
      Height = 311
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
        Width = 389
        Height = 283
        Caption = 'General'
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
          Left = 13
          Top = 20
          Width = 47
          Height = 13
          Caption = 'Nama File'
        end
        object Label2: TLabel
          Left = 13
          Top = 48
          Width = 29
          Height = 13
          Caption = 'Folder'
        end
        object edtFileName: TAdvEdit
          Left = 85
          Top = 16
          Width = 289
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
        object cbxMultipleOption: TAdvOfficeCheckBox
          Left = 13
          Top = 72
          Width = 117
          Height = 20
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Multiple Konversi'
          ReturnIsTab = False
          Version = '1.3.6.1'
        end
        object edtFolder: TAdvDirectoryEdit
          Left = 85
          Top = 44
          Width = 289
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
          TabOrder = 2
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
        object LMDGroupBox1: TLMDGroupBox
          Left = 16
          Top = 104
          Width = 361
          Height = 161
          Bevel.Mode = bmWindows
          Caption = ' TRN yg akan dikonversi '
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clBlack
          CaptionFont.Height = -11
          CaptionFont.Name = 'MS Sans Serif'
          CaptionFont.Style = []
          TabOrder = 3
          object lstTRN: TListBox
            Left = 13
            Top = 53
            Width = 332
            Height = 97
            Ctl3D = False
            ItemHeight = 13
            ParentCtl3D = False
            TabOrder = 0
          end
          object cboTRN: TLMDComboBox
            Left = 14
            Top = 24
            Width = 99
            Height = 21
            Ctl3D = False
            ItemHeight = 13
            ParentCtl3D = False
            Sorted = True
            Style = csDropDownList
            TabOrder = 1
          end
          object BitBtn4: TBitBtn
            Left = 118
            Top = 21
            Width = 75
            Height = 25
            Caption = '&Tambah'
            TabOrder = 2
            OnClick = BitBtn4Click
          end
          object BitBtn5: TBitBtn
            Left = 200
            Top = 21
            Width = 75
            Height = 25
            Caption = '&Hapus'
            TabOrder = 3
            OnClick = BitBtn5Click
          end
        end
      end
      object AdvOfficePager12: TAdvOfficePage
        Left = 1
        Top = 26
        Width = 389
        Height = 283
        Caption = 'Mapping TRN'
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
        object EnterAsTab2: TEnterAsTab
          Left = 468
          Top = 104
          Width = 27
          Height = 27
          Caption = 'ET'
        end
        object AdvGlowButton1: TBitBtn
          Left = 461
          Top = 173
          Width = 23
          Height = 21
          Caption = '::'
          TabOrder = 0
          TabStop = False
          WordWrap = True
          Spacing = 2
        end
        object btnOpenDir: TBitBtn
          Left = 461
          Top = 55
          Width = 23
          Height = 21
          Caption = '::'
          TabOrder = 1
          TabStop = False
          WordWrap = True
          Spacing = 2
        end
        object Panel1: TPanel
          Left = 2
          Top = 2
          Width = 385
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object BitBtn1: TBitBtn
            Left = 8
            Top = 7
            Width = 75
            Height = 25
            Caption = '&Tambah'
            TabOrder = 0
            OnClick = BitBtn1Click
          end
          object BitBtn2: TBitBtn
            Left = 88
            Top = 7
            Width = 75
            Height = 25
            Caption = '&Edit'
            TabOrder = 1
            OnClick = BitBtn2Click
          end
          object BitBtn3: TBitBtn
            Left = 168
            Top = 7
            Width = 75
            Height = 25
            Caption = '&Hapus'
            TabOrder = 2
            OnClick = BitBtn3Click
          end
        end
        object grdTC: TDBGrid
          Left = 2
          Top = 42
          Width = 385
          Height = 239
          Align = alClient
          Color = clWhite
          Ctl3D = False
          DataSource = dsKonversiTC
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TC_LAMA'
              Title.Caption = 'TRN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TC_BARU'
              Title.Caption = 'TC'
              Visible = True
            end>
        end
      end
    end
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
    Left = 344
    Top = 68
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
  object tblKonversiTC: TADOTable
    Left = 257
    Top = 34
  end
  object dsKonversiTC: TDataSource
    DataSet = tblKonversiTC
    Left = 291
    Top = 36
  end
  object XPManifest1: TXPManifest
    Left = 40
    Top = 8
  end
end
