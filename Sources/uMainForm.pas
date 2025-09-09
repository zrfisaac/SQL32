// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
unit uMainForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  Menus, ActnList;

type
  TMainForm = class(TForm)
    pnBack: TPanel;
    sbFooter: TStatusBar;
    miMenu: TMainMenu;
    miHelp: TMenuItem;
    miConfig: TMenuItem;
    miAbout: TMenuItem;
    acAction: TActionList;
  end;

var
  MainForm: TMainForm;

implementation

uses
  uCoreUnit,
  uConfigUnit,
  uLangUnit,
  uMainData;

{$R *.dfm}

end.
