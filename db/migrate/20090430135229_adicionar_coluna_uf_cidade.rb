class AdicionarColunaUfCidade < ActiveRecord::Migration
  def self.up
    add_column :cidades, :uf, :string, :limit =>2
  end

  def self.down
      remove_column :cidades, :uf
  end
end
