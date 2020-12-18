unit Reports.Base.Simples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Reports.Base, RLReport, Data.DB, Services.Base.Simples, RLFilters, RLPDFFilter,
  dxGDIPlusClasses;

type
  TReportSimples = class(TReportBase)
    dsReport: TDataSource;
    BandeCabecalho: TRLBand;
    BandDetail: TRLBand;
    procedure ReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FService: TServiceBaseSimples;
  protected
    property Service: TServiceBaseSimples read FService write FService;
    procedure InitializerService; virtual; abstract;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

constructor TReportSimples.Create;
begin
  inherited;
  InitializerService;
  dsReport.DataSet := FService.qryReport;
end;

destructor TReportSimples.Destroy;
begin
  if Assigned(FService) then
    FService.Free;
  inherited;
end;

procedure TReportSimples.ReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  FService.qryReport.Close;
  FService.qryReport.Open();
end;

end.
