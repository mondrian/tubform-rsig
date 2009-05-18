Factory.define :cliente do |c|
  c.tipo_cliente "E"
  c.cpf "MyString"
  c.cnpj "MyString"
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
  c.prazo_medio_maximo 75
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
  p.plano_de_pagamento "030060090120"
  p.endereco_entrega "MyString"
  p.minuta_id 1
  p.area_id 1
  p.preco_especial false
  p.status nil
  p.estorno "2009-04-24"
  p.funcionario_estorno_id 1
  p.comissao_vendedor 9.99
  p.comissao_telemarketing 9.99
  p.venda_externa false
  p.autorizador_desconto_id 1
  p.tipo true
  p.funcionario_id 1
end

Factory.define :faixa_de_desconto do |f|
  f.de 0
  f.ate 75
  f.desconto_permitido 10
end

Factory.define :produto do |p| 
  p.descricao "MyString"
  p.cor_id 1
  p.valor_especial 9.99
  p.valor_normal 9.99
  p.class_id 1
  p.grupo_id 1
  p.status false
  p.situacao_tributaria 1
  p.preco_minimo_nota_fiscal 9.99
  p.ipi 9.99
  p.classificacao_fiscal 1
  p.peso_liquido 1
  p.cod_emissao_nota_fiscal 1
  p.descricao_nota_fiscal "MyString"
  p.preco_normal_zona1 9.99
  p.preco_especial_zona1 9.99
  p.funcionario_id 1
  p.emissao_relatorio false
  p.custo 9.99
  p.cadastro_custo "2009-04-24"
  p.kit false
end
