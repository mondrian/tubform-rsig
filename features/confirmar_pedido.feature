Funcionalidade: Confirmar Pedido de Venda
  Como um analista de venda
  Eu quero confirmar o pedido de venda
  Para que a venda seja efetivada

  Cenário: Confirmando Pedido de Venda
    Dado que existe um(a) pedido
    E que estou no detalhe de pedido 1
    E e este pedido está atribuido a um determinado(a) cliente
    E o cliente não possui restrição de cadastro
    E o pedido não ultrapassou o prazo médio máximo atribuido ao cliente
    E os descontos aplicados no pedido são permitidos
    Quando eu pedir confirmação de pedido
    Então eu preciso receber a mensagem "Pedido Aprovado"

