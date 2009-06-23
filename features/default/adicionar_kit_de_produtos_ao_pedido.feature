# http://www.pivotaltracker.com/story/show/791126
Feature: Adicionar kit de produtos ao pedido
  Como um vendedor
  Eu quero adicionar kit de produtos
  Para que eu possa realizar a venda e não precise selecionar os produtos individualmente

  Cenário: Adicionar kit de produtos válido
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | descricao        |valor normal | emissao relatorio | kit |
      |1  | Kit de Teste     |736          | sim               | sim |
    E que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Kit de Teste"
    E defino percentual de desconto como "10"
    E defino quantidade como "1"
    E peço para salvar
    Então preciso adicinar na tabela de item_pedido_kit os produtos que compoe o kit.

  Cenário: Adicionar kit de produto inválido
    Dado que existe(m) registro(s) de produto com os seguintes dados:
      |id | descricao        |valor normal | emissao relatorio |
      |1  | Produto de Teste |736          | sim               |
    E que existe um pedido
    E que estou em adicionar item ao pedido
    E seleciono o(a) produto "Produto de Teste"
    E defino percentual de desconto como "10"
    E defino quantidade como "1"
    E peço para salvar
    Então preciso adicinar na tabela de item_pedido_kit os produtos que compoe o kit.

