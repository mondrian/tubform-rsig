Funcionalidade: Gerar Parcelas
  Como um vendedor
  Eu quero Gerar Duplicatas
  Para que seja alimentado o Contas a Receber

  Cenário: Gerando Duplicatas
    Dado que existe um(a) pedido
    E que estou no(a) pedido
    E que o total do Pedido seja 1500
    E que o Plano de Pagamento é 030060090
    E que o Nome do Comprador é MAGNOPIROL
    Quando eu Gerar as Parcelas
    Então eu preciso receber a mensagem ok