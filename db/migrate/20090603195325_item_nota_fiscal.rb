class ItemNotaFiscal < ActiveRecord::Migration
  def self.up
    create_table :itens_nota_fiscal do |t|
      t.integer :produto_id
      t.string  :unidade
      t.integer :quantidade
      t.decimal :valor_item, :precision => 12, :scale => 2
      t.decimal :valor_original, :precision => 12, :scale => 2
      t.string  :situacao_tributaria, :limit => 1, :default => 'T'
      t.decimal :perc_icms, :precision => 6, :scale => 2
      t.decimal :perc_ipi, :precision => 6, :scale => 2
      t.decimal :peso_liquido, :precision => 6, :scale => 2
      t.string  :codigo_emissao, :limit => 1
      t.timestamps
    end

    def self.down
    end
  end
end
