# http://www.pivotaltracker.com/story/show/791007
Feature: Estabelecer uma comissão acordada
  Como um operador
  Eu quero definir uma nova comissão
  Para que ela sobreponha qualquer comissão já informada

  Cenário: Informar uma nova comissão acordada para pedido
    Dado que me identifiquei como tubform com a senha 123456
    E que estou na exibição de pedido 1
    Quando eu clicar em Comissão Acordada
    E defino comissao_vendedor com o valor 1
    E defino comissao_telemarketing com o valor 2
    E eu salvar o registro
    Então preciso receber a mensagem "Pedido Atualizado com Sucesso"

