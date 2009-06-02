Funcionalidade: Verificar se o produto sairá no relatório
  Como um operador
  Eu quero inserir um Item de Pedido
  Para que eu possa verificar se o produto sairá na impressão do relatório

  Cenário: Verificando produto sairá no relatório
    Dado que existe um(a) pedido
    Quando eu adicionar um(a) item ao pedido
    E selecionar um(a) produto
    E a quantidade for 1
    E o valor de tabela for 100
    E o valor de venda for 80
    E verificar se emite produto em relatorio
    E quando salvar o registro
