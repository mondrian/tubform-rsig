class CreateParametros < ActiveRecord::Migration
  def self.up
    create_table :parametros do |t|
      t.string :chave
      t.string :valor
      t.string :descricao
      t.integer :empresa_id

      t.timestamps
    end
  end

  def self.down
    drop_table :parametros
  end
end

