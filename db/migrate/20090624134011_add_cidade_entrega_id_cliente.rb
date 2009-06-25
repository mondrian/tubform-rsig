class AddCidadeEntregaIdCliente < ActiveRecord::Migration
  def self.up
    add_column :clientes, :cidade_entrega_id, :integer
    add_column :clientes, :area_id, :integer
  end

  def self.down
    remove_columns :clientes, :cidade_entrega_id, :area_id
  end
end
