Funcionalidade: Comissão Por Desconto no Item
Como um operador do sistema
Eu quero informar um item com desconto
Para obter o valor do percentual de comissão

Cenário: Obtendo percentual de comissão
  Dado que existe um(a) item_pedido
  E eu estou no item
  E o valor de tabela for 736.00
  E o valor de venda for 662.40
  E a quantidade for 1
  E o percentual de desconto for 10
  Quando salvar o item de pedido
  Então o valor da comissao calculada deve ser 6.32

