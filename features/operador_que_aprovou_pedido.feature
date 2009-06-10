Funcionalidade: Verificar permissão do usuário para aprovar Pedido
	Como um operador
	Eu quero aprovar um pedido
	Para que eu possa dar desconto a item

	Cenário: Verificar permissão do usuário para aprovar Pedido
		Dado que me identifiquei como tubform com a senha 123456
		E que estou na exibição de pedido 1
		Quando eu clicar no botão Aprovar
		Então verifica se tenho permissão
