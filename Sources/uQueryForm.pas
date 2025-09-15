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
  uBaseForm,
  Menus,
  DB,
  Grids,
  DBGrids, SynEditHighlighter, SynHighlighterSQL;

type
  TQueryForm = class(TBaseForm)
    spOutput: TSplitter;
    meScript: TSynEdit;
    tbTool: TToolBar;
    imVoid01: TImage;
    btRun: TSpeedButton;
    btOpen: TSpeedButton;
    pmScript: TPopupMenu;
    dtsOutput: TDataSource;
    dbgOutput: TDBGrid;
    pmOutput: TPopupMenu;
    miOutputExport: TMenuItem;
    miOutputCopy: TMenuItem;
    miOutputCopyAll: TMenuItem;
    miOutputCopyCsv: TMenuItem;
    miOutputExportCsv: TMenuItem;
    miOutputExportAll: TMenuItem;
    SynSQLSyn: TSynSQLSyn;
    procedure FormCreate(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btRunClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    vQuery: TStrings;
    vQueryPath: String;
    procedure fnRun;
    procedure fnOpen;
  end;

var
  QueryForm: TQueryForm;

implementation

uses
  uMainData;

{$R *.dfm}

procedure TQueryForm.fnOpen;
begin
  MainData.bdeQuery.Close;
  MainData.bdeQuery.SQL.Text := Self.meScript.LineText;
  if not(Trim(MainData.bdeQuery.SQL.Text) = '') then
  begin
    MainData.bdeQuery.Open;
    Self.spOutput.Visible := True;
    Self.dbgOutput.Visible := True;
    Self.meScript.Lines.SaveToFile(Self.vQueryPath);
  end;
end;

procedure TQueryForm.fnRun;
begin
  Self.spOutput.Visible := False;
  Self.dbgOutput.Visible := False;
  MainData.bdeQuery.Close;
  MainData.bdeQuery.SQL.Text := Self.meScript.LineText;
  if not(Trim(MainData.bdeQuery.SQL.Text) = '') then
  begin
    MainData.bdeQuery.ExecSQL;
    Self.meScript.Lines.SaveToFile(Self.vQueryPath);
  end;
end;

procedure TQueryForm.FormCreate(Sender: TObject);
begin
  inherited;

  // # : Form
  Self.spOutput.Visible := False;
  Self.dbgOutput.Visible := False;

  // # : Script
  Self.vQuery := TStringList.Create;
  Self.vQueryPath := ExtractFileDir(ParamStr(0)) + '\Script.sql';
  if FileExists(Self.vQueryPath) then
    Self.meScript.Lines.LoadFromFile(Self.vQueryPath);
end;

procedure TQueryForm.btOpenClick(Sender: TObject);
begin
  inherited;
  Self.fnOpen;
end;

procedure TQueryForm.btRunClick(Sender: TObject);
begin
  inherited;
  Self.fnRun;
end;

procedure TQueryForm.FormDestroy(Sender: TObject);
begin
  inherited;
  Self.meScript.Lines.SaveToFile(Self.vQueryPath);
end;

end.

