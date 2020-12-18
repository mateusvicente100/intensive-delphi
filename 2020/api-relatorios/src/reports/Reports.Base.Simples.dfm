inherited ReportSimples: TReportSimples
  inherited Report: TRLReport
    DataSource = dsReport
    BeforePrint = ReportBeforePrint
    inherited BandHeader: TRLBand
      inherited DrawBackground: TRLDraw
        Width = 522
      end
      inherited lblIntensive: TRLLabel
        Left = 522
        ExplicitLeft = 522
      end
      inherited lblDelphi: TRLLabel
        Left = 638
        Width = 80
        Caption = 'delphi'
        ExplicitLeft = 638
        ExplicitWidth = 80
      end
    end
    inherited BandFooter: TRLBand
      Top = 120
      ExplicitTop = 120
    end
    object BandeCabecalho: TRLBand
      Left = 38
      Top = 88
      Width = 718
      Height = 16
      BandType = btHeader
      Borders.Color = 2893339
      Color = 2893339
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2893339
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object BandDetail: TRLBand
      Left = 38
      Top = 104
      Width = 718
      Height = 16
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
    end
  end
  object dsReport: TDataSource
    Left = 464
    Top = 288
  end
end
