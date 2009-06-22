# http://www.pivotaltracker.com/story/show/791064
Feature: Aplicar Desconto Ponderado
  Como um vendedor
  Eu quero aplicar um desconto ponderado
  Para que eu tenha o valor final do pedido

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"

  Cenário: Aplicando Desconto Ponderado
    Dado que existe(m) registro(s) de pedido com os seguintes dados:
      | id | plano de pagamento | data        | desconto |
      | 1  | 030060090          | 2009-06-19  | 8        |
    Dado que existe(m) registro(s) de item pedido com os seguintes dados:
      | pedido id | valor tabela | valor venda | desconto  | quantidade | emissao relatorio |
      | 1         | 500          | 425         | 15        | 3          | sim               |
    Quando eu estiver em exibição desse pedido
    Então preciso ver "Valor do desconto ponderado: 21.8%"

