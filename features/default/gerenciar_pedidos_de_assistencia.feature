@trabalhando
Feature: Gerenciar pedidos de assistencia
  Como um vendedor
  Eu quero abrir um pedido de assitencia
  Para que seja base para o processo de assistencia

  Contexto:
    Dado que existe(m) 3 registro(s) de pedido
    E que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Novo(a) Pedido"
    E possuo permissão para "Criar Pedido"

  Cenário: Adicionar um pedido válido
    E que estou em cadastro de pedido de assistencia
    E seleciono o(a) vendedor "Funcionário de Teste"
    E seleciono o(a) cliente "Cliente de Teste"
    E defino plano de pagamento como "000030060090120"
    E defino previsão de entrega como "2009-05-30"
    E defino data do pedido como "2009-05-30"
    E defino nosso numero como "1111111"
    E seleciono o(a) transportadora "Transportadora de Teste"
    E seleciono o(a) tipo "Interno"
    E defino status como "A"
    Quando peço para salvar
    Então preciso ver "Pedido Cadastrado com Sucesso"

  Cenário: Alterando um pedido de assistencia válido
    Dado que estou em listagem de pedidos de assistencia
    E peço a alteração do pedido de assistencia que o(a) data é "2009-05-14"
    E seleciono o(a) tipo "Externo"
    E defino status como "P"
    Quando peço para salvar
    Então preciso ver "Pedido de Assistencia Atualizado com Sucesso"

  Cenário: Listar Pedidos de Assistencia Cadastrados
    Quando eu estiver em listagem de pedidos de assistencia
    Então preciso ver "Encontrado(s) 3 registro(s) de pedido."

