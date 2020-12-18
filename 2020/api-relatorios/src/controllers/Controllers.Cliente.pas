unit Controllers.Cliente;

interface

uses Horse, System.Classes, Reports.Cliente, Horse.OctetStream;

procedure Registry;

implementation

procedure DoReportClientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LReport: TReportCliente;
begin
  LReport := TReportCliente.Create;
  try
    Res.Send<TFileReturn>(LReport.GetReport);
  finally
    LReport.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/clientes', DoReportClientes);
end;

end.
