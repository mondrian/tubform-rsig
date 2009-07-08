class CreateComponentes < ActiveRecord::Migration
  def self.up
    create_table :componentes do |t|
      t.string :descricao
      t.decimal :altura
      t.decimal :largura
      t.decimal :espessura
      t.decimal :percentual_de_perda
      t.decimal :tamanho_chapa
      t.integer :cor_id
      t.boolean :manufatura
      t.decimal :quantidade_lote
      t.boolean :coladeira
      t.boolean :furadeira
      t.boolean :pintura
      t.boolean :embalagem
      t.boolean :produto_elaborado
      t.decimal :valor_metro_quadrado
      t.decimal :valor_componente
      t.boolean :ativo
      t.boolean :componente_terceiro
      t.boolean :usinagem
      t.boolean :serraria
      t.integer :materia_prima_id
      t.integer :grupo_componente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :componentes
  end
end
