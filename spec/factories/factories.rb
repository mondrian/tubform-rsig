Factory.define :cliente do |c|
  c.tipo_cliente "MyString"
  c.cpf_cnpj "MyString"
  c.razao_social "MyString"
  c.nome_fantasia "MyString"
  c.documento "MyString"
  c.endereco "MyString"
  c.complemento "MyString"
  c.cidade_id 1
  c.uf "MyString"
  c.cep "MyString"
  c.referencia "MyString"
  c.fone_pessoal "MyString"
  c.fone_comercial "MyString"
  c.fone_celular "MyString"
  c.endereco_entrega "MyString"
  c.regiao_entrega_id 1
  c.cidade_entrega_id "MyString"
  c.area_id "MyString"
  c.referencias_bancaria "MyString"
  c.referencias_comerciais "MyString"
  c.observacao "MyString"
  c.info_serasa "MyString"
  c.data_nascimento "2009-04-24"
  c.nome_comprador "MyString"
  c.vendas_suspensas false
  c.observacao_suspensao_venda "MyString"
  c.limite_credito 9.99
  c.saldo_devedor 9.99
  c.status "MyString"
  c.prazo_medio_maximo 1
  c.data_inclusao_prazo_medio "2009-04-24"
end

Factory.define :pedido do |p|
  p.oficial false
  p.data "2009-05-14"
  p.previsao_entrega "2009-05-14"
  p.entrega "2009-05-14"
  p.programacao "2009-05-14"
  p.cliente_id 1
  p.valor 9.99
  p.preco_tabela 9.99
  p.acrescimo 9.99
  p.desconto 9.99
  p.transportadora_id 1
  p.nome_comprador "MyString"
  p.observacao "MyText"
  p.vendedor_id 1
  p.operador_id 1
  p.telemarketing_id 1
  p.plano_pagamento_id 1
  p.endereco_entrega "MyString"
  p.minuta_id 1
  p.area_id 1
  p.preco_especial false
  p.status "MyString"
  p.estorno "2009-04-24"
  p.funcionario_estorno_id 1
  p.comissao_vendedor 9.99
  p.comissao_telemarketing 9.99
  p.venda_externa false
  p.autorizador_desconto_id 1
  p.tipo true
  p.funcionario_id 1
end

