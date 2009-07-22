Rwt::DbEditWindow.new(
  :model=> Duplicata,
  :title=>'New Duplicata',
  :height=>200,
  :width=>500,
  :fields=>['plano_de_conta_id','tipo_cobranca','data_emissao', 'data_vencimento', 'valor', 'cliente_id', 'pedido_id', 'nome_devedor', 'devedor_id' ],
  :controller=> RwtDuplicatasController,
  :authenticity_token=> form_authenticity_token,
  :data => @duplicata
)
