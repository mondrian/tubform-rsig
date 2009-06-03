Quando /^eu clicar no botão dar desconto$/ do
	click_button "Desconto"
end

Então /^verifica se tenho permissão$/ do
  response.should_not contain("Acesso negado a pedidos acao permitir_desconto_no_pedido. Você não tem acesso a esta ação.")
end

Então /^me redireciona para a pagina de desconto$/ do
	click_button "Salvar"
	sleep 6
end
