Factory.define :grupo do |c|
  c.sequence(:descricao) { |n| "Grupo de Teste #{n}" }
  c.margem_lucro 0.05
  c.unificado false
end

