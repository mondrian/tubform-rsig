Rwt::DbEditWindow.new(
  :model=> Componente,
  :title=>'New Componente',
  :height=>200,
  :width=>500,
  :fields=>['descricao','altura','largura','espessura','percentual_de_perda','tamanho_chapa','cor_id','manufatura',
						'quantidade_lote','coladeira','furadeira','pintura','embalagem','produto_elaborado','valor_metro_quadrado',
						'valor_componente','ativo','componente_terceiro','usinagem','serraria','materia_prima_id','grupo_componente_id'],
  :controller=> RwtComponentesController,
  :authenticity_token=> form_authenticity_token,
  :data => @componente
)
