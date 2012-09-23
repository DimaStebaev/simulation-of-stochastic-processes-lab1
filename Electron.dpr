program Electron;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  logic in 'logic.pas',
  globals in 'globals.pas';

{$R *.res}
//{$R+}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
