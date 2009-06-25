class CreateItemPedidos < ActiveRecord::Migration
  def self.up
    create_table :item_pedidos do |t|
      t.integer :kit_id
      t.decimal :quantidade
      t.decimal :valor_tabela
      t.decimal :valor_venda
      t.decimal :desconto

      t.timestamps
    end
  end

  def self.down
    drop_table :item_pedidos
  end
end
