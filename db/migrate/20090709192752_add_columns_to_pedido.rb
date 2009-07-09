class AddColumnsToPedido < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :loja_origem_id, :integer
    add_column :pedidos, :loja_destino_id, :integer
  end

  def self.down
    remove_column :pedidos, :loja_destino_id
    remove_column :pedidos, :loja_origem_id
  end
end
