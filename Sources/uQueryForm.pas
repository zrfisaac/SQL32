// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
unit uQueryForm;

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
  Buttons,
  ToolWin,
  ComCtrls,
  SynEdit,
  ActnList,
  ImgList,
  uBaseForm, Menus, DB;

type
  TQueryForm = class(TBaseForm)
    pcOutput: TPageControl;
    Splitter1: TSplitter;
    seCode: TSynEdit;
    tbTool: TToolBar;
    imVoid01: TImage;
    btRun: TSpeedButton;
    btOpen: TSpeedButton;
    acAction: TActionList;
    imList: TImageList;
    acRun: TAction;
    acOpen: TAction;
    pmCode: TPopupMenu;
    dtsOutput: TDataSource;
    procedure acRunExecute(Sender: TObject);
    procedure acOpenExecute(Sender: TObject);
  end;

var
  QueryForm: TQueryForm;

implementation

uses
  uMainData;

{$R *.dfm}

procedure TQueryForm.acRunExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TQueryForm.acOpenExecute(Sender: TObject);
begin
  inherited;
  //
end;

end.

