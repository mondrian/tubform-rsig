Before do
  Pedido.destroy_all
  ItemPedido.destroy_all
  Factory.build(:pedido)
  Factory.build(:produto)
   @produto = Factory(:produto)
end

Dado /^que existe um pedido$/ do
  @entidade_principal = 'item_pedido'
end

Quando /^seleciono o produto$/ do
   select(@produto.descricao,'item_pedido[produto_id]')
end

Quando /^eu requisitar um novo item$/ do
   @pedido = Factory(:pedido)
  visit "/item_pedidos/new/#{@pedido.id}"
end

Quando /^definir produto$/ do

  @item.produto = @produto
  @item.valor_tabela = @item.produto.valor_normal
end


Então /^eu preciso ter mais um item no pedido\.$/ do
  @pedido.item_pedidos.count > 0
end