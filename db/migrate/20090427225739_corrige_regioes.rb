class CorrigeRegioes < ActiveRecord::Migration
  def self.up
    drop_table :regiaos
    create_table :regioes do |t|
      t.string :descricao

      t.timestamps
    end

  end

  def self.down
    drop_table :regioes
    create_table :regiaos do |t|
      t.string :descricao

      t.timestamps
    end

  end
end
