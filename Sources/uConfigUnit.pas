// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
unit uConfigUnit;

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
  Dialogs;

function Config: TStrings;
function ConfigDefault: Boolean;
procedure ConfigLoad;
procedure ConfigSave;

implementation

var
  vPath: String;
  vDefault: Boolean;
  vConfig: TStrings;

function Config: TStrings;
begin
  Result := vConfig;
end;

function ConfigDefault: Boolean;
begin
  Result := vDefault;
end;

procedure ConfigLoad;
begin
  if FileExists(vPath) then
    Config.LoadFromFile(vPath);
end;

procedure ConfigSave;
begin
  Config.SaveToFile(vPath);
end;

initialization
  vConfig := TStringList.Create;
  vPath := ExtractFileDir(ParamStr(0)) + '\_.cfg';
  if not FileExists(vPath) then
    vPath := ExtractFileDir(ParamStr(0)) + '\Config.cfg';
  vDefault := not FileExists(vPath);
finalization
end.

