object AboutForm: TAboutForm
  Left = 200
  Top = 140
  BorderStyle = bsNone
  Caption = 'AboutForm'
  ClientHeight = 101
  ClientWidth = 284
  Color = 1973790
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 14869218
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = act_Execute
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 284
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Isaac Caires Santana'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14869218
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    OnClick = act_Execute
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 284
    Height = 52
    Align = alClient
    BevelOuter = bvNone
    Caption = 'zrfisaac.github.io'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14869218
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = True
    ParentFont = False
    TabOrder = 1
    OnClick = act_Execute
  end
  object acAction: TActionList
    Left = 8
    Top = 64
    object actEsc: TAction
      Caption = 'actEsc'
      ShortCut = 27
      OnExecute = act_Execute
    end
    object ascEnter: TAction
      Caption = 'ascEnter'
      ShortCut = 13
      OnExecute = act_Execute
    end
  end
end
