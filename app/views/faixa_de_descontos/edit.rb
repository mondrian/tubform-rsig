Rwt::DbEditWindow.new(
  :model=> FaixaDeDesconto,
  :title=>'Change in Faixa De Desconto',
  :height=>200,
  :width=>500,
  :controller=> RwtFaixaDeDescontosController,
  :fields=>['de','ate','desconto_permitido'],
  :authenticity_token=> form_authenticity_token,
  :data => @faixa_de_desconto,
  :id=>params[:id]
)
