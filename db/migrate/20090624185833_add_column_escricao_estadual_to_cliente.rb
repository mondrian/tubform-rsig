class AddColumnEscricaoEstadualToCliente < ActiveRecord::Migration
  def self.up
		add_column :clientes, :escricao_estadual, :string
  end

  def self.down
		remove_column :clientes, :escricao_estadual
  end
end
