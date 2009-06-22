# http://www.pivotaltracker.com/story/show/791126
Feature: Verificar se o produto é kit
  Como um operador
  Eu quero inserir um Item de Pedido
  Para que eu possa verificar se é do tipo kit

  Cenário: Verificando produto kit
    Dado que existe um pedido
    Quando eu adicionar o item ao pedido
    E seleciono um produto
    E a quantidade for 1
    E o valor de tabela for 736
    E o valor de venda for 662.40
    E se emitir relatorio for true
    E verifico se o mesmo é kit
    E salvar o registro
    Então preciso adicinar na tabela de item_pedido_kit os produtos que compoe o kit.

