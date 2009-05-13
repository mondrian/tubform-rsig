Before do
  @cliente = Cliente.find(:first)
end

Quando /^eu requisitar um novo pedido$/ do
  @pedido = Pedido.new
end

Quando /^definir vendedor com o id 1$/ do
  @pedido.vendedor_id = 1
end

Quando /^definir cliente com o id 1$/ do
  @pedido.cliente = @cliente
end

Quando /^definir forma de pagamento com o id 1$/ do
  @pedido.plano_pagamento_id = 1
end

Quando /^gravar o pedido$/ do
  @pedido.save
end

Then /^eu preciso ter mais um pedido\.$/ do
   !@pedido.new_record?
end

Quando /^definir se o pedido e oficial$/ do
  @pedido.oficial = true
end

Quando /^definir a previsao de entrega$/ do
  @pedido.previsao_entrega = '2009-05-30'
end

Quando /^definir a area$/ do
  @pedido.area_id = 1
end

Quando /^definir o tipo de venda \(interna ou externa\)$/ do
  @pedido.tipo = 1
end

Then /^eu preciso receber a mensagem "([^\"]*)"$/ do |arg1|
  puts 'Pedido Gravado com Sucesso!'
end