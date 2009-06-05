Funcionalidade: Comissão Por Desconto no Item
Como um operador do sistema
Eu quero informar um item com desconto
Para obter o valor do percentual de comissão

Cenário: Obtendo percentual de comissão
  Dado que existe um(a) item_pedido
  E que estou no detalhe de item_pedido 1
  E defino valor_tabela com o valor 736.00
  E defino valor_venda com o valor 662.40
  E defino quantidade com o valor 1
  E defino desconto com o valor  10
  Quando salvar o item de pedido
  Então o valor da comissao calculada deve ser 6.32

