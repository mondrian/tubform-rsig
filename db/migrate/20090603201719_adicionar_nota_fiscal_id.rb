class AdicionarNotaFiscalId < ActiveRecord::Migration
  def self.up
    add_column :itens_nota_fiscal, :nota_fiscal_id, :integer
  end

  def self.down
    remove_column :itens_nota_fiscal, :nota_fiscal_id
  end
end
