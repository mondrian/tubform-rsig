Rwt::DbGridWindow.new({
  :model=> Contra_partida,
  :controller=> RwtContactsController,
  :title=> 'Listando Contra Partidas',
  :width=>350,
  :fields=>['lancamento_id','plano_de_conta_id','duplicata_id', 'valor_lancamento', 'tipo_operacao', 'historico', ],
  :hideId=>true,
  :authenticity_token=> form_authenticity_token
})
