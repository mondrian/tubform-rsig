# http://www.pivotaltracker.com/story/show/791095
@trabalhando
Feature: Emitir Nota Fiscal
  Como um expedidor
  Eu quero emitir uma Nota Fiscal
  Para que o processo de venda seja finalizado

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Novo(a) Nota fiscal"
    E possuo permissão para "Criar Nota fiscal"

  Cenário: Emitindo Uma Nota Fiscal Manualmente
    Dado que estou no cadastro de nota fiscal
    E defino número da nota como "2020"
    E defino selo como "1111"
    E defino serie como "AA"
    E seleciono o(a) cliente "Cliente de Teste"
    E defino percentual do icms como "17"
    E defino data de emissão como "2009-05-30"
    E defino valor do frete como "0"
    E defino cfop como "5102"
    E defino natureza da operação como "VENDA"
    E defino valor do ipi como "0"
    E defino valor do desconto como "0"
    E defino status como "Não"
    E defino quantidade de volumes como "1"
    E defino data de entrada como "2009-06-30"
    E defino data de saída como "2009-06-30"
    E defino percentual de desconto como "3"
    E defino base de cálculo icms substituição tributária como "290"
    E defino percentual do icms substituição tributária como "3"
    E defino valor do icms substituição tributária como "40"
    Quando peço para salvar
    Então preciso ver "Nota Fiscal Gravada, Insira os Itens ..."

