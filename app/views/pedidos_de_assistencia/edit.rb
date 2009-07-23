Rwt::DbEditWindow.new(
  :model=> PedidoDeAssistencia,
  :title=>'Editar Pedido de Assistencia',
  :height=>200,
  :width=>500,
  :controller=> PedidosDeAssistenciaController,
  :fields=>['tipo','cliente_id','nosso_numero','data','previsao_entrega','entrega','programacao','plano_de_pagamento','vendedor_id','valor','transportadora_id','nome_comprador','observacao','endereco_entrega','minuta_id','area_id','telemarketing_id','registro','empresa_id','status','status_estorno','operador_estorno_id','venda_externa','autorizador_id'],
  :authenticity_token=> form_authenticity_token,
  :data => @pedido_de_assistencia,
  :id=>params[:id]
)
