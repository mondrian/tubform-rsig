class CreateMetaProdutos < ActiveRecord::Migration
  def self.up
    create_table :meta_produtos do |t|
      t.integer :mes
      t.integer :ano
      t.integer :qdt_dias_uteis
      t.date :data_ini
      t.date :data_fim

      t.timestamps
    end
  end

  def self.down
    drop_table :meta_produtos
  end
end
