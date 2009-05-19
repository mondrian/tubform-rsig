Before do
  @cliente = Cliente.find(:first)
  @operador = Funcionario.find(:first)
  @vendedor = Funcionario.find(:first)
  @telemark = Funcionario.find(:first)
  @tipo = 'E'
  @status = 'B'
end

Quando /^eu requisitar um novo pedido$/ do
  @pedido = Pedido.new
end

Quando /^definir cliente com o id 1$/ do
  @pedido.cliente = @cliente
end

Quando /^definir status com o id 1$/ do
  @pedido.status = @status
end


Quando /^definir tipo com o id 1$/ do
  @pedido.tipo = @tipo
end

Quando /^definir forma de pagamento com o id 1$/ do
  @pedido.plano_de_pagamento = '1'
end

Then /^eu preciso ter mais um pedido\.$/ do
   !@pedido.new_record?
end

Quando /^definir se o pedido e oficial$/ do
  @pedido.oficial = true
end

Quando /^definir a previsao de entrega$/ do
  @pedido.previsao_entrega = '2009-05-30'.to_date
end

Quando /^definir a data$/ do
  @pedido.data = '2009-05-30'.to_date
end

Quando /^definir registro$/ do
  @pedido.registro = '2009-05-30'.to_date
end

Quando /^definir a area$/ do
  @pedido.area_id = 1
end

begin
Quando /^definir o tipo de venda \(interna ou externa\)$/ do
  @pedido.tipo = 'E'
end

Quando /^gravar o pedido$/ do
  @pedido.operador = @operador
  @pedido.vendedor = @vendedor
  @pedido.telemarketing = @telemark
  @pedido.status = @status
  @pedido.tipo = @tipo
  @pedido.save
end

Then /^eu preciso receber a mensagem "([^\"]*)"$/ do |arg1|
  puts 'Pedido Gravado com Sucesso!'
end
end