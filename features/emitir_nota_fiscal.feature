Funcionalidade: Emitir Nota Fiscal
  Como um Operador
  Eu quero emitir uma Nota Fiscal
  Para que o processo de venda seja finalizado

  Cenário: Emitindo Uma Nota Fiscal
    Dado que existe um(a) pedido
    E que estou no formulário de cadastro de pedidos
    E defino cliente_id com valor 1
	E seleciono transportadora_id com o valor Tubform
    E defino pedido_id com valor 1
    E defino fornecedor_id com valor 1
    E defino numero_nota com valor 974653
    E defino selo com valor 45783
    E defino serie com valor AA
    E defino percentual_icms com valor 17
    E defino emissao com valor 30-06-2009
    E defino total_mercadoria com valor 500
    E defino valor_frete com valor 0
    E defino cfop com valor 1501
    E defino valor_ipi com valor 120
    E defino valor_desconto com valor 5
    E defino total_nota com valor 400
    E defino status com valor I
    E defino base_calculo_icms com valor 17
    E defino valor_icms com valor 150
    E defino qtde_volumes com valor 3
    E defino entrada com valor 30-06-2009
    E defino saida com valor 30-06-2009
    E defino percentual_desconto com valor 3
    E defino base_calculo_icms_substituicao_tributaria 290
    E defino percentual_icms_substituicao_tributaria 3
    E defino valor_icms_substituicao_tributaria 40
    Quando eu salvar o registro
    Então preciso receber a mensagem "NF Cadastrada com Sucesso"
