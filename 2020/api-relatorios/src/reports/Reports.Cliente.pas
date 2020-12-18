unit Reports.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Reports.Base.Simples, Data.DB, RLReport, Services.Cliente, RLFilters, RLPDFFilter;

type
  TReportCliente = class(TReportSimples)
    lblCodigo: TRLLabel;
    lblNome: TRLLabel;
    lblSobrenome: TRLLabel;
    lblEmail: TRLLabel;
    lblTelefone: TRLLabel;
    txtCodigo: TRLDBText;
    txtNome: TRLDBText;
    txtSobrenome: TRLDBText;
    txtEmail: TRLDBText;
    txtTelefone: TRLDBText;
  protected
    function GetReportName: string; override;
    procedure InitializerService; override;
  end;

implementation

{$R *.dfm}

function TReportCliente.GetReportName: string;
begin
  Result := 'clientes';
end;

procedure TReportCliente.InitializerService;
begin
  inherited;
  Service := TServiceCliente.Create(Self);
end;

end.
