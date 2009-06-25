class CreateLancamentos < ActiveRecord::Migration
  def self.up
    create_table :lancamentos do |t|
      t.string :tipo_operacao, :limit => 1
      t.integer :plano_de_conta_id
      t.text :historico
      t.date :data_movimento
      t.date :data_lancamento
      t.string :doc_origem, :limit => 1
      t.decimal :valor, :precision => 12, :scale => 2
      t.string :nome_cheque
      t.integer :operador_id
      t.string :serie_doc_origem
      t.integer :banco_id
      t.integer :cliente_id
      t.boolean :imprimiu_op
      t.integer :vendedor_id
      t.integer :sequencia_movimento
      t.timestamps
    end
  end

  def self.down
    drop_table :lancamentos
  end
end