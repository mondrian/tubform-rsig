class AddCamposTransportadora < ActiveRecord::Migration
  def self.up
    add_column :transportadoras, :uf, :string
    add_column :transportadoras, :cnpj, :string
    add_column :transportadoras, :cidade_id, :integer
    add_column :transportadoras, :inscricao_estadual, :string
  end

  def self.down
    remove_column :transportadoras, :uf
    remove_column :transportadoras, :cnpj
    remove_column :transportadoras, :cidade_id
    remove_column :transportadoras, :inscricao_estadual
  end
end
