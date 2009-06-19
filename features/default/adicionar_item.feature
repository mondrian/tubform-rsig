# http://www.pivotaltracker.com/story/show/790964
@trabalhando
Feature: Adicionar Item do Pedido
  Como um vendedor
  Eu quero incluir um item no pedido
  Para que eu possa definir os produtos a serem vendidos

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"
    E possuo permissão para "Ver Itens de Pedido"

  Cenário: Adicionando um item válido a um pedido
    Dado que existe um pedido
    E que estou em cadastro de item
    E seleciono o(a) produto "Produto de Teste"
    E defino quantidade como "10"
    E defino valor de venda como "100"
    E eu salvar o registro
    Então preciso ver "Item adicionado com sucesso ao pedido."
    E preciso ver "Total: 1000"

