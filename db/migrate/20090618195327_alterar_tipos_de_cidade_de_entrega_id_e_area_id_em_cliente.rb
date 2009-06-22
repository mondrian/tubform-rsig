class AlterarTiposDeCidadeDeEntregaIdEAreaIdEmCliente < ActiveRecord::Migration
  def self.up
    remove_column :clientes, :cidade_entrega_id
    remove_column :clientes, :area_id
  end

  def self.down
    add_column :clientes, :cidade_entrega_id, :integer
    add_column :clientes, :area_id, :integer
  end
end

