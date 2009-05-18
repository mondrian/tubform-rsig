Before do
  @pedido = Pedido.find(:first)
end

Dado /^que estou em um determinado pedido$/ do
  @pedido
end

Quando /^eu requisitar um novo item$/ do
  @item = ItemPedido.new
end

Quando /^definir produto com o id 1$/ do
  @produto = Produto.find(1)
  @item.produto = @produto
  @item.valor_tabela = @item.produto.valor_normal
end

Quando /^definir quantidade como 1$/ do
  @item.quantidade = 1
end

Quando /^definir valor 1\.00$/ do
  @item.valor_venda = 1.00
end

Então /^eu preciso ter mais um item no pedido\.$/ do
  @pedido.item_pedidos << @item
  @pedido.save
end

