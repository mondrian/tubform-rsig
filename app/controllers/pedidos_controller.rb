class PedidosController < ApplicationController
  controller_crud_methods_for Pedido, :metadata_for => ['tipo, data, cliente_id, valor, status']
end