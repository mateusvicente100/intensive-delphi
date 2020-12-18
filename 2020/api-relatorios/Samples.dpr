program Samples;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.OctetStream,
  System.SysUtils,
  Services.Base in 'src\services\Services.Base.pas' {ServiceBase: TDataModule},
  Services.Base.Simples in 'src\services\Services.Base.Simples.pas' {ServiceBaseSimples: TDataModule},
  Reports.Base in 'src\reports\Reports.Base.pas' {ReportBase: TFrame},
  Reports.Base.Simples in 'src\reports\Reports.Base.Simples.pas' {ReportSimples: TFrame},
  Services.Cliente in 'src\services\Services.Cliente.pas' {ServiceCliente: TDataModule},
  Reports.Cliente in 'src\reports\Reports.Cliente.pas' {ReportCliente: TFrame},
  Controllers.Cliente in 'src\controllers\Controllers.Cliente.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
  THorse.Use(OctetStream);
  Controllers.Cliente.Registry;
  THorse.Listen(9000);
end.
