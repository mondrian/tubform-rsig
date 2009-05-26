Funcionalidade: Estabelecer uma comissão acordada
  Como um operador
  Eu quero definir uma nova comissão
  Para que ela sobreponha qualquer comissão já informada

  Cenário: Informar uma nova comissão acordada para pedido
    Dado que estou na exibição de pedido 1
    Quando eu clicar em informar comissão acordada
    E informar a comissão para o vendedor
    E informar a comissão para o operador de telemarketing
    E clicar no botão salvar
    Então redefina a informação de comissão do pedido
