class CreateNotasFiscais < ActiveRecord::Migration
  def self.up
    create_table :notas_fiscais do |t|
      t.integer :numero_nota
      t.integer :pedido_id
      t.string :selo
      t.string :serie
      t.integer :cliente_id
      t.decimal :percentual_icms
      t.date :emissao
      t.decimal :total_mercadoria
      t.decimal :valor_frete
      t.string :cfop
      t.string :natureza_operacao
      t.decimal :valor_ipi
      t.decimal :valor_desconto
      t.decimal :total_nota
      t.string :status
      t.decimal :base_calculo_icms
      t.decimal :valor_icms
      t.integer :qtde_volumes
      t.date :entrada
      t.date :saida
      t.integer :transportadora_id
      t.decimal :percentual_desconto
      t.text :observacao
      t.decimal :base_calculo_icms_substituicao_tributaria
      t.decimal :percentual_icms_substituicao_tributaria
      t.decimal :valor_icms_substituicao_tributaria

      t.timestamps
    end
  end

  def self.down
    drop_table :notas_fiscais
  end
end
