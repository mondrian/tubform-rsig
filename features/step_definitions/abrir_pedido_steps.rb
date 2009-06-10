Before do
  @cliente = Factory.build(:cliente)
  @operador = Factory.build(:funcionario)
  @vendedor = Factory.build(:funcionario)
  @telemark = Factory.build(:funcionario)
  @entidade_principal = 'pedido'
end

Quando /^definir cliente com o id 1$/ do
  @pedido.cliente = @cliente
end

Quando /^definir vendedor com o id 1$/ do
  @pedido.vendedor = @vendedor
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

Quando /^gravar o pedido$/ do
  @pedido.save
end

