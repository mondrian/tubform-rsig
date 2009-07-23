Rwt::DbEditWindow.new(
  :model=> FaixaDeDesconto,
  :title=>'New FaixaDeDesconto',
  :height=>200,
  :width=>500,
  :fields=>['de','ate','desconto_permitido'],
  :controller=> RwtFaixaDeDescontosController,
  :authenticity_token=> form_authenticity_token,
  :data => @faixa_de_desconto
)
