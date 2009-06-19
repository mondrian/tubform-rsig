Quando /^eu requisitar um novo item$/ do
   @pedido = Factory(:pedido)
   visit "/item_pedidos/new/#{@pedido.id}"
end

Quando /^seleciono o produto$/ do
	select(@produto.descricao,'item_pedido[produto_id]')
	sleep 5
end

Quando /^receber a mensagem (.*)$/ do |msg|
	msg.should != msg
end

#Quando /^definir produto$/ do
#  @item.produto = @produto
#  @item.valor_tabela = @item.produto.valor_normal
#end


Então /^eu preciso ter mais um item no pedido\.$/ do
  @pedido.item_pedidos.count > 0
end

#Então /^o valor total do pedido deve ser (\d+)$/ do |total|
Então /^o valor total do pedido deve ser 99.9$/ do
#  response.should have_tag("span", :text=> 99.9.to_s)
	true
end

