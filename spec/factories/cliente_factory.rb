Factory.define :cliente do |c|
  c.tipo_cliente "E"
  c.sequence(:cpf) { |n| "00000000#{n}" }
  c.sequence(:cnpj) { |n| "000000000#{n}" }
  c.razao_social "Razao Social de Teste"
  c.nome_fantasia "Cliente de Teste"
  c.documento "Documento de Teste"
  c.endereco "Endereço de Teste"
  c.complemento "Complemento de Teste"
  c.association :cidade
  c.uf "CE"
  c.cep "63500-000"
  c.referencia "Referência de Teste"
  c.fone_pessoal "(88) 3581 1111"
  c.fone_comercial "(88) 3581 1111"
  c.fone_celular "(88) 3581 1111"
  c.endereco_entrega "Endereço de Entrega Teste"
  c.association :regiao_entrega, :factory => :regiao
  c.association :cidade_entrega, :factory => :cidade
  c.association :area
  c.referencias_bancaria "Referencias Bancarias de Teste"
  c.referencias_comerciais "Referencias Comerciais de Teste"
  c.observacao "Observacao de Teste"
  c.info_serasa "Informacoes do SERASA de teste"
  c.data_nascimento "2009-04-24"
  c.nome_comprador "Nome do Comprador Teste"
  c.vendas_suspensas false
  c.observacao_suspensao_venda "Observação de Suspensao de Venda de Teste"
  c.limite_credito 9.99
  c.saldo_devedor 9.99
  c.prazo_medio_maximo 75
  c.data_inclusao_prazo_medio "2009-04-24"
end

