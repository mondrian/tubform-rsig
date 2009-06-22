Factory.define :faixa_de_desconto do |f|
  f.de 0
  f.ate 75
  f.desconto_permitido 10
end

Factory.define :fornecedor do |f|
  f.nome 'Aço Cearense'
  f.endereco 'Fortaleza'
  f.cnpj '07811946000187'
end

Factory.define :produto_kit do |k|
  k.empresa_id 1
  k.fator_conversao 4
  k.status true
  k.preco_normal 200
  k.preco_especial 0
  k.association :produto, :factory => :produto
end

Factory.define :nota_fiscal do |n|
    n.sequence(:numero_nota) { |n| "0#{n}" }
    n.selo '12'
    n.serie 'AA'
    n.association :cliente
    n.percentual_icms 17
    n.emissao '2009-05-02'
    n.valor_frete 0
    n.cfop '5102'
    n.natureza_operacao 'VENDA'
    n.valor_ipi 0
    n.valor_desconto 0
    n.total_nota 0
    n.status 'N'
    n.base_calculo_icms 0
    n.valor_icms 0
    n.qtde_volumes 1
    n.entrada '2009-05-01'
    n.saida '2009-05-05'
    n.percentual_desconto 0
    n.observacao 'teste'
    n.base_calculo_icms_substituicao_tributaria 0
    n.percentual_icms_substituicao_tributaria 0
    n.valor_icms_substituicao_tributaria 0
  end

