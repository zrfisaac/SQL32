object MainForm: TMainForm
  Left = 200
  Top = 140
  Width = 460
  Height = 320
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = miMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 242
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object sbFooter: TStatusBar
    Left = 0
    Top = 242
    Width = 444
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object miMenu: TMainMenu
    Left = 8
    Top = 8
    object miHelp: TMenuItem
      Caption = 'Ajuda'
      object miConfig: TMenuItem
        Caption = 'Configura'#231#227'o'
        OnClick = miConfigClick
      end
      object miAbout: TMenuItem
        Caption = 'Sobre'
        OnClick = miAboutClick
      end
    end
  end
  object acAction: TActionList
    Left = 40
    Top = 8
    object acConfig: TAction
      Category = 'Main'
      Caption = 'acConfig'
      ShortCut = 113
      OnExecute = acConfigExecute
    end
    object acClose: TAction
      Category = 'Main'
      Caption = 'acClose'
      ShortCut = 27
      OnExecute = acCloseExecute
    end
    object acRun: TAction
      Category = 'Main'
      Caption = 'acRun'
      ShortCut = 116
      OnExecute = acRunExecute
    end
    object acOpen: TAction
      Category = 'Main'
      Caption = 'acOpen'
      ShortCut = 120
      OnExecute = acOpenExecute
    end
  end
end
