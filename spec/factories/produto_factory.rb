Factory.define :produto do |p|
  p.descricao "Produto de Teste"
  p.association :cor
  p.valor_especial 9.99
  p.valor_normal 9.99
  p.association :classe
  p.association :grupo
  p.status false
  p.situacao_tributaria 1
  p.preco_minimo_nota_fiscal 9.99
  p.ipi 9.99
  p.classificacao_fiscal 1
  p.peso_liquido 1
  p.cod_emissao_nota_fiscal 1
  p.descricao_nota_fiscal "Produto de Teste"
  p.preco_normal_zona1 9.99
  p.preco_especial_zona1 9.99
  p.association :funcionario
  p.emissao_relatorio false
  p.custo 9.99
  p.cadastro_custo "2009-04-24"
  p.kit false
end

