class PedidosController < ApplicationController
  controller_crud_methods_for Pedido, :metadata_for => ['valor']
end
