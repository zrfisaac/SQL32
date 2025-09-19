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
    acConfig: TAction;
    acClose: TAction;
    acRun: TAction;
    acOpen: TAction;
    miExport: TMenuItem;
    miExportCsv: TMenuItem;
    miExportSelect: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure miConfigClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure acConfigExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRunExecute(Sender: TObject);
    procedure acOpenExecute(Sender: TObject);
    procedure miExportCsvClick(Sender: TObject);
    procedure miExportSelectClick(Sender: TObject);
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
  uAboutForm,
  uConfigForm,
  uQueryForm;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // # : Title
  Self.Caption := Application.Title;

  // # : Status
  Self.sbFooter.Panels[0].Text := fnVersion;
  Self.sbFooter.Panels[1].Text := fnVersion('InternalName') + '     .';

  // # : DataModule
  if not Assigned(MainData) then
    MainData := TMainData.Create(Application);

  // # : Config
  if not Assigned(ConfigForm) then
    ConfigForm := TConfigForm.Create(Application);

  // # : Query
  Self.Menu(TQueryForm,QueryForm);

  // # : Bde
  if (StrToBoolDef(Config.Values['Bde_Conection'],False)) then
  begin
    ConfigForm.fnConnect;
  end
  else
  begin
    Self.Menu(TConfigForm, ConfigForm);
  end;
end;

procedure TMainForm.Menu(_pClass: TComponentClass);
var
  _vInstance: TBaseForm;
begin
  _vInstance := TBaseForm(_pClass.NewInstance);
  _vInstance.Create(Application);
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

procedure TMainForm.miConfigClick(Sender: TObject);
begin
  Self.Menu(TConfigForm, ConfigForm);
end;

procedure TMainForm.miAboutClick(Sender: TObject);
begin
  Self.Menu(TAboutForm);
end;

procedure TMainForm.acConfigExecute(Sender: TObject);
begin
  Self.Menu(TConfigForm, ConfigForm);
end;

procedure TMainForm.acCloseExecute(Sender: TObject);
begin
  if Assigned(Self.Base) then
  begin
    if not(Self.Base.Name = 'QueryForm') then
      Self.Base.fnOnClose(Nil);
  end;
end;

procedure TMainForm.acRunExecute(Sender: TObject);
begin
  if Assigned(Self.Base) then
  begin
    if (Self.Base.Name = 'QueryForm') then
    begin
      TQueryForm(Self.Base).fnRun;
    end;
  end;
end;

procedure TMainForm.acOpenExecute(Sender: TObject);
begin
  if Assigned(Self.Base) then
  begin
    if (Self.Base.Name = 'QueryForm') then
    begin
      TQueryForm(Self.Base).fnOpen;
    end;
  end;
end;

procedure TMainForm.miExportCsvClick(Sender: TObject);
begin
  QueryForm.fnExportCsv;
end;

procedure TMainForm.miExportSelectClick(Sender: TObject);
begin
  QueryForm.fnExportSelect;
end;

end.

