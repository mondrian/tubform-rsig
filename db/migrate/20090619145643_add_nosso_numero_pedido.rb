class AddNossoNumeroPedido < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :nosso_numero, :string, :limit => 7
  end

  def self.down
    remove_column :pedidos, :nosso_numero
  end
end
