Dado /^o cliente não possui restrição de cadastro$/ do
  puts @registro.cliente_id
  @registro.cliente.should be_ativo
end

Dado /^o pedido não ultrapassou o prazo médio máximo atribuido ao cliente$/ do
  @registro.should be_no_prazo_medio_maximo
end

Dado /^os descontos aplicados no pedido são permitidos$/ do
  FaixaDeDesconto.transaction do
    FaixaDeDesconto.destroy_all
    Factory(:faixa_de_desconto)
  end
  @registro.should be_no_desconto_permitido
end

Quando /^eu pedir aprovação de pedido$/ do
  click_button "Aprovar Pedido"
end

