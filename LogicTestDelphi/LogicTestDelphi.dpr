program LogicTestDelphi;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frMain},
  uNetWork in 'uNetWork.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrMain, frMain);
  Application.Run;
end.
