unit Providers.Ocerizacao;

interface

uses System.Classes, TesseractOcr, System.SysUtils, TesseractOcr.capi;

type
  TOcerizacao = class
  public
    function Ocerizar(const AImage: TMemoryStream): string;
  end;

implementation

function TOcerizacao.Ocerizar(const AImage: TMemoryStream): string;
var
  LTesseract: TTesseractOCR4;
begin
  Result := EmptyStr;
  LTesseract := TTesseractOCR4.Create;
  try
    try
      if not LTesseract.Initialize('C:\Projetos\Delphi\intensive-delphi\TTesseractOCR4\bin\tessdata\', 'por', oemDefault) then
      begin
        LTentativas := 3;
        raise Exception.Create('Não foi possível carregar os componentes do tesseract!');
      end;
      LTesseract.SetImage(AImage);
      LTesseract.PageSegMode := TessPageSegMode.PSM_AUTO_OSD;
      LTesseract.Recognize(False, True);
      Result := LTesseract.UTF8Text;
      Break;
    except
      Inc(LTentativas);
    end;
  finally
    LTesseract.Free;
  end;
end;

end.
