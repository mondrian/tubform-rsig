Dado /^que estou no\(a\) pedido$/ do
  @pedido = Pedido.find(:first)
end

Dado /^que o total do Pedido seja (.*)$/ do | valor |
  @pedido.valor = valor
end

Dado /^que o Plano de Pagamento é (.*)$/ do | plano |
  @pedido.plano_de_pagamento = plano
end

Dado /^que o Nome do Comprador é (.*)$/ do |nome |
  @pedido.nome_comprador = nome
  @pedido.save
end

Quando /^eu Gerar as Parcelas$/ do
  @resultado = @pedido.gerar_duplicatas
end

Então /^eu preciso receber a mensagem (.*)$/ do | res |
  @resultado.should == res
end