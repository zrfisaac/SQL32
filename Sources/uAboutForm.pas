// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
unit uAboutForm;

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
  Dialogs, StdCtrls, ExtCtrls, ActnList;

type
  TAboutForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    acAction: TActionList;
    actEsc: TAction;
    ascEnter: TAction;
    procedure act_Execute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

procedure TAboutForm.act_Execute(Sender: TObject);
begin
  Self.Close;
end;

procedure TAboutForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Self.Close;
end;

end.

