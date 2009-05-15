Dado /^o cliente não possui restrição de cadastro$/ do
  @registro.cliente.should be_ativo
end

Dado /^o pedido não ultrapassou o prazo médio máximo atribuido ao cliente$/ do
  @registro.should be_no_prazo_medio_maximo
end

Dado /^os descontos aplicados no pedido são permitidos$/ do
  pending
end

Quando /^eu pedir confirmação de pedido$/ do
  click_button "Confirmar"
end

