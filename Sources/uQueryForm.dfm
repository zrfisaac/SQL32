inherited QueryForm: TQueryForm
  Height = 400
  Caption = 'QueryForm'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBack: TPanel
    Height = 361
    object spOutput: TSplitter
      Left = 0
      Top = 237
      Width = 444
      Height = 4
      Cursor = crVSplit
      Align = alBottom
      Color = clBlack
      ParentColor = False
    end
    object meScript: TSynEdit
      Left = 0
      Top = 29
      Width = 444
      Height = 208
      Align = alClient
      Constraints.MinHeight = 80
      Constraints.MinWidth = 320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      PopupMenu = pmScript
      TabOrder = 0
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Highlighter = SynSQLSyn
      FontSmoothing = fsmNone
    end
    object tbTool: TToolBar
      Left = 0
      Top = 0
      Width = 444
      Height = 29
      Caption = 'tbTool'
      TabOrder = 1
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
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
          70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
          70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
          70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
        OnClick = btRunClick
      end
      object btOpen: TSpeedButton
        Left = 32
        Top = 2
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C8807FF7777777777FF700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = btOpenClick
      end
    end
    object dbgOutput: TDBGrid
      Left = 0
      Top = 241
      Width = 444
      Height = 120
      Align = alBottom
      Constraints.MinHeight = 80
      Constraints.MinWidth = 320
      DataSource = dtsOutput
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object pmScript: TPopupMenu
    Left = 72
    Top = 40
  end
  object dtsOutput: TDataSource
    DataSet = MainData.bdeQuery
    Left = 40
    Top = 40
  end
  object SynSQLSyn: TSynSQLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 40
    Top = 72
  end
  object dgSaveCsv: TSaveDialog
    FileName = 'TABELA.csv'
    Filter = 'Arquivo CSV (*.csv)|*.csv'
    Left = 104
    Top = 40
  end
  object dgSaveSelect: TSaveDialog
    FileName = 'SELECT.sql'
    Filter = 'Select SQL (*.sql)|*.sql'
    Left = 104
    Top = 72
  end
end
