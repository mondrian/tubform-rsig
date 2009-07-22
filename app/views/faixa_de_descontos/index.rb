Rwt::DbGridWindow.new({
  :model=> FaixaDeDesconto,
  :controller=> RwtFaixaDeDescontosController,
  :title=> 'FaixaDeDescontos',
  :width=>350,
  :fields=>['de','ate','desconto_permitido'],
  :hideId=>true,
  :authenticity_token=> form_authenticity_token
})
