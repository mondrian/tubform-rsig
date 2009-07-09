class CorrigeProdutoItensPedidoDeAssistencia < ActiveRecord::Migration
  def self.up
    remove_column :itens_pedido_de_assistencia, :produto
    add_column :itens_pedido_de_assistencia, :produto_id, :integer
  end

  def self.down
    remove_column :itens_pedido_de_assistencia, :produto_id
    add_column :itens_pedido_de_assistencia, :produto, :integer
  end
end
