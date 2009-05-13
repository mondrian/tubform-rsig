class IncluirEmailBairro < ActiveRecord::Migration
  def self.up
	add_column :clientes, :email, :string
	add_column :clientes, :bairro, :string
  end

  def self.down
	remove_columns(:clientes, :email, :bairro)
  end
end
