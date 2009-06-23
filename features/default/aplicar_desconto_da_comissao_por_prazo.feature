# http://www.pivotaltracker.com/story/show/791082
@trabalhando
Feature: Aplicar Desconto da Comissão por Prazo
  Como um vendedor
  Eu quero inserir um Item de Pedido
  Para que seja calculada minha comissao

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"

  Cenário: Obtendo a comissao por
    Dado que o prazo médio em parâmetros é "75"
    E que existe um pedido
    E que existe(m) registro(s) de item pedido com os seguintes dados:
      | pedido id | valor tabela | valor venda | desconto  | quantidade | emissao relatorio |
      | 1         | 500          | 500         | 0         | 1          | sim               |
    E que estou em alteração desse pedido
    E defino plano de pagamento como "030060090120150"
    Quando peço para salvar
    Então preciso ver "Comissão do vendedor: 5.0%"

