Dado /^que eu estou no ItemPedido$/ do
  @pedido = Pedido.find(:first)
  @itens = Pedido.itens.find(1)
end

Dado /^que o valor_base é de 15000$/ do
  @valor_base = 15000
end

Dado /^que o prazo medio do pedido é de 200$/ do
  prazo_medio = 200
end

Dado /^que o parametro do sistema é 75$/ do
  @prazo_param = 75
end

Entao /^ao salvar o item do pedido$/ do
  itempedido.save
end

Entao /^eu preciso aplicar o desconto_no_prazo encontrado ao valor_base para comissão$/ do
  pending
end

Entao /^eu preciso obter a mensagem: "([^\"]*)"$/ do |arg1|
  puts arg1
end