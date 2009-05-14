class CreateItensMinutas < ActiveRecord::Migration
  def self.up
    create_table :itens_minutas do |t|
      t.integer :produto_id
      t.integer :qtde

      t.timestamps
    end
  end

  def self.down
    drop_table :itens_minutas
  end
end
