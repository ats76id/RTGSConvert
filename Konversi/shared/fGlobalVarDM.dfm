object GlobalVarDM: TGlobalVarDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 350
  Top = 168
  Height = 324
  Width = 365
  object MainADOConn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=skn_sectserver;Data Source=STEVE02\SQL2K'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 32
  end
  object paramsTable: TADOTable
    Connection = DailyADOConn
    CursorType = ctStatic
    TableName = 'Params'
    Left = 48
    Top = 80
  end
  object paramsDataSource: TDataSource
    DataSet = paramsTable
    Left = 140
    Top = 80
  end
  object DailyADOConn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=V:\Client\DB\DBSIK.' +
      'mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 136
  end
  object DBTPKADOConn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=DBTPK;Data Source=(local)'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 196
  end
  object TempQuery: TADOQuery
    Connection = DailyADOConn
    Parameters = <>
    Left = 144
    Top = 32
  end
  object qryLogDaily: TADOQuery
    Connection = DailyADOConn
    Parameters = <>
    Left = 140
    Top = 146
  end
end
