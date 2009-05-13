class IncluirUf < ActiveRecord::Migration
  def self.up
    create_table :ufs do |t|
      t.string :uf, :limit => 2
      t.string :descricao, :limit => 30
      t.timestamps
  end

  def self.down
      drop_table :ufs
  end
end
end
