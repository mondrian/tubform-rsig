Dado /^que estou no\(a\) item$/ do
  @item = ItemPedido.find(:last)
end

Dado /^que o desconto do Pedido é (.*)$/ do |desconto|
  @item.pedido.desconto = desconto
end

Dado /^que o valor do Pedido é (.*)$/ do |valor|
  @item.pedido.valor = valor
end

Dado /^que a quantidade é (.*)$/ do |qtd|
  @item.quantidade = qtd
end

Dado /^que o desconto do Item é (.*)$/ do |desc|
  @item.desconto = desc
end


Dado /^que o emissao_relatorio é true$/ do
  @item.emissao_relatorio = true
end

Dado /^que o valor de tabela é (.*)$/ do |valor_venda|
  @item.valor_tabela = valor_venda
end

Dado /^que o valor de venda é (.*)$/ do |valor_venda|
  @item.valor_venda = valor_venda
end

Quando /^eu salvar o Item$/ do
  @item.produto_id = 1
  @item.save
end

Então /^o valor do desconto ponderado deve ser (.*)$/ do |resultado|
  @item.pedido.desconto_acumulado_geral.to_f.should == resultado.to_f
end
