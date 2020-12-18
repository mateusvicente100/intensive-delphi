object ServiceBase: TServiceBase
  OldCreateOrder = False
  Height = 150
  Width = 191
  object Connection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Projetos\Git\mateus-vicente\public\intensive-delphi\' +
        '2020\api-relatorios\database\database.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 80
    Top = 64
  end
end
