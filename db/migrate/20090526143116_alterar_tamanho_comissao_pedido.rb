class AlterarTamanhoComissaoPedido < ActiveRecord::Migration
  def self.up
    remove_column(:pedidos, :comissao_vendedor)
    add_column(:pedidos, :comissao_vendedor, :decimal, :precision => 5, :scale => 2)
  end

  def self.down
    remove_column(:pedidos, :comissao_vendedor)
    add_column(:pedidos, :comissao_vendedor, :decimal, :precision => 3, :scale => 2)
  end
end
