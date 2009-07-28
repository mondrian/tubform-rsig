Rwt::DbEditWindow.new(
  :model=> Lancamento,
  :title=>'New Lancamento',
  :height=>200,
  :width=>500,
  :fields=>['tipo_operacao','plano_de_conta_id','historico','data_movimento','data_lancamento','doc_origem','valor',
'nome_cheque','operador_id','serie_doc_origem','banco_id','cliente_id','imprimiu_op','vendedor_id','sequencia_movimento'],
  :controller=> RwtLancamentosController,
  :authenticity_token=> form_authenticity_token,
  :data => @lancamento
)
