Rwt::DbEditWindow.new(
  :model=> Componentes_pedido_de_assistencia,
  :title=>'Novo Componentes pedido de assistencia',
  :height=>200,
  :width=>500,
 :fields=>['pedido_id','produto','quantidade', 'valor', 'sequencia_movimento', 'emite_relatorio', 'produto_id', 'justificativa', 'motivo_id', 'componentes'],
  :controller=> RwtContactsController,
  :authenticity_token=> form_authenticity_token,
  :data => @componentes_pedido_de_assistencia
)
