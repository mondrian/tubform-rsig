class ItemPedidoKit < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto_kit
end
