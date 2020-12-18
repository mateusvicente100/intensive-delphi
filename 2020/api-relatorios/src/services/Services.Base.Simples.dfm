inherited ServiceBaseSimples: TServiceBaseSimples
  Width = 240
  inherited Connection: TFDConnection
    Connected = True
    Left = 72
  end
  object qryReport: TFDQuery
    Connection = Connection
    Left = 160
    Top = 64
  end
end
