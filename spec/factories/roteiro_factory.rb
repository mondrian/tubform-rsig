Factory.define :roteiro  do |r|
  r.descricao 'Roteiro de Teste'
  r.association :funcionario
  r.association :regiao
end

