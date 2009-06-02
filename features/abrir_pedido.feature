Funcionalidade: Abrir pedido de Venda
  Como um vendedor
  Eu quero abrir um de venda
  Para que seja base para que o processo de venda continue

  Cenário: Adicionando um pedido válido
    Dado que existe um(a) funcionario
	E que estou logado com login tubform e a senha 123456
	E que existe um(a) transportadora
    E que existe um(a) cliente
    E que existe um(a) funcionario
    E que estou no formulário de cadastro de pedido
    E defino vendedor_id com o valor 1
    E defino cliente_id com o valor 1
    E defino plano_de_pagamento com o valor 000030060090120
	E defino previsao_entrega com o valor 2009-05-30
	E defino data com o valor 2009-05-30
	E defino registro com o valor 2009-05-30
	E seleciono transportadora_id com o valor Tubform
    E seleciono tipo com o valor Interno
    E defino status com o valor B
    Quando eu salvar o registro
    Então preciso receber a mensagem "Pedido Cadastrado com Sucesso"

  Cenário: Alterando um pedido válido
    Dado que existe um(a) pedido
    E que estou no detalhe de pedido 1
    E seleciono tipo com o valor Externo
    E defino status com o valor B
    Quando eu salvar o registro
    Então preciso receber a mensagem "Pedido Atualizado com Sucesso"

  Cenário: Listar Pedidos Cadastrados
    Dado que existe um(a) cliente
    E que existem 3 pedidos
    Quando eu estiver na listagem de pedidos
    Então preciso ver 3 pedidos

