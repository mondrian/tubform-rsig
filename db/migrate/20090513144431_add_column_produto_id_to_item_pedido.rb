class AddColumnProdutoIdToItemPedido < ActiveRecord::Migration
  def self.up
    add_column :item_pedidos, :produto_id, :integer
    remove_column :item_pedidos, :kit_id
  end

  def self.down
    remove_column :item_pedidos, :produto_id
    add_column :item_pedidos, :kit_id, :integer
  end
end
