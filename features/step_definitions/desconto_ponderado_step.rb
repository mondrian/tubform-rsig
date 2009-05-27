Dado /^eu estou no item$/ do
  @item = ItemPedido.find(:first)
end

Dado /^que a quantidade é (.*)$/ do |qtd|
  @item.quantidade = qtd
end

Dado /^que o valor do desconto é (.*)$/ do |valor_tabela|
  @item.valor_tabela = valor_tabela
end

Dado /^que o valor de venda é (.*)$/ do |valor_venda|
  @item.valor_venda = valor_venda
end

Quando /^eu pedir aplicacao do Desconto Ponderado$/ do |resultado|
 @item.pedido.desconto_ponderado == resultado
end

Dado /^que o desconto do Pedido é 8$/ do
  pending
end

Dado /^que o desconto do Item é 15$/ do
  @item.desconto = 15
end

Quando /^eu Salvar o Item de Pedido$/ do
  @item.save
end

Então /^eu preciso obter o valor um Desconto de 21\.8$/ do
  @item.pedido.desconto = 21.8
end
