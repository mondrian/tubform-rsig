# http://www.pivotaltracker.com/story/show/791062

Feature: Aplicar Desconto Da Comissão Por Desconto No Item
  Como um vendedor
  Eu quero informar um item com desconto
  Para obter o valor do percentual de comissão

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"

  Cenário: Obtendo percentual de desconto a partir do valor de venda sem preço especial
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | descricao        |valor normal | valor especial |
      |1  | Produto de Teste |736.00       | 0.00           |

    Dado que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto de Teste"
    E defino valor de venda como "736.00"
    E defino percentual de desconto como "6.00"
    E defino quantidade como "2"
    Quando peço para salvar
    Então preciso ver "Total do Pedido: R$ 1.460,00"