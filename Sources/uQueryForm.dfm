inherited QueryForm: TQueryForm
  Height = 396
  Caption = 'QueryForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBack: TPanel
    Height = 357
    object Splitter1: TSplitter
      Left = 0
      Top = 272
      Width = 444
      Height = 4
      Cursor = crVSplit
      Align = alBottom
      Color = clBlack
      ParentColor = False
    end
    object pcOutput: TPageControl
      Left = 0
      Top = 276
      Width = 444
      Height = 81
      Align = alBottom
      TabOrder = 0
    end
    object seCode: TSynEdit
      Left = 0
      Top = 29
      Width = 444
      Height = 243
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      PopupMenu = pmCode
      TabOrder = 1
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      FontSmoothing = fsmNone
    end
    object tbTool: TToolBar
      Left = 0
      Top = 0
      Width = 444
      Height = 29
      Caption = 'tbTool'
      TabOrder = 2
      object imVoid01: TImage
        Left = 0
        Top = 2
        Width = 9
        Height = 22
      end
      object btRun: TSpeedButton
        Left = 9
        Top = 2
        Width = 23
        Height = 22
        Action = acRun
      end
      object btOpen: TSpeedButton
        Left = 32
        Top = 2
        Width = 23
        Height = 22
        Action = acOpen
      end
    end
  end
  object acAction: TActionList
    Images = imList
    Left = 40
    Top = 40
    object acRun: TAction
      Category = 'Main'
      ShortCut = 116
      OnExecute = acRunExecute
    end
    object acOpen: TAction
      Category = 'Main'
      ShortCut = 120
      OnExecute = acOpenExecute
    end
  end
  object imList: TImageList
    Left = 40
    Top = 72
  end
  object pmCode: TPopupMenu
    Images = imList
    Left = 72
    Top = 40
  end
  object dtsOutput: TDataSource
    Left = 40
    Top = 104
  end
end
