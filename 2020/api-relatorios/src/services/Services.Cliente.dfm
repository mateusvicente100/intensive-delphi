inherited ServiceCliente: TServiceCliente
  inherited qryReport: TFDQuery
    SQL.Strings = (
      'select id, nome, sobrenome, email, telefone'
      'from cliente'
      'where id <= 10')
  end
end
