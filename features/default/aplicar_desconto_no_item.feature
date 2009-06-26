# http://www.pivotaltracker.com/story/show/791062

Feature: Aplicar Desconto Da Comissão Por Desconto No Item
  Como um vendedor
  Eu quero informar um item com desconto
  Para obter o valor do percentual de comissão

  Só é possível o usuário definir preço de venda em produto que possui preço especial,
  produtos que não possuem preço especial o desconto é apenas em percentual

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"

  Cenário: Obtendo percentual de desconto a partir do valor de venda sem preço especial sem desconto
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | valor normal |
      |1  | 736          |
    Dado que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto de Teste"
    E defino percentual de desconto como "10"
    E defino quantidade como "1"
    Quando peço para salvar
    Então preciso ver "Valor de Venda: 736.00"

  Cenário: Obtendo percentual de desconto a partir do valor de venda sem preço especial com desconto
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | valor normal |
      |1  | 736          |
    Dado que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto de Teste"
    E defino percentual de desconto como "10"
    E defino quantidade como "1"
    Quando peço para salvar
    Então preciso ver "Valor de Venda: 662.40"

  Cenário: Obtendo percentual de desconto a partir do valor de venda com preço especial sem desconto
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | valor normal | valor especial | descricao        |
      |1  | 736          | 662.40         | Produto Especial |
    Dado que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto Especial"
    E defino quantidade como "1"
    E defino percentual de desconto como "0"
    Quando peço para salvar
    Então preciso ver "Valor de Venda: 662.40"
    Então preciso ver "Produto em preço especial"

  Cenário: Obtendo percentual de desconto a partir do valor de venda com preço especial com desconto
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | valor normal | valor especial | descricao        |
      |1  | 736          | 662.40         | Produto Especial |
    Dado que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto Especial"
    E defino quantidade como "1"
    E defino percentual de desconto como "10"
    Quando peço para salvar
    Então preciso ver "Valor de Venda: 596.16"
    Então preciso ver "Produto em preço especial"

  Cenário: Obtendo percentual de desconto a partir do valor de venda com preço especial com desconto
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | valor normal | valor especial | descricao        |
      |1  | 736          | 662.40         | Produto Especial |
    Dado que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto Especial"
    E defino quantidade como "1"
    E defino valor de venda como "596.16"
    Quando peço para salvar
    Então preciso ver "Desconto: 10"
    Então preciso ver "Produto em preço especial"

