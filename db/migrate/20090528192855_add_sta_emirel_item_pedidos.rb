class AddStaEmirelItemPedidos < ActiveRecord::Migration
  def self.up
     add_column :item_pedidos, :emissao_relatorio, :boolean, :null => false
  end

  def self.down
     remove_column :item_pedidos, :emissao_relatorio
  end
end

