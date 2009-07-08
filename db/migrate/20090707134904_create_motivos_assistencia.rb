class CreateMotivosAssistencia < ActiveRecord::Migration
  def self.up
    create_table :motivos_assistencia do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :motivos_assistencia
  end
end
