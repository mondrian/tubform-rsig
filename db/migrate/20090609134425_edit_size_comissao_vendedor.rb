class EditSizeComissaoVendedor < ActiveRecord::Migration
  def self.up
    remove_columns(:pedidos, :comissao_vendedor, :comissao_telemarketing)
    add_column :pedidos, :comissao_vendedor, :decimal, :precision => 6, :scale => 2
    add_column :pedidos, :comissao_telemarketing, :decimal, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :pedidos, :comissao_vendedor, :comissao_telemarketing
    add_column :pedidos, :comissao_vendedor, :decimal, :precision => 5, :scale => 2
    add_column :pedidos, :comissao_telemarketing, :decimal, :precision => 3, :scale => 2
  end
end
