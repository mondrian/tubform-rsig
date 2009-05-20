Funcionalidade: Aprovar Pedido de Venda
  Como um analista de venda
  Eu quero confirmar o pedido de venda
  Para que a venda seja efetivada

  Cenário: Aprovando Pedido de Venda
    Dado que existe um(a) pedido
    E que estou no detalhe de pedido 1
    E este pedido está atribuido a um determinado(a) cliente
    E o cliente não possui restrição de cadastro
    E o pedido não ultrapassou o prazo médio máximo atribuido ao cliente
    E os descontos aplicados no pedido são permitidos
    Quando eu pedir aprovação de pedido
    Então preciso receber a mensagem "Pedido Aprovado"

