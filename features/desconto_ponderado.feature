Funcionalidade: Aplicar Desconto Ponderado
  Como um vendedor
  Eu quero aplicar um desconto ponderado
  Para que eu tenha o valor final do pedido

  Cenário: Aplicando Desconto Ponderado
    Dado que existe um(a) item_pedido
    E que eu estou no item
    E que o desconto do Pedido é 8
    E que a quantidade é 3
    E que o desconto do Item é 15
    E que o valor de venda é 425
    Quando eu Salvar o Item
    E eu pedir aplicacao do Desconto Ponderado
    Então eu preciso obter o valor um Desconto de 21.8