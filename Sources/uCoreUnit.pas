unit uCoreUnit;

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

procedure fnBitBtn(_pBitBtn: TBitBtn; _pImageList: TImageList; _pIndex: Integer);
function fnReplace(_pValue: String; _pFrom: String; _pTo: String = ''): String;
function fnVersion(_pProperty: String = ''; _pFile: String = ''): String;

implementation

procedure fnBitBtn(_pBitBtn: TBitBtn; _pImageList: TImageList; _pIndex: Integer);
var
  _vBitmap: TBitmap;
begin
  _vBitmap := TBitmap.Create;
  try
    _vBitmap.Width  := _pImageList.Width * 2;
    _vBitmap.Height := _pImageList.Height;
    _vBitmap.Transparent := True;
    _vBitmap.TransparentMode := tmAuto;
    _pImageList.Draw(_vBitmap.Canvas, 0, 0, _pIndex, True);
    _pBitBtn.Glyph.Assign(_vBitmap);
  finally
    _vBitmap.Free;
  end;
end;

function fnReplace(_pValue: String; _pFrom: String; _pTo: String = ''): String;
begin
  Result := StringReplace(_pValue, _pFrom, _pTo, [rfReplaceAll, rfIgnoreCase]);
end;

function fnVersion(_pProperty: String = ''; _pFile: String = ''): String;
var
  _vHandle: DWORD;
  _vInfoSize: DWORD;
  _vInfo: Pointer;
  _vVerBuf: Pointer;
  _vVerSize: UINT;
  _vLangPtr: ^DWORD;
  _vLangCharset: string;
  _vQuery: string;
begin
  Result := '';
  if (_pFile = '') then
    _pFile := ParamStr(0);
  if (_pProperty = '') then
    _pProperty := 'ProductVersion';

  _vHandle := 0;
  _vInfoSize := GetFileVersionInfoSize(PChar(_pFile), _vHandle);
  if _vInfoSize = 0 then Exit;

  GetMem(_vInfo, _vInfoSize);
  try
    if GetFileVersionInfo(PChar(_pFile), 0, _vInfoSize, _vInfo) then
    begin
      if VerQueryValue(_vInfo, '\VarFileInfo\Translation', Pointer(_vLangPtr), _vVerSize) and (_vVerSize >= 4) then
        _vLangCharset := IntToHex(LoWord(_vLangPtr^), 4) + IntToHex(HiWord(_vLangPtr^), 4)
      else
        //_vLangCharset := '040904E4'; // US English + CP1252
        _vLangCharset := '041604E4'; // pt-BR + CP1252
      _vQuery := Format('\StringFileInfo\%s\%s', [_vLangCharset, _pProperty]);
      if VerQueryValue(_vInfo, PChar(_vQuery), _vVerBuf, _vVerSize) then
        Result := PChar(_vVerBuf);
    end;
  finally
    FreeMem(_vInfo);
  end;
end;

end.
