Factory.define :regiao do |r|
  r.sequence(:descricao) { |n| "Região de Teste #{n}" }
end

