program Samples;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.OctetStream,
  System.SysUtils,
  System.Classes,
  Providers.Ocerizacao in 'src\providers\Providers.Ocerizacao.pas';

begin
  THorse.Use(OctetStream);

  THorse.Post('/arquivos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LOcerizacao: TOcerizacao;
    begin
      LOcerizacao := TOcerizacao.Create;
      try
        Res.Send(LOcerizacao.Ocerizar(Req.Body<TMemoryStream>));
      finally
        LOcerizacao.Free;
      end;
    end);

  THorse.Listen(9000);
end.
