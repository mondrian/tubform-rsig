Rwt::DbEditWindow.new(
  :model=> Acao,
  :title=>'Nova Ação',
  :height=>200,
  :width=>500,
  :fields=>['controller_name','action_name'],
  :controller=> RwtContactsController,
  :authenticity_token=> form_authenticity_token,
  :data => @acao
)

