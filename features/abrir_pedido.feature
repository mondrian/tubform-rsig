Funcionalidade: Abrir de Venda
  Como um vendedor
  Eu quero abrir um de venda
  Para que seja base para que o processo de venda continue

  Cenário: Adicionando um pedido válido
    Dado que estou no formulário de cadastro de pedido
    E defino vendedor_id com o valor 1
    E defino cliente_id com o valor 1
    E defino plano_de_pagamento com o valor '000030060090120'
	E defino previsao_entrega com o valor '2009-05-30'
	E defino data com o valor '2009-05-30'
	  E defino registro com o valor '2009-05-30'
	  E defino status com o valor B
    E defino funcionario_id com o valor 1
	  E defino transportadora_id com o valor 1
    E defino tipo com o valor X
    E defino status com o valor B
    Quando eu salvar o registro
    Então preciso receber a mensagem "Pedido Cadastrado com Sucesso"

  Cenário: Alterando um pedido válido
    Dado que existe um(a) pedido
    E que estou no detalhe de pedido 1
    E defino tipo com o valor E
    E defino status com o valor B
    Quando eu salvar o registro
    Então preciso receber a mensagem "Pedido Atualizado com Sucesso"

  Cenário: Listar Pedidos Cadastrados
    Dado que existe um(a) cliente
    E que existem 3 pedidos
    Quando eu estiver na listagem de pedidos
    Então preciso ver 3 pedidos
