Funcionalidade: Calcular Comissao
  Como um vendedor
  Eu quero inserir um Item de Pedido
  Para que seja calculada minha comissao

  Cenário: Calculando a Comissao
    Dado que existe um(a) item_pedido
    E que estou no item
    E o valor da tabela for 500
    E o valor da venda for 500
    E a qtd for 3
    Quando eu salvar o item do pedido
    E quando eu pedir o Calculo da Comissao por Prazo
    E quando eu salvar o pedido
    Então o valor da comissao calculada precisa ser 3
