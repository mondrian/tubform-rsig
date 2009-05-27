Dado /^estou no item$/ do
  @item_pedido = ItemPedido.find(:first)
end

Dado /^o valor de tabela for(.*)$/ do |valor|
  @item_pedido.valor_tabela = valor
end

Dado /^o valor de venda for(.*)$/ do |valor|
  @item_pedido.valor_venda = valor
end

Dado /^a quantidade for(.*)$/ do |qtd|
  @item_pedido.quantidade = qtd
end

Dado /^o percentual de desconto for(.*)$/ do |dsc|
  @item_pedido.desconto = dsc
end

Quando /^eu salvar o item de pedido$/ do
  @item_pedido.save
end

Então /^o valor da comissao calculada deve ser(.*)$/ do |comissao|
  @item_pedido.pedido.comissao_desconto_item == comissao
end