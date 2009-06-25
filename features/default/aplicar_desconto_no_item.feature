# http://www.pivotaltracker.com/story/show/791062
@luciano
Feature: Aplicar Desconto da Comissão por Desconto no Item
  Como um vendedor
  Eu quero inserir um Item de Pedido com Desconto
  Para que seja calculada minha comissao

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"

  Cenário: Obtendo a comissao por Desconto no Item (valor)
    Dado que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto de Teste"
    E defino valor_tabela como 500
    E defino percentual de desconto como "10"
    E defino valor_venda como 450
    E defino quantidade como "1"
    Quando eu pedir para salvar
    Então eu preciso ver "Comissão do vendedor: 5.0%"

