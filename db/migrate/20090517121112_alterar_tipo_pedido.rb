class AlterarTipoPedido < ActiveRecord::Migration
  def self.up
    remove_column(:pedidos, :tipo)
    add_column :pedidos, :tipo, :string, :limit => 1
  end

  def self.down
    remove_column(:pedidos, :tipo)
    add_column :pedidos, :tipo, :boolean
  end
end
