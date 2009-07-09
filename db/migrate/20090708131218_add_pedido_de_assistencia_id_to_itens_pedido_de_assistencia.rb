class AddPedidoDeAssistenciaIdToItensPedidoDeAssistencia < ActiveRecord::Migration
  def self.up
    add_column :itens_pedido_de_assistencia, :pedido_de_assistencia_id, :integer
  end

  def self.down
    remove_column :itens_pedido_de_assistencia, :pedido_de_assistencia_id
  end
end
