class AddGeraMinutaPedido < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :gera_minuta, :boolean, :default => true
  end

  def self.down
    remove_column :pedidos, :gera_minuta
  end
end
