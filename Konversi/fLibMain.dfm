object frmLibMain: TfrmLibMain
  Left = 309
  Top = 172
  Width = 879
  Height = 430
  Caption = 'frmLibMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mxProtector: TmxProtector
    CodeKey = 'Ignore'
    ProtectionTypes = [stTimeTrial]
    Options = [poCheckSytemTime]
    RegistryRootKey = rkLocalMachine
    Expiration = 401767.000000000000000000
    MaxStartNumber = 0
    MaxDayNumber = 0
    Version = '1.30'
    OnExpiration = mxProtectorExpiration
    OnTimeTrial = mxProtectorTimeTrial
    OnInvalidSystemTime = mxProtectorInvalidSystemTime
    OnCodeData = mxProtectorCodeData
    OnDeCodeData = mxProtectorDeCodeData
    OnReset = mxProtectorReset
    OnGetString = mxProtectorGetString
    OnGetBoolean = mxProtectorGetBoolean
    OnPutString = mxProtectorPutString
    OnPutBoolean = mxProtectorPutBoolean
    Left = 312
    Top = 8
    UniqueCodeID = 
      '7A3247463432334C4A27324E4F3A2221205626395426222F342A2B242D2B5919' +
      '63611B16115B'
    UniqueID = 
      '210927026A7765110576781D09576B1D7160646E1D706C0A49046C0D67640067' +
      '021E75547424'
  end
end
