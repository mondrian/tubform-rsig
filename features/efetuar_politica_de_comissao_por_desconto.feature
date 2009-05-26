Funcionalidade: Efetuar Política de Comissão Por Desconto
Como um operador do sistema
Eu quero informar um item com desconto
Para a obter o valor base para aplicar a comissão

Cenário: Obtendo valores para cálculo de comissão
  Dado que tenho os seguintes itens em um pedido
    |item|preco de tabela|desconto aplicado|
    |1   |1000           |10%              |
    |2   |2000           |10%              |
    |3   |3000           |25%              |
    |4   |4000           |0%               |
  E comissão padrão de 6%
  E fator de multiplicação 0.150
  E percentual de desconto após o teto de 5.5%
  E teto de desconto 23%
  Quando gero o valor base de comissão
  Então obtenho os seguintes valores para cada item
    |item   |valor para calculo de comissao|
    |1      |750                           |
    |2      |1500                          |
    |3      |156                           |
    |4      |4000                          |

