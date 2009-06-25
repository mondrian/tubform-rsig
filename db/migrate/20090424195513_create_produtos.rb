class CreateProdutos < ActiveRecord::Migration
  def self.up
    create_table :produtos do |t|
      t.string :descricao
      t.integer :cor_id
      t.decimal :valor_especial
      t.decimal :valor_normal
      t.integer :classe_id
      t.integer :grupo_id
      t.boolean :status
      t.integer :situacao_tributaria
      t.decimal :preco_minimo_nota_fiscal
      t.decimal :ipi
      t.integer :classificacao_fiscal
      t.integer :peso_liquido
      t.integer :cod_emissao_nota_fiscal
      t.string :descricao_nota_fiscal
      t.decimal :preco_normal_zona1
      t.decimal :preco_especial_zona1
      t.integer :funcionario_id
      t.boolean :emissao_relatorio
      t.decimal :custo
      t.date :cadastro_custo
      t.boolean :kit

      t.timestamps
    end
  end

  def self.down
    drop_table :produtos
  end
end
