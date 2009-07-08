class PedidosController < ApplicationController
  controller_crud_methods_for Pedido, :metadata_for => ['tipo',
                                                        'cliente.razao_social',
                                                        'valor',
                                                        'data'],
                                      :includes => [ :cliente ]
end