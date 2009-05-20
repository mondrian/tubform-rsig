Funcionalidade: Adicionar Item do Pedido
  Como um vendedor
  Eu quero incluir um item no pedido
  Para que eu possa definir os produtos a serem vendidos

  Cenário: Adicionando um Pedido Válido
    Dado que existe um pedido
    Quando eu requisitar um novo item
    E seleciono o produto
    E defino quantidade com o valor 10
    E defino valor_venda com o valor 1
    E eu salvar o registro
    Então preciso receber a mensagem "Item adicionado com Sucesso ao pedido."
    E eu preciso ter mais um item no pedido.
