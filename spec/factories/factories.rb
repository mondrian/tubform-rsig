def popula_acoes
	Acao.create(:controller_name => 'pedidos',
							 :action_name => 'index',
							 :controller_name => 'pedidos',
							 :action_name => 'show',
							 :controller_name => 'pedidos',
							 :action_name => 'permitir_desconto_no_pedido')
end


Factory.define :acao do |a|
  a.controller_name
  a.action_name
end

Factory.define :acao_funcionario do |a|
  a.association :acao
  a.association :funcionario
end

Factory.define :cliente do |c|
  c.tipo_cliente "E"
  c.sequence(:cpf) { |n| "000000000#{n}" }
  c.sequence(:cnpj) { |n| "000000000#{n}" }
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
  p.tipo 1
  p.data "2009-05-14"
  p.previsao_entrega "2009-05-14"
  p.entrega "2009-05-14"
  p.programacao "2009-05-14"
  p.association :cliente
  p.valor 9.99
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
  p.status nil
  p.estorno "2009-04-24"
  p.funcionario_estorno_id 1
  p.comissao_vendedor 9.99
  p.comissao_telemarketing 9.99
  p.venda_externa false
  p.autorizador_desconto_id 1
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
  p.classe_id 1
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
  p.kit true
end

Factory.define :funcionario do |f|
  f.tipo '1'
  f.nome 'Mystring'
  f.endereco 'Mystring'
  f.complemento 'Mystring'
  f.cep 'Mystring'
  f.cidade_id 1
  f.uf 'Mystring'
  f.fone 'Mystring'
  f.sequence(:cpf) { |n| "999999999#{n}" }
  f.sequence(:rg) { |n| "999999999#{n}" }
  f.pai 'Mystring'
  f.mae 'Mystring'
  f.numero_carteira_trabalho 'Mystring'
  f.serie_carteira_trabalho 'Mystring'
  f.titulo_eleitor 'Mystring'
  f.zona_eleitoral 'Mystring'
  f.admissao '2009-01-01'
  f.registro '2009-01-01'
  f.nascimento '2009-01-01'
  f.naturalidade 'Mystring'
  f.estado_civil 'Mystring'
  f.grau_instrucao 'Mystring'
  f.cadastro_pis 'Mystring'
  f.numero_pis 'Mystring'
  f.cod_banco_pis 'Mystring'
  f.nome_banco_pis 'Mystring'
  f.cod_agencia_pis 'Mystring'
  f.nome_agencia_pis 'Mystring'
  f.endereco_banco_pis 'Mystring'
  f.demissao '2009-01-02'
  f.observacao 'Mystring'
  f.aci 'Mystring'
  f.sequence(:email) { |n| "email#{n}@exemplo.com.br" }
  f.sequence(:login) { |n| "usuario#{n}" }
  f.password '123456'
  f.password_confirmation '123456'
end

Factory.define :fornecedor do |f|
  f.nome 'Aço Cearense'
  f.endereco 'Fortaleza'
  f.cnpj '07811946000187'
end

Factory.define :transportadora do |t|
  t.razao_social 'Tubform'
end

Factory.define :item_pedido do |i|
  i.quantidade 1
  i.valor_tabela 736
  i.valor_venda 662.40
  i.desconto 10
  i.emissao_relatorio true
  i.association :produto, :factory => :produto
  i.association :pedido, :factory => :pedido
end

Factory.define :produto_kit do |k|
  k.empresa_id 1
  k.fator_conversao 4
  k.status true
  k.preco_normal 200
  k.preco_especial 0
  k.association :produto, :factory => :produto
end

