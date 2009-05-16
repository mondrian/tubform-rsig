Funcionalidade: Adicionar Item do Pedido
  Como um vendedor
  Eu quero incluir um item no pedido
  Para que eu possa definir os produtos a serem vendidos

  Cenário: Adicionando um Pedido Válido
    Dado que estou em um determinado pedido
    E que existem 2 produtos
    Quando eu requisitar um novo item
    E definir produto com o id 1
    E definir quantidade como 1
    E definir valor 1.00
    Então eu preciso receber a mensagem "Item adicionado com Sucesso ao pedido"
    E eu preciso ter mais um item no pedido. 
