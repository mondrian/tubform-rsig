Dado /^que estou no\(a\) item$/ do
  @item = ItemPedido.find(:first)
end

Dado /^que o desconto do Pedido é (.*)$/ do |desconto|
  @item.pedido.desconto = desconto
end

Dado /^que a quantidade é (.*)$/ do |qtd|
  @item.quantidade = qtd
end

Dado /^que o desconto do Item é (.*)$/ do |valor_tabela|
  @item.valor_tabela = valor_tabela
end

Dado /^que o valor de venda é (.*)$/ do |valor_venda|
  @item.valor_venda = valor_venda
end

Quando /^eu salvar o Item$/ do
  @item.save
end

Então /^o valor do desconto ponderado deve ser (.*)$/ do |resultado|
  @item.pedido.desconto_acumulado_geral == resultado
  puts resultado
end
