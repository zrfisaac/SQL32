program SQL32;

uses
  Forms,
  uMainForm in 'Sources\uMainForm.pas' {MainForm},
  uMainData in 'Sources\uMainData.pas' {MainData: TDataModule},
  uBaseForm in 'Sources\uBaseForm.pas' {BaseForm},
  uConfigUnit in 'Sources\uConfigUnit.pas',
  uLangUnit in 'Sources\uLangUnit.pas',
  uCoreUnit in 'Sources\uCoreUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SQL32';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
