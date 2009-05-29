Dado /^que estou no item$/ do
  @item = ItemPedido.find(:first)
end

Dado /^o valor da tabela for(.*)$/ do |valor|
  @item.valor_tabela = valor 
end

Dado /^o valor da venda for(.*)$/ do |valor|
  @item.valor_venda = valor
end

Dado /^a qtd for(.*)$/ do |qtd|
  @item.quantidade = qtd
end

Quando /^eu salvar o item do pedido$/ do
  @item.save
end

Quando /^eu pedir o Desconto por Prazo$/ do
  @item.pedido.desconto_comissao_prazo!
end

Quando /^eu salvar o pedido$/ do
  @item.pedido.save
end

Então /^o valor da Comissao Calculada precisa ser (.*)$/ do |resultado|
  @item.pedido.comissao_vendedor == resultado
end