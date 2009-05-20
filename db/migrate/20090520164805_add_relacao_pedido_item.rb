class AddRelacaoPedidoItem < ActiveRecord::Migration
  def self.up
    add_column :item_pedidos, :pedido_id, :integer
    add_column :item_pedidos, :produto_id, :integer
    add_index  :item_pedidos, :pedido_id
    add_index  :item_pedidos, :produto_id
  end

  def self.down
    remove_column :imtem_pedidos, :pedido_id
    remove_column :imtem_pedidos, :produto_id
  end
end
