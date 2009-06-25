class CreatePlanosdepagamento < ActiveRecord::Migration
  def self.up
    create_table :planosdepagamento do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :planosdepagamento
  end
end
