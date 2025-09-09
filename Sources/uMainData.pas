// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
unit uMainData;

interface

uses
  SysUtils,
  Classes;

type
  TMainData = class(TDataModule)
  end;

var
  MainData: TMainData;

implementation

uses
  uCoreUnit,
  uConfigUnit,
  uLangUnit,
  uMainForm;

{$R *.dfm}

end.
