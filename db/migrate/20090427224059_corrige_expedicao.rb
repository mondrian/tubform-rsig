class CorrigeExpedicao < ActiveRecord::Migration
  def self.up
    drop_table :expedicaos
    
    create_table :expedicoes do |t|
      t.integer :minuta_id
      t.integer :produto_id
      t.string :numero_do_volume
      t.decimal :qtd_carregada
      t.decimal :qtd_minuta
      t.boolean :vidro

      t.timestamps
    end
  end

  def self.down
    drop_table :expedicoes
    
    create_table :expedicaos do |t|
      t.integer :minuta_id
      t.integer :produto_id
      t.string :numero_do_volume
      t.decimal :qtd_carregada
      t.decimal :qtd_minuta
      t.boolean :vidro

      t.timestamps
    end
  end
end
