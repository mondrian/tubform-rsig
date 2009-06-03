# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'faixa_de_desconto', 'faixas_de_desconto'
   inflect.irregular 'acao', 'acoes'
   inflect.irregular 'nota_fiscal', 'notas_fiscais'
   inflect.irregular 'item_nota_fiscal','itens_nota_fiscal'
   inflect.irregular 'fornecedor','fornecedores'
 #   inflect.uncountable %w( fish sheep )
 end
