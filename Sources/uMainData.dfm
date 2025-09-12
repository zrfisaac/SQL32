object MainData: TMainData
  OldCreateOrder = False
  Left = 200
  Top = 140
  Height = 320
  Width = 460
  object bdeConection: TDatabase
    DatabaseName = 'dbBDE'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 32
    Top = 8
  end
  object bdeQuery: TQuery
    DatabaseName = 'dbBDE'
    Left = 32
    Top = 56
  end
end
