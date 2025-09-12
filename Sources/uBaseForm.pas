// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
unit uBaseForm;

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
  ExtCtrls;

type
  TBaseForm = class(TForm)
    pnBack: TPanel;
    procedure fnOnClose(Sender: TObject);
  end;

var
  BaseForm: TBaseForm;

implementation

{$R *.dfm}

{ TBaseForm }

procedure TBaseForm.fnOnClose(Sender: TObject);
begin
  Self.pnBack.Parent := Self;
end;

end.
