class CreateRoteiros < ActiveRecord::Migration
  def self.up
    create_table :roteiros do |t|
      t.string :descricao
      t.integer :funcionario_id
      t.integer :regiao_id

      t.timestamps
    end
  end

  def self.down
    drop_table :roteiros
  end
end
