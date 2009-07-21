Rwt::DbEditWindow.new(
  :model=> Contra_partida,
  :title=>'Nova Contra Partida',
  :height=>200,
  :width=>500,
  :fields=>['lancamento_id','plano_de_conta_id','duplicata_id', 'valor_lancamento', 'tipo_operacao', 'historico', ],
  :controller=> RwtContactsController,
  :authenticity_token=> form_authenticity_token,
  :data => @contra_partida
)

