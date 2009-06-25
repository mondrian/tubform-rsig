Factory.define :minuta do |m|
  m.data '2009-05-14'
  m.fechamento '2009-05-14'
  m.association :operador_fechamento, :factory => :funcionario
  m.saida '2009-05-14'
  m.obs 'Observação de Teste'
  m.fechamento_financeiro '2009-05-14'
  m.association :funcionario_fechamento_financeiro, :factory => :funcionario
  m.association :roteiro
end

