class CreateItemPedidoKits < ActiveRecord::Migration
  def self.up
    create_table :item_pedido_kits do |t|
      t.integer :pedido_id
      t.decimal :quantidade
      t.decimal :valor_tabela
      t.decimal :valor_venda
      t.decimal :desconto
      t.integer :produto_id
      t.integer :produto_kit

      t.timestamps
    end
  end

  def self.down
    drop_table :item_pedido_kits
  end
end
