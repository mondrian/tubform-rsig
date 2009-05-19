Funcionalidade: Abrir de Venda
  Como um vendedor
  Eu quero abrir um de venda
  Para que seja base para que o processo de venda continue

  Cenário: Adicionando um válido
    Dado que estou no formulário de cadastro de pedido
    E defino vendedor_id com o valor 1
    E defino cliente_id com o valor 1
    E defino plano_de_pagamento com o valor 1
	E defino previsao entrega com o valor '2009-05-30'
	E defino data com o valor '2009-05-30'
	E defino registro com o valor '2009-05-30'
	E defino area com o valor 1
    E defino funcionario_id com o valor 1
	E defino transportadora_id com o valor 1
    E defino tipo com o valor 'E'
    E defino status com o valor 'B'
    Quando eu salvar o registro
    Então preciso receber a mensagem "Cadastrado com Sucesso"
