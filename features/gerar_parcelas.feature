# http://www.pivotaltracker.com/story/show/791104
Feature: Gerar Parcelas
  Como um vendedor
  Eu quero Gerar Duplicatas
  Para que seja alimentado o Contas a Receber

  Cenário: Gerando Duplicatas
    Dado que me identifiquei como tubform com a senha 123456
	  E que existe um(a) pedido
    E que estou no(a) pedido
    E que o total do Pedido seja 1500
    E que o Plano de Pagamento é 030060090
    E que o Nome do Comprador é GUSTAVOLG.LG
    Quando eu Gerar as Parcelas
    Então eu preciso receber a mensagem ok

