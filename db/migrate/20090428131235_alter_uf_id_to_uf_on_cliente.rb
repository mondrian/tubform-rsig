class AlterUfIdToUfOnCliente < ActiveRecord::Migration
  def self.up
    remove_column :clientes, :uf_id
    add_column :clientes, :uf, :string
  end

  def self.down
    remove_column :clientes, :uf
    add_column :clientes, :uf_id, :integer
  end
end
