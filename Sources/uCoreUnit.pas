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

end.
