class AddPedidoIdIntoComponentesPedidoDeAssistencia < ActiveRecord::Migration
  def self.up
    add_column :componentes_pedido_de_assistencia, :pedido_id, :integer
  end

  def self.down
    remove_column :componentes_pedido_de_assistencia, :pedido_id
  end
end
