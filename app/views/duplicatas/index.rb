Rwt::DbGridWindow.new({
  :model=> Duplicata,
  :controller=> RwtDuplicatasController,
  :title=> 'Duplicatas',
  :width=>350,
  :fields=>['plano_de_conta_id','tipo_cobranca','data_emissao', 'data_vencimento', 'valor', 'cliente_id', 'pedido_id', 'nome_devedor', 'devedor_id' ],
  :hideId=>true,
  :authenticity_token=> form_authenticity_token
})
