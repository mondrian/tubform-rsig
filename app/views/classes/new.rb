Rwt::DbEditWindow.new(
  :model=> Classe,
  :title=>'New Classe',
  :height=>200,
  :width=>500,
  :fields=>['descricao'],
  :controller=> RwtClassesController,
  :authenticity_token=> form_authenticity_token,
  :data => @classe
)
