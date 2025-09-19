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
    SynSQLSyn: TSynSQLSyn;
    dgSaveCsv: TSaveDialog;
    dgSaveSelect: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btRunClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    vQuery: TStrings;
    vQueryPath: String;
    procedure fnExportCsv;
    procedure fnExportSelect;
    function fnFieldData(_pField: TField; _pQuotes: String = ''''): String;
    procedure fnRun;
    procedure fnOpen;
  end;

var
  QueryForm: TQueryForm;

implementation

uses
  uCoreUnit,
  uMainData;

{$R *.dfm}

procedure TQueryForm.fnOpen;
begin
  MainData.bdeQuery.Close;
  MainData.bdeQuery.SQL.Text := Self.meScript.Lines.Text;
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
  MainData.bdeQuery.SQL.Text := Self.meScript.Lines.Text;
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

procedure TQueryForm.fnExportCsv;
var
  _vI0: Integer;
  _vDataset: TDataSet;
  _vFile: TStrings;
  _vLine: String;
  _vPath: String;
begin
  inherited;
  if (Self.dbgOutput.Visible) then
  begin
    _vLine := '';
    _vDataset := Self.dtsOutput.DataSet;
    if (Assigned(_vDataset)) then
    begin
      if (Self.dgSaveCsv.Execute) then
      begin
        _vFile := TStringList.Create;
        _vPath := Self.dgSaveCsv.FileName;
        if not(Pos('.csv',_vPath) > 0) then
          _vPath := _vPath + '.csv';
        if (FileExists(_vPath)) then
          DeleteFile(_vPath);
        _vLine := '';
        for _vI0 := 0 to _vDataset.Fields.Count -1 do
          if (_vI0 = 0) then
            _vLine := _vLine + '"' + _vDataset.Fields[_vI0].FieldName + '"'
          else
            _vLine := _vLine + ',"' + _vDataset.Fields[_vI0].FieldName + '"';
        _vFile.Add(_vLine);
        _vDataset.First;
        while not(_vDataset.Eof) do
        begin
          _vLine := '';
          for _vI0 := 0 to _vDataset.Fields.Count -1 do
          begin
            if (_vI0 = 0) then
              _vLine := _vLine + Self.fnFieldData(_vDataset.Fields[_vI0],'"')
            else
              _vLine := _vLine + ',' + Self.fnFieldData(_vDataset.Fields[_vI0],'"');
          end;
          _vFile.Add(_vLine);
          _vDataset.Next;
        end;
        _vDataset.First;
        _vFile.SaveToFile(_vPath);
      end;
    end;
  end;
end;

function TQueryForm.fnFieldData(_pField: TField; _pQuotes: String = ''''): String;
var
  _vReturn: String;
begin
  _vReturn := '';
  if (_pField.IsNull) then
    _vReturn := 'NULL'
  else if (_pField.DataType = ftDate) then
    _vReturn := _pQuotes + FormatDateTime('yyyy-MM-dd',_pField.AsVariant) + _pQuotes
  else if (_pField.DataType = ftDateTime) then
    _vReturn := _pQuotes + FormatDateTime('yyyy-MM-dd hh:mm:ss.zzz',_pField.AsVariant) + _pQuotes
  else if (_pField.DataType = ftString) then
    if (_pQuotes = '''') then
      _vReturn := _pQuotes + fnReplace(_pField.AsString,'''','''''') + _pQuotes
    else
      _vReturn := _pQuotes + _pField.AsString + _pQuotes
  else if (_pField.DataType in [ftAutoInc,ftSmallint,ftInteger,ftWord,ftFloat,ftCurrency,ftLargeint]) then
    _vReturn := _pField.AsString
  else
    _vReturn := 'NULL';
  Result := _vReturn;
end;

procedure TQueryForm.fnExportSelect;
var
  _vI0: Integer;
  _vComma: String;
  _vData: String;
  _vDataset: TDataSet;
  _vField: TField;
  _vFile: TStrings;
  _vLine: String;
  _vPath: String;
  _vType: String;
begin
  inherited;
  if (Self.dbgOutput.Visible) then
  begin
    _vLine := '';
    _vDataset := Self.dtsOutput.DataSet;
    if (Assigned(_vDataset)) then
    begin
      if (Self.dgSaveSelect.Execute) then
      begin
        _vFile := TStringList.Create;
        _vPath := Self.dgSaveSelect.FileName;
        if not(Pos('.sql',_vPath) > 0) then
          _vPath := _vPath + '.sql';
        if (FileExists(_vPath)) then
          DeleteFile(_vPath);
        _vFile.Add('SELECT * FROM (');
        _vFile.Add('	SELECT');
        _vLine := '';
        for _vI0 := 0 to _vDataset.Fields.Count -1 do
        begin
          _vField := _vDataset.Fields[_vI0];
          if (_vField.DataType = ftString) then
            _vType := ''''''
          else if (_vField.DataType in [ftAutoInc,ftSmallint,ftInteger,ftWord,ftLargeint]) then
            _vType := '0'
          else if (_vField.DataType in [ftDateTime]) then
            _vType := 'GETDATE()'
          else if (_vField.DataType in [ftFloat,ftCurrency]) then
            _vType := '0.0'
          else
            _vType := '''''';
          _vComma := ',';
          if (_vI0 = 0) then
            _vComma := ' ';
          _vFile.Add('		' + _vComma + _vField.FieldName + ' = ' + _vType);
        end;
        _vFile.Add('	WHERE 0 <> 0');
        _vDataset.First;
        while not(_vDataset.Eof) do
        begin
          _vLine := '';
          for _vI0 := 0 to _vDataset.Fields.Count -1 do
          begin
            _vField := _vDataset.Fields[_vI0];
            _vComma := ',';
            if (_vI0 = 0) then
              _vComma := '	UNION ALL SELECT ';
            _vData := Self.fnFieldData(_vField);
            if (_vField.DataType = ftDateTime) then
              _vData := 'CONVERT(DATETIME,' + _vData + ', 120)';
            _vLine := _vLine + _vComma + _vData;
          end;
          _vFile.Add(_vLine);
          _vDataset.Next;
        end;
        _vDataset.First;
        _vFile.Add(') AS AL_DATA');
        _vFile.SaveToFile(_vPath);
      end;
    end;
  end;
end;

end.

