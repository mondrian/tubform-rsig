class CreateGrupos < ActiveRecord::Migration
  def self.up
    create_table :grupos do |t|
      t.string :descricao
      t.decimal :margem_lucro
      t.boolean :unificado

      t.timestamps
    end
  end

  def self.down
    drop_table :grupos
  end
end
