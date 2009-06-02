Funcionalidade: Verificar permissão do usuário para dar desconto a Item
	Como um operador
	Eu quero verificar se tenho permissão para desconto a item
	Para que eu possa dar desconto a item

	Cenário: Verifica permissão do usuário para desconto
		Dado que estou logado com login tubform e a senha 123456
		E que estou na exibição de pedido 1
		Quando eu clicar no botão dar desconto
		Então verifica se tenho permissão
    E me redireciona para a pagina de desconto
