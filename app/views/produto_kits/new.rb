Rwt::DbEditWindow.new(
  :model=> ProdutoKit,
  :title=>'Novo Produto Kit',
  :height=>200,
  :width=>500,
  :fields=>['produto_id','empresa_id','fator_conversao','status','preco_normal','preco_especial'],
  :controller=> ProdutoKitsController,
  :authenticity_token=> form_authenticity_token,
  :data => @produto_kit
)
