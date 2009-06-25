class CreateNotasFiscais < ActiveRecord::Migration
  def self.up
    create_table :notas_fiscais do |t|
      t.integer :numero_nota
      t.integer :pedido_id
      t.string :selo
      t.string :serie
      t.integer :cliente_id
      t.decimal :percentual_icms, :precision => 6, :scale => 2
      t.date :emissao
      t.decimal :total_mercadoria, :precision => 12, :scale => 2
      t.decimal :valor_frete, :precision => 12, :scale => 2
      t.string :cfop
      t.string :natureza_operacao
      t.decimal :valor_ipi, :precision => 12, :scale => 2
      t.decimal :valor_desconto, :precision => 12, :scale => 2
      t.decimal :total_nota, :precision => 12, :scale => 2
      t.string :status
      t.decimal :base_calculo_icms, :precision => 12, :scale => 2
      t.decimal :valor_icms, :precision => 12, :scale => 2
      t.integer :qtde_volumes
      t.date :entrada
      t.date :saida
      t.integer :transportadora_id
      t.decimal :percentual_desconto, :precision => 6, :scale => 2
      t.text :observacao
      t.decimal :base_calculo_icms_substituicao_tributaria, :precision => 12, :scale => 2
      t.decimal :percentual_icms_substituicao_tributaria, :precision => 6, :scale => 2
      t.decimal :valor_icms_substituicao_tributaria, :precision => 12, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :notas_fiscais
  end
end
