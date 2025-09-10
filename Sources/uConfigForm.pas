// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
unit uConfigForm;

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
  StdCtrls,
  Buttons,
  ComCtrls,
  uBaseForm;

type
  TConfigForm = class(TBaseForm)
    pcBack: TPageControl;
    tsMain: TTabSheet;
    tsBde: TTabSheet;
    pnMain_Footer: TPanel;
    pnMain_Footer03: TPanel;
    btMain_Close: TBitBtn;
    pnMain_Footer02: TPanel;
    pnMain_Footer01: TPanel;
    sbMain: TScrollBox;
  end;

var
  ConfigForm: TConfigForm;

implementation

{$R *.dfm}

end.
