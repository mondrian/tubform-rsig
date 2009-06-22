# http://www.pivotaltracker.com/story/show/791007
@trabalhando
Feature: Definir comissão acordada para pedido
  Como um gerente de vendas
  Eu quero definir uma nova comissão
  Para que ela sobreponha qualquer comissão já informada

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"

  Cenário: Informar uma nova comissão acordada para pedido
    Dado que existe um pedido
    E que estou em exibição desse pedido
    E peço para alterar comissão
    E defino comissão do vendedor como "15"
    E defino comissão do telemarketing como "0.5"
    E peço para salvar
    Então preciso ver "Pedido Atualizado com Sucesso"

