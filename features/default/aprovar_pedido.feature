# http://www.pivotaltracker.com/story/show/791001
@trabalhando
Feature: Aprovar Pedido
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
    E que estou em alteração desse pedido
    Quando peço para aprovar
    Então preciso ver "Pedido Aprovado"

