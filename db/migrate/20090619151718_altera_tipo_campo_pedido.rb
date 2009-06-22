class AlteraTipoCampoPedido < ActiveRecord::Migration
  def self.up
    remove_column :pedidos, :estorno
    add_column :pedidos, :status_estorno, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :pedidos, :status_estorno
    add_column :pedidos, :estorno, :date
  end
end
