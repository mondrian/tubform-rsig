# http://www.pivotaltracker.com/story/show/791135
Feature: Verificar se o produto sairá no relatório
  Como um operador
  Eu quero inserir um Item de Pedido
  Para que eu possa verificar se o produto sairá na impressão do relatório

  Cenário: Verificando produto que sairá nos relatórios
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | descricao        |valor normal | emissao relatorio |
      |1  | Produto de Teste |736          | sim               |
    Dado que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto de Teste"
    E defino percentual de desconto como "10"
    E defino quantidade como "1"
    E peço para salvar
    Quando eu estiver em relatório X
    Então preciso ver "Produto de Teste"

  Cenário: Verificando produto que não sairá no relatórios
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | descricao        |valor normal | emissao relatorio |
      |1  | Produto de Teste |736          | sim               |
    Dado que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto de Teste"
    E defino percentual de desconto como "10"
    E defino quantidade como "1"
    E peço para salvar
    Quando eu estiver em relatório X
    Então não devo ver "Produto de Teste"

