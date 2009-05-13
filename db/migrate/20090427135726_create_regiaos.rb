class CreateRegiaos < ActiveRecord::Migration
  def self.up
    create_table :regiaos do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :regiaos
  end
end
