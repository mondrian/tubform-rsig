class CreateTransportadoras < ActiveRecord::Migration
  def self.up
    create_table :transportadoras do |t|
      t.string :razao_social

      t.timestamps
    end
  end

  def self.down
    drop_table :transportadoras
  end
end
