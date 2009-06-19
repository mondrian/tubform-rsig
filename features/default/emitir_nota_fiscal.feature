# http://www.pivotaltracker.com/story/show/791095
Feature: Emitir Nota Fiscal
  Como um Operador
  Eu quero emitir uma Nota Fiscal
  Para que o processo de venda seja finalizado
  Cenário: Emitindo Uma Nota Fiscal Manualmente
    Dado que existe um(a) transportadora
    E que existe um(a) fornecedor
    E que estou no formulário de cadastro de nota_fiscal
    E defino numero nota com o valor 2020
    E defino selo com o valor 1111
    E defino serie com o valor AA
    E defino cliente_id com o valor 1
    E defino percentual_icms com o valor 17
    E defino emissao com o valor 2009-05-30
    E defino valor_frete com o valor 0
    E defino cfop com o valor 5102
    E defino natureza_operacao com o valor VENDA
    E defino valor_ipi com o valor 0
    E defino valor_desconto com o valor 0
    E defino status com o valor Não
    E defino qtde_volumes com o valor 1
    E defino entrada com o valor 2009-06-30
    E defino saida com o valor 2009-06-30
    E defino percentual_desconto com o valor 3
    E defino base_calculo_icms_substituicao_tributaria com o valor 290
    E defino percentual_icms_substituicao_tributaria com o valor 3
    E defino valor_icms_substituicao_tributaria com o valor 40
    Quando eu salvar o registro
    Então preciso receber a mensagem "Nota Fiscal Gravada, Insira os Itens ..."
