class CreateProdutoKits < ActiveRecord::Migration
  def self.up
    create_table :produto_kits do |t|
      t.integer :produto_id
      t.integer :empresa_id
      t.decimal :fator_conversao
      t.boolean :status
      t.decimal :preco_normal
      t.decimal :preco_especial

      t.timestamps
    end
  end

  def self.down
    drop_table :produto_kits
  end
end
