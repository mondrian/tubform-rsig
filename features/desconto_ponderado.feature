Funcionalidade: Aplicar Desconto Ponderado
  Como um vendedor
  Eu quero aplicar um desconto ponderado
  Para que eu tenha o valor final do pedido

  Cenário: Aplicando Desconto Ponderado
    Dado que existe um(a) item_pedido
	E que me identifiquei como tubform com a senha 123456
    E que estou no(a) item
    E que o desconto do Pedido é 8
    E que o valor do Pedido é 1500
    E que a quantidade é 3
    E que o desconto do Item é 15
    E que o emissao_relatorio é true
    E que o valor de tabela é 500
    E que o valor de venda é 425
    Quando eu salvar o Item
    Então o valor do desconto ponderado deve ser 21.8
