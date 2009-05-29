class CreateContraPartidas < ActiveRecord::Migration
  def self.up
    create_table :contra_partidas do |t|
      t.integer :lancamento_id
      t.integer :plano_de_conta_id
      t.integer :duplicata_id
      t.decimal :valor_lancamento, :precision => 12, :scale => 2
      t.string :tipo_operacao, :limit => 1
      t.text :historico
      t.timestamps
    end
  end

  def self.down
    drop_table :contra_partidas
  end
end
