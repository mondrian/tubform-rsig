class CorrigeComponenteItemPedidoDeAssistencia < ActiveRecord::Migration
  def self.up
    remove_column :itens_pedido_de_assistencia, :componente
    add_column :itens_pedido_de_assistencia, :usa_componente, :boolean
  end

  def self.down
    remove_column :itens_pedido_de_assistencia, :usa_componente
    add_column :itens_pedido_de_assistencia, :componente, :boolean
  end
end
