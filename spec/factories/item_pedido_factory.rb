Factory.define :item_pedido do |i|
  i.quantidade 1
  i.valor_tabela 736
  i.valor_venda 662.40
  i.desconto 10
  i.emissao_relatorio true
  i.association :produto
  i.association :pedido
end

