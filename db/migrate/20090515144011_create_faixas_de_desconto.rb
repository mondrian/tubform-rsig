class CreateFaixasDeDesconto < ActiveRecord::Migration
  def self.up
    create_table :faixas_de_desconto do |t|
      t.integer :de
      t.integer :ate
      t.decimal :desconto_permitido

      t.timestamps
    end
  end

  def self.down
    drop_table :faixas_de_desconto
  end
end
