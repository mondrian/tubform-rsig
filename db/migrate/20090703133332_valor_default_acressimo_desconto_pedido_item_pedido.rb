class ValorDefaultAcressimoDescontoPedidoItemPedido < ActiveRecord::Migration
	def self.up
		change_column_default(:pedidos, :acrescimo, 0)
		change_column_default(:item_pedidos, :desconto, 0)
		change_column_default(:pedidos, :desconto, 0)
		change_column_default(:pedidos, :valor, 0)
		change_column_default(:pedidos, :desconto_complementar, 0)
		change_column_default(:pedidos, :percentual_comissao, 0)
		change_column_default(:pedidos, :comissao_vendedor, 0)
		change_column_default(:pedidos, :comissao_telemarketing, 0)
		change_column_default(:pedidos, :valor_normal, 0)
	end

	def self.down
	  change_column(:pedidos, :acrescimo, :decimal, :precision => 3,  :scale => 2)
	  change_column(:pedidos, :desconto, :decimal)
	  change_column(:pedidos, :valor, :decimal, :precision => 6,  :scale => 2)
	  change_column(:pedidos, :desconto_complementar, :decimal, :precision => 6,  :scale => 2)
	  change_column(:pedidos, :percentual_comissao, :decimal, :precision => 6,  :scale => 2)
	  change_column(:pedidos, :comissao_vendedor, :decimal, :precision => 6,  :scale => 2)
	  change_column(:pedidos, :comissao_telemarketing, :decimal, :precision => 6,  :scale => 2)
	  change_column(:pedidos, :valor_normal, :decimal,:precision => 12, :scale => 2)
	  change_column(:item_pedidos, :desconto, :decimal)
  end
end
