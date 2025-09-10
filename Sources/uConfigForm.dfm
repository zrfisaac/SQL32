inherited ConfigForm: TConfigForm
  Caption = 'ConfigForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBack: TPanel
    object pcBack: TPageControl
      Left = 0
      Top = 0
      Width = 444
      Height = 281
      ActivePage = tsMain
      Align = alClient
      TabOrder = 0
      object tsMain: TTabSheet
        Caption = 'tsMain'
        object pnMain_Footer: TPanel
          Left = 0
          Top = 212
          Width = 436
          Height = 41
          Align = alBottom
          TabOrder = 0
          object pnMain_Footer03: TPanel
            Left = 344
            Top = 1
            Width = 91
            Height = 39
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btMain_Close: TBitBtn
              Left = 8
              Top = 8
              Width = 75
              Height = 25
              Caption = 'btMain_Close'
              TabOrder = 0
            end
          end
          object pnMain_Footer02: TPanel
            Left = 336
            Top = 1
            Width = 8
            Height = 39
            Align = alRight
            BevelOuter = bvNone
            Color = clFuchsia
            TabOrder = 1
            Visible = False
          end
          object pnMain_Footer01: TPanel
            Left = 1
            Top = 1
            Width = 335
            Height = 39
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
          end
        end
        object sbMain: TScrollBox
          Left = 0
          Top = 0
          Width = 436
          Height = 212
          Align = alClient
          Color = clGray
          ParentColor = False
          TabOrder = 1
        end
      end
      object tsBde: TTabSheet
        Caption = 'tsBde'
        ImageIndex = 1
      end
    end
  end
end
