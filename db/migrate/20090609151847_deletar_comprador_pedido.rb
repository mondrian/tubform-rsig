class DeletarCompradorPedido < ActiveRecord::Migration
  def self.up
    remove_column(:pedidos, :comprador)
  end

  def self.down
    add_column(:pedidos, :comprador, :string)
  end
end
