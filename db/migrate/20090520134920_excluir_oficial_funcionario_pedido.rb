class ExcluirOficialFuncionarioPedido < ActiveRecord::Migration
  def self.up
    remove_columns(:pedidos, :oficial, :funcionario_id, :preco_especial, :preco_tabela)
  end

  def self.down
    add_column(:pedidos, :oficial, :boolean)
    add_column(:pedidos, :funcionario_id, :integer)
    add_column(:pedidos, :preco_especial, :decimal, :precision => 8, :scale => 2)
    add_column(:pedidos, :preco_tabela, :decimal, :precision => 8, :scale => 2)
  end
end
