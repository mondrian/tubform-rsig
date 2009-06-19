Factory.define :classe do |c|
  c.sequence(:descricao) { |n| "Classe de Teste #{n}" }
end

