unit Views.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Amazon.Storage.Service, Vcl.ExtCtrls, dxGDIPlusClasses, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    Panel4: TPanel;
    Label6: TLabel;
    btnListarBuckets: TButton;
    DBGridBuckets: TDBGrid;
    Panel5: TPanel;
    Label7: TLabel;
    btnListarArquivos: TButton;
    btnBaixarArquivos: TButton;
    btnExcluirArquivos: TButton;
    btnEnviarArquivos: TButton;
    DBGridArquivos: TDBGrid;
    btnCriarBucket: TButton;
    btnExcluirBucket: TButton;
    dsBuckets: TDataSource;
    dsArquivos: TDataSource;
    mtBuckets: TFDMemTable;
    mtArquivos: TFDMemTable;
    mtBucketsNOME: TStringField;
    mtArquivosNOME: TStringField;
    edtBucket: TEdit;
    OpenDialog: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnListarBucketsClick(Sender: TObject);
    procedure btnCriarBucketClick(Sender: TObject);
    procedure btnExcluirBucketClick(Sender: TObject);
    procedure btnListarArquivosClick(Sender: TObject);
    procedure btnEnviarArquivosClick(Sender: TObject);
    procedure btnExcluirArquivosClick(Sender: TObject);
    procedure btnBaixarArquivosClick(Sender: TObject);
  private
    { Private declarations }
    procedure InicializarServicoAmazon;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnBaixarArquivosClick(Sender: TObject);
var
  LFile: TMemoryStream;
begin
  LFile := TAmazonStorageService.New.DownloadFile(mtArquivosNOME.AsString);
  try
    LFile.SaveToFile('C:\Amazon\' + mtArquivosNOME.AsString);
  finally
    LFile.Free;
  end;
  ShowMessage('Baixou');
end;

procedure TForm1.btnCriarBucketClick(Sender: TObject);
begin
  TAmazonStorageService.New.CreateBucket(edtBucket.Text);
  mtBuckets.Append;
  mtBucketsNOME.AsString := edtBucket.Text;
  mtBuckets.Post;
  edtBucket.Clear;
end;

procedure TForm1.btnEnviarArquivosClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    TAmazonStorageService.New(mtBucketsNOME.AsString).UploadFile(OpenDialog.FileName);
    ShowMessage('enviou');
  end;
end;

procedure TForm1.btnExcluirArquivosClick(Sender: TObject);
begin
  TAmazonStorageService.New(mtBucketsNOME.AsString).DeleteFile(mtArquivosNOME.AsString);
  mtArquivos.Delete;
end;

procedure TForm1.btnExcluirBucketClick(Sender: TObject);
begin
  TAmazonStorageService.New.DeleteBucket(mtBucketsNOME.AsString);
  mtBuckets.Delete;
end;

procedure TForm1.btnListarArquivosClick(Sender: TObject);
var
  LFiles: TAmazonBucketResult;
  LFile: TAmazonObjectResult;
begin
  LFiles := TAmazonStorageService.New.GetBucket(mtBucketsNOME.AsString);
  try
    mtArquivos.EmptyDataSet;
    for LFile in LFiles.Objects do
    begin
      mtArquivos.Append;
      mtArquivosNOME.AsString := LFile.Name;
      mtArquivos.Post;
    end;
  finally
    LFiles.Free;
  end;
end;

procedure TForm1.btnListarBucketsClick(Sender: TObject);
var
  LBuckets: TStrings;
  I: Integer;
begin
  LBuckets := TAmazonStorageService.New.ListBuckets;
  try
    mtBuckets.EmptyDataSet;
    for I := 0 to Pred(LBuckets.Count) do
    begin
      mtBuckets.Append;
      mtBucketsNOME.AsString := LBuckets.Names[I];
      mtBuckets.Post;
    end;
  finally
    LBuckets.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InicializarServicoAmazon;
  mtBuckets.Open;
  mtArquivos.Open;
end;

procedure TForm1.InicializarServicoAmazon;
begin
  TAmazonStorageServiceConfig.GetInstance.AccessKey := 'AKIAYO6GN6IKKXZBKVBM';
  TAmazonStorageServiceConfig.GetInstance.SecretKey := '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';
  TAmazonStorageServiceConfig.GetInstance.Region := TAmazonRegion.amzrSAEast1;
  TAmazonStorageServiceConfig.GetInstance.Protocol := TAmazonProtocol.http;
  TAmazonStorageServiceConfig.GetInstance.MainBucketName := 'intensive-delphi-2021';
end;

end.
