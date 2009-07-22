Rwt::DbEditWindow.new(
  :model=> Contact,
  :title=>'Editando Duplicata',
  :height=>300,
  :width=>700,
  :controller=> dulpicata,
  :fields=>['plano_de_conta_id','tipo_cobranca','data_emissao', 'data_vencimento', 'valor', 'cliente_id', 'pedido_id', 'nome_devedor', 'devedor_id' ],
  :authenticity_token=> form_authenticity_token,
  :data => @duplicatas,
  :id=>params[:id]
)
