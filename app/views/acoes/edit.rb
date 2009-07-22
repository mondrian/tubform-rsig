Rwt::DbEditWindow.new(
  :model=> Acao,
  :title=>'Editando Ações',
  :height=>200,
  :width=>500,
  :controller=> Acao,
  :fields=>['controller_name','action_name'],
  :authenticity_token=> form_authenticity_token,
  :data => @acao,
  :id=>params[:id]
)
