Rwt::DbGridWindow.new({
  :model=> Classe,
  :controller=> RwtClassesController,
  :title=> 'Classes',
  :width=>350,
  :fields=>['descricao'],
  :hideId=>true,
  :authenticity_token=> form_authenticity_token
})
