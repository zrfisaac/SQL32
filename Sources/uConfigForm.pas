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
  uBaseForm,
  ActnList,
  ImgList;

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
    pnBde_Footer: TPanel;
    pnBde_Footer03: TPanel;
    btBde_Close: TBitBtn;
    pnBde_Footer02: TPanel;
    pnBde_Footer01: TPanel;
    sbBde: TScrollBox;
    btBde_Conection: TBitBtn;
    btBde_Save: TBitBtn;
    pnBde_Alias: TPanel;
    lbBde_Alias: TLabel;
    edBde_Alias: TEdit;
    pnBde_Server: TPanel;
    lbBde_Server: TLabel;
    edBde_Server: TEdit;
    pnBde_User: TPanel;
    lbBde_User: TLabel;
    edBde_User: TEdit;
    pnBde_Password: TPanel;
    lbBde_Password: TLabel;
    edBde_Password: TEdit;
    pnBde_Database: TPanel;
    lbBde_Database: TLabel;
    edBde_Database: TEdit;
    imList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btBde_SaveClick(Sender: TObject);
    procedure btBde_ConectionClick(Sender: TObject);
  public
    procedure fnConnect;
    procedure fnBde(_pEnable: Boolean);
    procedure fnDisconnect;
    procedure fnLoad;
    procedure fnSave;
  end;

var
  ConfigForm: TConfigForm;

implementation

uses
  uCoreUnit,
  uConfigUnit,
  uMainData;

{$R *.dfm}

procedure TConfigForm.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigLoad;
  Self.tsMain.TabVisible := False;
  Self.fnLoad;
end;

procedure TConfigForm.btBde_SaveClick(Sender: TObject);
begin
  inherited;
  Self.fnSave;
end;

procedure TConfigForm.fnConnect;
begin
  try
    MainData.bdeConection.Close;
    MainData.bdeConection.AliasName := Self.edBde_Alias.Text;
    MainData.bdeConection.Params.Values['SERVER NAME'] := Self.edBde_Server.Text;
    MainData.bdeConection.Params.Values['USER NAME'] := Self.edBde_User.Text;
    MainData.bdeConection.Params.Values['PASSWORD'] := Self.edBde_Password.Text;
    MainData.bdeConection.Params.Values['DATABASE NAME'] := Self.edBde_Database.Text;
    MainData.bdeConection.Open;
    Self.fnBde(False);
  except
    on e: Exception do
    begin
      Application.MessageBox(
         PChar(e.Message)
        ,PChar('Error!')
        ,MB_OK + MB_ICONERROR
      );
      Self.fnDisconnect;
    end;
  end;
end;

procedure TConfigForm.fnDisconnect;
begin
  Self.fnBde(True);
  MainData.bdeConection.Close;
end;

procedure TConfigForm.fnLoad;
begin
  if (ConfigDefault) then
  begin
    Config.Values['Bde_Conection'] := BoolToStr(False,True);
    Config.Values['Bde_Alias'] := Self.edBde_Alias.Text;
    Config.Values['Bde_Server'] := Self.edBde_Server.Text;
    Config.Values['Bde_User'] := Self.edBde_User.Text;
    Config.Values['Bde_Password'] := Self.edBde_Password.Text;
    Config.Values['Bde_Database'] := Self.edBde_Database.Text;
  end;
  Self.edBde_Alias.Text := Config.Values['Bde_Alias'];
  Self.edBde_Server.Text := Config.Values['Bde_Server'];
  Self.edBde_User.Text := Config.Values['Bde_User'];
  Self.edBde_Password.Text := Config.Values['Bde_Password'];
  Self.edBde_Database.Text := Config.Values['Bde_Database'];
end;

procedure TConfigForm.fnSave;
begin
  Config.Values['Bde_Conection'] := BoolToStr(MainData.bdeConection.Connected,True);
  Config.Values['Bde_Alias'] := Self.edBde_Alias.Text;
  Config.Values['Bde_Server'] := Self.edBde_Server.Text;
  Config.Values['Bde_User'] := Self.edBde_User.Text;
  Config.Values['Bde_Password'] := Self.edBde_Password.Text;
  Config.Values['Bde_Database'] := Self.edBde_Database.Text;
  ConfigSave;
end;

procedure TConfigForm.fnBde(_pEnable: Boolean);
begin
  if (_pEnable) then
  begin
    Self.btBde_Conection.Caption := 'Conectar';
    fnBitBtn(Self.btBde_Conection,Self.imList,2);
  end
  else
  begin
    Self.btBde_Conection.Caption := 'Desconectar';
    fnBitBtn(Self.btBde_Conection,Self.imList,0);
  end;
  Self.edBde_Alias.Enabled := _pEnable;
  Self.edBde_Server.Enabled := _pEnable;
  Self.edBde_User.Enabled := _pEnable;
  Self.edBde_Password.Enabled := _pEnable;
  Self.edBde_Database.Enabled := _pEnable;
end;

procedure TConfigForm.btBde_ConectionClick(Sender: TObject);
begin
  inherited;
  if (MainData.bdeConection.Connected) then
    Self.fnDisconnect
  else
    Self.fnConnect;
end;

end.
