class SepararCpfCnpj < ActiveRecord::Migration
  def self.up
    remove_column(:clientes, :cpf_cnpj)
    add_column(:clientes, :cpf, :string, :limit => 11)
    add_column(:clientes, :cnpj, :string, :limit => 14)
  end

  def self.down
    remove_column(:clientes, :cpf)
    remove_column(:clientes, :cnpj)
    add_column(:clientes, :cpf_cnpj, :string, :limit => 14)
  end
end
