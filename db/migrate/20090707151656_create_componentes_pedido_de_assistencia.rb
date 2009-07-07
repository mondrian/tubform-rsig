class CreateComponentesPedidoDeAssistencia < ActiveRecord::Migration
  def self.up
    create_table :componentes_pedido_de_assistencia do |t|
      t.integer :produto
      t.integer :quantidade
      t.decimal :valor
      t.integer :sequencia_monvimento
      t.boolean :emite_relatorio
      t.integer :codigo_produto_kit
      t.string :justificativa
      t.boolean :componente
      t.integer :motivo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :componentes_pedido_de_assistencia
  end
end
