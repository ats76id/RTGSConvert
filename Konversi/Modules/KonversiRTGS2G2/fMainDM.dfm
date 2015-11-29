object MainDM: TMainDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 297
  Top = 177
  Height = 150
  Width = 215
  object qryTemp: TADOQuery
    Connection = GlobalVarDM.DailyADOConn
    Parameters = <>
    Left = 48
    Top = 16
  end
end
