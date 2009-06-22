Factory.define :pedido do |p|
  p.tipo 1
  p.data "2009-05-14"
  p.previsao_entrega "2009-05-14"
  p.entrega nil
  p.programacao "2009-05-14"
  p.association :cliente
  p.valor 0.00
  p.acrescimo 9.99
  p.desconto 0.00
  p.association :transportadora
  p.nome_comprador "Comprador de Teste"
  p.observacao "Observacao de Teste"
  p.association :vendedor, :factory => :funcionario
  p.association :operador, :factory => :funcionario
  p.association :telemarketing, :factory => :funcionario
  p.plano_de_pagamento "030060090120"
  p.endereco_entrega "Endereço de Teste"
  p.association :minuta
  p.association :area
  p.status nil
  p.status_estorno "2009-04-24"
  p.association :funcionario_estorno, :factory => :funcionario
  p.comissao_vendedor 0.00
  p.comissao_telemarketing 9.99
  p.venda_externa false
  p.association :autorizador_desconto, :factory => :funcionario
  p.data_aprovacao_pedido "2009-05-14"
  p.nosso_numero '1111111'
end

