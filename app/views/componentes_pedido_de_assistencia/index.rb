Rwt::DbGridWindow.new({
  :model=> Componentes_pedido_de_assistencia,
  :controller=> componentes_pedido_de_assistencia,
  :title=> 'Listando Componentes pedido de assistencia',
  :width=>350,
  :fields=>['pedido_id','produto','quantidade', 'valor', 'sequencia_movimento', 'emite_relatorio', 'produto_id', 'justificativa', 'motivo_id', 'componentes'],
  :hideId=>true,
  :authenticity_token=> form_authenticity_token
})
