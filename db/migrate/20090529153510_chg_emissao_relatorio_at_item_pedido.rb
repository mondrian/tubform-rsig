class ChgEmissaoRelatorioAtItemPedido < ActiveRecord::Migration
  def self.up
    remove_column :item_pedidos, :emissao_relatorio
    add_column :item_pedidos, :emissao_relatorio, :boolean
  end

  def self.down
    remove_column :item_pedidos, :emissao_relatorio
    add_column :item_pedidos, :emissao_relatorio, :boolean, :null => false
  end
end
