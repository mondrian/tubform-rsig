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
   inflect.irregular 'pedido_de_assistencia', 'pedidos_de_assistencia'
   inflect.irregular 'item_pedido_de_assistencia', 'itens_pedido_de_assistencia'
   inflect.irregular 'motivo_assistencia', 'motivos_assistencia'
   inflect.irregular 'materia_prima', 'materias_primas'
   inflect.irregular 'componente_pedido_de_assistencia', 'componentes_pedido_de_assistencia'
 #   inflect.uncountable %w( fish sheep )
 end

