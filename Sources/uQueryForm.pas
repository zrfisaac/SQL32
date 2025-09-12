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
  DBGrids;

type
  TQueryForm = class(TBaseForm)
    spOutput: TSplitter;
    meScript: TSynEdit;
    tbTool: TToolBar;
    imVoid01: TImage;
    btRun: TSpeedButton;
    btOpen: TSpeedButton;
    pmCode: TPopupMenu;
    dtsOutput: TDataSource;
    dbgOutput: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btRunClick(Sender: TObject);
  public
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
  MainData.bdeQuery.Open;
  Self.spOutput.Visible := True;
  Self.dbgOutput.Visible := True;
end;

procedure TQueryForm.fnRun;
begin
  Self.spOutput.Visible := False;
  Self.dbgOutput.Visible := False;
  MainData.bdeQuery.Close;
  MainData.bdeQuery.ExecSQL;
end;

procedure TQueryForm.FormCreate(Sender: TObject);
begin
  inherited;
  Self.spOutput.Visible := False;
  Self.dbgOutput.Visible := False;
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

end.

