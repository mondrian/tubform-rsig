Funcionalidade: Verificar se o produto é kit
  Como um operador
  Eu quero inserir um Item de Pedido
  Para que eu possa verificar se é do tipo kit

  Cenário: Verificando produto kit
    Dado que existe um(a) pedido
    Quando eu adicionar o item ao pedido
    E seleciono um produto
    E a quantidade for 1
    E o valor de tabela for 736
    E o valor de venda for 662.40
    E verifico se o mesmo é kit
    E salvar o registro
    Então preciso adicinar na tabela de item_pedido_kit os produtos que compoe o kit.
