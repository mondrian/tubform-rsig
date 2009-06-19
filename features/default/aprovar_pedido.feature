# http://www.pivotaltracker.com/story/show/791001
Feature: Aprovar Pedido de Venda
  Como um analista de venda
  Eu quero confirmar o pedido de venda
  Para que a venda seja efetivada

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"
    E possuo permissão para "Aprovar Pedido"

  Cenário: Aprovando Pedido de Venda na Alteração
    Dado que existe um pedido
    E que estou em listagem de pedidos
    E peço a alteração do pedido que o(a) data é "2009-05-14"
    Quando peço para aprovar
    Então preciso ver "Pedido Aprovado"

