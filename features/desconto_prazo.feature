Funcionalidade: Calcular Comissao
  Como um vendedor
  Eu quero inserir um Item de Pedido
  Para que seja calculada minha comissao

  Cenário: Calculando a Comissao
    Dado que existe um(a) item_pedido
    E eu pedir o Calculo da Comissao por Prazo
    Quando eu salvar o pedido
    Então o valor da comissao calculada deve ser 3
