unit Reports.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLFilters, RLPDFFilter, Horse.OctetStream, dxGDIPlusClasses;

type
  TReportBase = class(TFrame)
    Report: TRLReport;
    BandHeader: TRLBand;
    BandFooter: TRLBand;
    lblData: TRLSystemInfo;
    lblHora: TRLSystemInfo;
    RLPDFFilter: TRLPDFFilter;
    DrawBackground: TRLDraw;
    lblIntensive: TRLLabel;
    lblDelphi: TRLLabel;
  private
    FReportName: string;
    FReportDirectory: string;
    function GetTempDirectory: string;
    function GetReportFilePath: string;
    function GetReportStream: TMemoryStream;
    procedure SaveReportToFile;
  protected
    function GetReportName: string; virtual;
  public
    constructor Create; reintroduce; virtual;
    function GetReport: TFileReturn; virtual;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

constructor TReportBase.Create;
begin
  inherited Create(nil);
  FReportName := Format('%s%s.pdf', [GetReportName, FormatDateTime('ddmmyyhhmmss', Now)]);
  FReportDirectory := GetTempDirectory;
end;

destructor TReportBase.Destroy;
begin
  if FileExists(GetReportFilePath) then
    DeleteFile(GetReportFilePath);
  inherited;
end;

function TReportBase.GetReport: TFileReturn;
begin
  SaveReportToFile;
  Result := TFileReturn.Create(GetReportName + '.pdf', GetReportStream);
end;

function TReportBase.GetReportFilePath: string;
begin
  Result := FReportDirectory + FReportName;
end;

function TReportBase.GetReportName: string;
begin
  Result := 'report';
end;

function TReportBase.GetReportStream: TMemoryStream;
begin
  Result := TMemoryStream.Create;
  Result.LoadFromFile(GetReportFilePath);
end;

procedure TReportBase.SaveReportToFile;
begin
  RLPDFFilter.ShowProgress := False;
  Report.PrintDialog := False;
  Report.ShowProgress := False;
  Report.Prepare;
  Report.SaveToFile(GetReportFilePath);
end;

function TReportBase.GetTempDirectory: string;
var
  LTempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @LTempFolder);
  Result := StrPas(LTempFolder);
  if not Result.EndsWith('\') then
    Result := Result + '\';
end;


end.
