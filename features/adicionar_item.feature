# http://www.pivotaltracker.com/story/show/790964
Feature: Adicionar Item do Pedido
  Como um vendedor
  Eu quero incluir um item no pedido
  Para que eu possa definir os produtos a serem vendidos

  Cenário: Adicionando um Pedido Válido
    Dado que existe um pedido
	   Dado que me identifiquei como tubform com a senha 123456
    Quando eu requisitar um novo item
    E seleciono o produto
  	E receber a mensagem Produto não encontrado
	E receber a mensagem Este produto não tem valor cadastrado e não pode ser inserido em um pedido
    E defino quantidade com o valor 10
    E defino valor_venda com o valor 100
    E eu salvar o registro
    Então preciso receber a mensagem "Item adicionado com Sucesso ao pedido."
    E o valor total do pedido deve ser 99.9

