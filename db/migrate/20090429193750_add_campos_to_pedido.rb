class AddCamposToPedido < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :tipo, :boolean
    add_column :pedidos, :comprador, :string
    add_column :pedidos, :especial, :boolean
    add_column :pedidos, :registro, :date
    add_column :pedidos, :empresa_id, :integer
    add_column :pedidos, :operador_estorno_id, :integer
    add_column :pedidos, :autorizador_id, :integer
  end

  def self.down
    remove_column :pedidos, :tipo
    remove_column :pedidos, :comprador
    remove_column :pedidos, :especial
    remove_column :pedidos, :registro
    remove_column :pedidos, :empresa_id
    remove_column :pedidos, :operador_estorno_id
    remove_column :pedidos, :autorizador_id
  end
end
