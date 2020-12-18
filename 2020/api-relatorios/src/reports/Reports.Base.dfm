object ReportBase: TReportBase
  Left = 0
  Top = 0
  Width = 794
  Height = 1123
  TabOrder = 0
  object Report: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PrintDialog = False
    ShowProgress = False
    object BandHeader: TRLBand
      AlignWithMargins = True
      Left = 38
      Top = 38
      Width = 718
      Height = 50
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Color = clWhite
      ParentColor = False
      Transparent = False
      object DrawBackground: TRLDraw
        Left = 0
        Top = 0
        Width = 503
        Height = 49
        Align = faClient
        Borders.Color = 5195330
        Brush.Color = 5195330
        Color = 5195330
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5195330
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        Pen.Color = 5195330
        Transparent = False
      end
      object lblIntensive: TRLLabel
        Left = 503
        Top = 0
        Width = 116
        Height = 49
        Margins.Left = 5
        Margins.Right = 5
        Align = faRight
        Caption = 'intensive'
        Color = 5195330
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblDelphi: TRLLabel
        Left = 619
        Top = 0
        Width = 99
        Height = 49
        Margins.Left = 5
        Margins.Right = 5
        Align = faRight
        Caption = 'DELPHI'
        Color = 5195330
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3425775
        Font.Height = -27
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
    end
    object BandFooter: TRLBand
      Left = 38
      Top = 88
      Width = 718
      Height = 20
      BandType = btFooter
      object lblData: TRLSystemInfo
        Left = 5
        Top = 2
        Width = 74
        Height = 16
        Anchors = [fkLeft, fkTop]
        Text = 'Data: '
      end
      object lblHora: TRLSystemInfo
        Left = 138
        Top = 2
        Width = 74
        Height = 16
        Anchors = [fkLeft, fkTop]
        Info = itHour
        Text = 'Hora: '
      end
    end
  end
  object RLPDFFilter: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    FileName = 'report.pdf'
    DisplayName = 'Documento PDF'
    Left = 320
    Top = 480
  end
end
