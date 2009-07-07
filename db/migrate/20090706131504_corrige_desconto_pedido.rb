class CorrigeDescontoPedido < ActiveRecord::Migration
  def self.up
    change_column :pedidos, :desconto , :numeric, :precision => 6,  :scale => 2, :default => 0.0
    change_column :pedidos, :acrescimo , :numeric, :precision => 6,  :scale => 2, :default => 0.0
  end

  def self.down
    change_column :pedidos, :desconto , :numeric, :precision => 3,  :scale => 2, :default => 0.0
    change_column :pedidos, :acrescimo , :numeric, :precision => 3,  :scale => 2, :default => 0.0
  end
end
