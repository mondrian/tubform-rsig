Dado /^eu pedir o Calculo da Comissao por Prazo$/ do
  @pedido = Pedido.find(:first)
  @pedido.desconto_comissao_prazo!
end

Quando /^eu salvar o pedido$/ do
  @pedido.save
end

Então /^o valor da comissao calculada deve ser 3$/ do
  @pedido.comissao_vendedor = 3
end
