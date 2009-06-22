class AddDataExtornoIdentVendaTotalDesconto < ActiveRecord::Migration
  def self.up
    add_column :pedidos, :data_estorno, :date
    add_column :pedidos, :identificador_venda, :string, :limit => 1
    add_column :pedidos, :total_desconto_item, :decimal, :precision => 12, :scale => 2, :default => 0
  end

  def self.down
    remove_column :pedidos, :data_estorno, :identificador_venda, :desconto_item
  end
end