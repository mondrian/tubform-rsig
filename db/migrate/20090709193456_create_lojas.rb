class CreateLojas < ActiveRecord::Migration
  def self.up
    create_table :lojas do |t|
      t.string :nome_loja

      t.timestamps
    end
  end

  def self.down
    drop_table :lojas
  end
end
