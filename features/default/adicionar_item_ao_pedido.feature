# http://www.pivotaltracker.com/story/show/790964
Feature: Adicionar Item ao Pedido
  Como um vendedor
  Eu quero incluir um item no pedido
  Para que eu possa definir os produtos a serem vendidos

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"
    E possuo permissão para "Ver Itens de Pedido"

  Cenário: Adicionando um item sem preço especial a um pedido
    E que estou adicionando item a um pedido
    E seleciono o(a) produto "Produto de Teste"
    E defino quantidade como "10"
    E defino valor de venda como "100"
    E peço para salvar
    Então preciso ver "Item adicionado com sucesso ao pedido."
    E preciso ver "Total do Pedido: R$ 1.000,00"

