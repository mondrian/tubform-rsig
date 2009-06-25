class AddItemIdToProdutoKits < ActiveRecord::Migration
  def self.up
    add_column :produto_kits, :item_id, :integer
  end

  def self.down
    remove_column :produto_kits, :item_id
  end
end

