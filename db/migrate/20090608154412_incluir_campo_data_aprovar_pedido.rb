class IncluirCampoDataAprovarPedido < ActiveRecord::Migration
  def self.up
		add_column :pedidos, :data_aprovacao_pedido, :date
  end

  def self.down
		remove_column :pedidos, :data_aprovacao_pedido
  end
end
