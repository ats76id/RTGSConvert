object GlobalVarForm: TGlobalVarForm
  Left = 426
  Top = 166
  Width = 357
  Height = 313
  Caption = 'GlobalVarForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object JvAppDBStorage1: TJvAppDBStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    StorageOptions.FloatAsString = True
    DataSource = GlobalVarDM.paramsDataSource
    KeyField = 'para_key'
    SectionField = 'para_section'
    ValueField = 'para_value'
    Left = 40
    Top = 56
  end
  object JvAppRegistryStorage1: TJvAppXMLFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    StorageOptions.FloatAsString = True
    StorageOptions.AutoEncodeValue = False
    StorageOptions.AutoEncodeEntity = False
    StorageOptions.InvalidCharReplacement = '_'
    Location = flCustom
    RootNodeName = 'Configuration'
    SubStorages = <>
    Left = 192
    Top = 160
  end
  object cmCipher: TCipherManager
    Mode = cmCTS
    Left = 48
    Top = 116
    Cipher = 'TCipher_Blowfish'
  end
end
