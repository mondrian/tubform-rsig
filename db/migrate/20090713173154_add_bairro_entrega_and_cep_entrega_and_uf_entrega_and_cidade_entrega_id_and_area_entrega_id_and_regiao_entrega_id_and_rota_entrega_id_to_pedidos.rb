class AddBairroEntregaAndCepEntregaAndUfEntregaAndCidadeEntregaIdAndAreaEntregaIdAndRegiaoEntregaIdAndRotaEntregaIdToPedidos < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :bairro_entrega, :string
    add_column :pedidos, :cep_entrega, :string
    add_column :pedidos, :uf_entrega, :string
    add_column :pedidos, :cidade_entrega_id, :integer
    add_column :pedidos, :area_entrega_id, :integer
    add_column :pedidos, :regiao_entrega_id, :integer
    add_column :pedidos, :rota_entrega_id, :integer
  end

  def self.down
    remove_column :pedidos, :rota_entrega_id
    remove_column :pedidos, :regiao_entrega_id
    remove_column :pedidos, :area_entrega_id
    remove_column :pedidos, :cidade_entrega_id
    remove_column :pedidos, :uf_entrega
    remove_column :pedidos, :cep_entrega
    remove_column :pedidos, :bairro_entrega
  end
end
