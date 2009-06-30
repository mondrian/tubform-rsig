class CorrigeClienteInscricaoEstadual < ActiveRecord::Migration
  def self.up
    remove_column :clientes, :escricao_estadual
    add_column :clientes, :inscricao_estadual, :string
  end

  def self.down
    add_column :clientes, :escricao_estadual, :string
    remove_column :clientes, :inscricao_estadual
  end
end
