class AddCampoPercComissaoNoPedido < ActiveRecord::Migration
  def self.up
     add_column(:pedidos, :percentual_comissao, :decimal, :precision => 6, :scale => 2)
  end

  def self.down
    remove_column(:pedidos, :percentual_comissao)
  end
end
