 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'faixa_de_desconto', 'faixas_de_desconto'
   inflect.irregular 'acao', 'acoes'
   inflect.irregular 'nota_fiscal', 'notas_fiscais'
   inflect.irregular 'item_nota_fiscal','itens_nota_fiscal'
   inflect.irregular 'fornecedor','fornecedores'
   inflect.irregular 'regiao', 'regioes'
   inflect.irregular 'cor', 'cores'
 #   inflect.uncountable %w( fish sheep )
 end

