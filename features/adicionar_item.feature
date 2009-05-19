Funcionalidade: Adicionar Item do Pedido
  Como um vendedor
  Eu quero incluir um item no pedido
  Para que eu possa definir os produtos a serem vendidos

  Cenário: Adicionando um Pedido Válido
    Dado que existe um pedido
    Quando eu requisitar um novo item
    E definir produto
    E definir quantidade como 1
    E definir valor 1.00
    Então eu preciso receber a mensagem "Item adicionado com Sucesso ao pedido"
    E eu preciso ter mais um item no pedido.
