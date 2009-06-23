# http://www.pivotaltracker.com/story/show/791104
@trabalhando
Feature: Gerar Duplicatas
  Como um vendedor
  Eu quero gerar duplicatas
  Para que seja alimentado o Contas a Receber

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Novo(a) Pedido"
    E possuo permissão para "Criar Pedido"
    E possuo permissão para "Listar Duplicata"

  Cenário: Listar Duplicatas de Pedido Não Entregue
    Dado que existe(m) registro(s) de pedido com os seguintes dados:
      | id | plano de pagamento | data       |
      |  1 | 030060090          | 2009-06-19 |
    Dado que existe(m) registro(s) de item pedido com os seguintes dados:
      | valor tabela | valor venda | pedido id |
      | 1500         | 1500        | 1         |
    Quando eu estiver em listagem de duplicatas
    Então eu preciso ver os seguintes registros:
      | data vencimento | valor   |
      | 2009-07-19      | 500.0   |
      | 2009-08-18      | 500.0   |
      | 2009-09-17      | 500.0   |

