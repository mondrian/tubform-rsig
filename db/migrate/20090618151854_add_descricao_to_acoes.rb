class AddDescricaoToAcoes < ActiveRecord::Migration
  def self.up
    add_column :acoes, :descricao, :string
  end

  def self.down
    remove_column :acoes, :descricao
  end
end

