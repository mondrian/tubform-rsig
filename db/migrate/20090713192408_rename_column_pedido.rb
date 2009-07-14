class RenameColumnPedido < ActiveRecord::Migration
  def self.up
    rename_column(:pedidos, :rota_entrega_id, :roteiro_entrega_id)
  end

  def self.down
    rename_column(:pedidos, :roteiro_entrega_id, :rota_entrega_id)
  end
end

