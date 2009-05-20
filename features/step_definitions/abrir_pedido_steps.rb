Before do
  @cliente = Cliente.find(:first)
  @operador = Funcionario.find(:first)
  @vendedor = Funcionario.find(:first)
  @telemark = Funcionario.find(:first)
  @entidade_principal = 'pedido'
end

Quando /^definir cliente com o id 1$/ do
  @pedido.cliente = @cliente
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

Then /^eu preciso receber a mensagem "([^\"]*)"$/ do |arg1|
  puts 'Pedido Gravado com Sucesso!'
end
