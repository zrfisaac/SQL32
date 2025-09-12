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
    Main: TAction;
    procedure MainExecute(Sender: TObject);
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

procedure TAboutForm.MainExecute(Sender: TObject);
begin
  Self.Close;
end;

end.

