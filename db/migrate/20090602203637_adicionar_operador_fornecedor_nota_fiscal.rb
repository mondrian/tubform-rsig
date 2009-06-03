class AdicionarOperadorFornecedorNotaFiscal < ActiveRecord::Migration
  def self.up
    add_column :notas_fiscais, :operador_id, :integer
    add_column :notas_fiscais, :fornecedor_id, :integer
  end

  def self.down
    remove_columns(:notas_fiscais, :operador_id, :fornecedor_id)
  end
end
