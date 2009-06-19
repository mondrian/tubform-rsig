# http://www.pivotaltracker.com/story/show/791082
Feature: Calcular Comissão
  Como um vendedor
  Eu quero inserir um Item de Pedido
  Para que seja calculada minha comissao

  Cenário: Calculando a Comissao
    Dado que existe um(a) item_pedido
	  E que me identifiquei como tubform com a senha 123456
    E que estou no item
    E o valor da tabela for 500
    E o valor da venda for 500
    E a qtd for 3
    Quando eu salvar o item do pedido
    E eu pedir o Desconto por Prazo
    E eu salvar o pedido
    Então o valor da Comissao Calculada precisa ser 3

