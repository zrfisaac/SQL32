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
  Menus,
  ActnList,
  uBaseForm;

type
  TMainForm = class(TForm)
    pnBack: TPanel;
    sbFooter: TStatusBar;
    miMenu: TMainMenu;
    miHelp: TMenuItem;
    miConfig: TMenuItem;
    miAbout: TMenuItem;
    acAction: TActionList;
    procedure FormCreate(Sender: TObject);
  private
    Base: TBaseForm;
  public
    procedure Menu; overload;
    procedure Menu(_pClass: TComponentClass); overload;
    procedure Menu(_pClass: TComponentClass; var _pReference); overload;
    procedure Menu(var _pReference; _pClass: TComponentClass); overload;
  end;

var
  MainForm: TMainForm;

implementation

uses
  uCoreUnit,
  uConfigUnit,
  uLangUnit,
  uMainData,
  uQueryForm;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // # : Title
  Self.Caption := Application.Title;

  // # : Query
  Self.Menu(TQueryForm,QueryForm);
end;

procedure TMainForm.Menu(_pClass: TComponentClass);
var
  _vInstance: TBaseForm;
begin
  _vInstance := TBaseForm(_pClass.NewInstance);
  _vInstance.ShowModal;
  _vInstance.Free;
end;

procedure TMainForm.Menu;
begin
  if Assigned(Self.Base) then
    Self.Base.pnBack.Parent := Self.pnBack;
  Self.Base := Nil;
end;

procedure TMainForm.Menu(var _pReference; _pClass: TComponentClass);
begin
  Self.Menu(_pClass, _pReference);
end;

procedure TMainForm.Menu(_pClass: TComponentClass; var _pReference);
var
  _vInstance: TBaseForm;
begin
  Self.Menu;
  if not Assigned(TBaseForm(_pReference)) then
  begin
    _vInstance := TBaseForm(_pClass.NewInstance);
    _vInstance.Create(Application);
    TBaseForm(_pReference) := _vInstance;
  end
  else
    _vInstance := TBaseForm(_pReference);
  Self.Base := _vInstance;
  Self.Base.pnBack.Parent := Self.pnBack;
end;

end.

