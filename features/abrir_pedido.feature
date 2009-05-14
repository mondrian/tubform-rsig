Funcionalidade: Abrir Pedido de Venda
  Como um vendedor
  Eu quero abrir um pedido de venda
  Para que seja base para que o processo de venda continue

  Cenário: Adicionando um pedido válido
    Quando eu requisitar um novo pedido
    E definir vendedor com o id 1
    E definir cliente com o id 1
    E definir forma de pagamento com o id 1
    E definir se o pedido e oficial
	E definir a previsao de entrega
	E definir a area
	E definir o tipo de venda (interna ou externa)
    E gravar o pedido
    Entao eu preciso receber a mensagem "Pedido Cadastrado com Sucesso"
    E eu preciso ter mais um pedido.

