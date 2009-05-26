Before do
	Factory.build(:pedido)
  @pedido = Factory(:pedido)
end

Quando /^eu clicar em informar comissão acordada$/ do
  click_button "Comissão Acordada"
end

Quando /^informar a comissão para o vendedor$/ do
  pending
end

Quando /^informar a comissão para o operador de telemarketing$/ do
  pending
end

Quando /^clicar no botão salvar$/ do
  pending
end

Então /^redefina a informação de comissão do pedido$/ do
  pending
end
