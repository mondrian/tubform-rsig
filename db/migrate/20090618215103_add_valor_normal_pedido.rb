class AddValorNormalPedido < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :valor_normal, :decimal, :precision => 12, :scale => 2
  end

  def self.down
    remove_column :pedidos, :valor_normal
  end
end
