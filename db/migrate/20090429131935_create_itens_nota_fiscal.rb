class CreateItensNotaFiscal < ActiveRecord::Migration
  def self.up
    create_table :itens_nota_fiscal do |t|
      t.integer :produto_id
      t.string :unidade_medida
      t.decimal :quantidade
      t.decimal :valor_item_faturado
      t.decimal :valor_item_original
      t.string :situacao_tributaria_item
      t.decimal :percentual_icms_item
      t.decimal :percentual_ipi_item
      t.decimal :peso_liquido
      t.integer :cod_emissao_nf
      t.integer :nota_fiscal_id

      t.timestamps
    end
  end

  def self.down
    drop_table :itens_nota_fiscal
  end
end
