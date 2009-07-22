Rwt::DbGridWindow.new({
  :model=> Acao,
  :controller=> RwtContactsController,
  :title=> 'Ações',
  :width=>350,
  :fields=>['controller_name','action_name'],
  :hideId=>true,
  :authenticity_token=> form_authenticity_token
})
