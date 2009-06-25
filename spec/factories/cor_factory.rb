Factory.define :cor do |c|
  c.sequence(:descricao) { |n| "Cor de Teste #{n}" }
end

