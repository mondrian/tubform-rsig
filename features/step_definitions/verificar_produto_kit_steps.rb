Before do
  Pedido.destroy_all
  ItemPedido.destroy_all
  ItemPedidoKit.destroy_all
  Factory.build(:pedido)
  Factory.build(:produto)
  Factory.build(:produto_kit)
  @produto = Produto.find(:first)
end

Quando /^eu adicionar o item ao pedido$/ do
  @item_pedido = ItemPedido.new
  @item_pedido.pedido = Pedido.find(:first)
end

Quando /^seleciono um produto$/ do  
   @item_pedido.produto = @produto
end

Quando /^se emitir relatorio for true$/ do
  @item_pedido.emissao_relatorio = @item_pedido.produto.emissao_relatorio
end

Quando /^verifico se o mesmo é kit$/ do
  @item_pedido.produto.kit == true
end

Quando /^salvar o registro$/ do
  @item_pedido.save
end

Então /^preciso adicinar na tabela de item_pedido_kit os produtos que compoe o kit\.$/ do
  if @item_pedido.produto.kit then
     @item_kit = ItemPedidoKit.new
     @item_kit.pedido = Pedido.find(:first)
     @item_kit.save
  end
end
