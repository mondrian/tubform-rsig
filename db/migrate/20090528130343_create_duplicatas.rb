class CreateDuplicatas < ActiveRecord::Migration
  def self.up
    create_table :duplicatas do |t|
      t.integer :plano_de_conta_id, :null => false
      t.string :tipo_cobranca, :limit => 1, :null => false
      t.date :data_emissao, :null => false
      t.date :data_vencimento, :null => false
      t.decimal :valor, :precision => 12, :scale => 2
      t.integer :cliente_id, :null => false
      t.integer :pedido_id, :null => false
      t.string :nome_devedor, :limit => 50, :null => false
      t.integer :devedor_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :duplicatas
  end
end
