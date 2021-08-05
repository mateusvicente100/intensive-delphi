program Samples;

uses
  Vcl.Forms,
  Views.Principal in 'src\views\Views.Principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
