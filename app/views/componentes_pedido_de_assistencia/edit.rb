Rwt::DbEditWindow.new(
  :model=> Componentes_pedido_de_assistencia,
  :title=>'Editando Componentes_pedido_de_assistencia',
  :height=>200,
  :width=>500,
  :controller=> RwtContactsController,
  :fields=>['pedido_id','produto','quantidade', 'valor', 'sequencia_movimento', 'emite_relatorio', 'produto_id', 'justificativa', 'motivo_id', 'componente' ],
  :authenticity_token=> form_authenticity_token,
  :data => @componentes_pedido_de_assistencia,
  :id=>params[:id]
)
    
