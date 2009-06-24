class AlterTipoDeClassificacaoFiscalOnProdutos < ActiveRecord::Migration
  def self.up
    remove_column :produtos, :classificacao_fiscal
    add_column :produtos, :classificacao_fiscal, :string
  end

  def self.down
    remove_column :produtos, :classificacao_fiscal
    add_column :produtos, :classificacao_fiscal, :integer
  end
end

