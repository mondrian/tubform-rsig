Before do
  Pedido.destroy_all
  ItemPedido.destroy_all
  ItemPedidoKit.destroy_all
  Factory.build(:pedido)
  Factory.build(:produto)
  Factory.build(:produto_kit)
  @produto = Produto.find(:first)
end

Quando /^eu adicionar um\(a\) item ao pedido$/ do
  @item_pedido = ItemPedido.new
  @item_pedido.pedido = Pedido.find(:first)
end

Quando /^selecionar um\(a\) produto$/ do
   @item_pedido.produto = @produto
end

Quando /^verificar se emite produto em relatorio$/ do
  @item_pedido.emissao_relatorio = @item_pedido.produto.emissao_relatorio
end

Quando /^quando salvar o registro$/ do
  @item_pedido.save
end

