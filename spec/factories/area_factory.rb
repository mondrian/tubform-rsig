Factory.define :area do |a|
  a.descricao 'Area de Teste'
  a.association :cidade
  a.association :roteiro
end

