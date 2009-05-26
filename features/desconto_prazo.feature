Funcionalidade: Calcular Comissao
  Como um vendedor
  Eu quero inserir um Item de Pedido
  Para que seja calculada minha comissao

  Cenário: Calculando a Comissao
    Dado que eu estou em um Pedido Válido
    Quando eu pedir o Calculo da Comissao por Prazo
    Então eu preciso receber a mensagem "Comissão Calculada"