Rwt::DbGridWindow.new({
  :model=> ProdutoKit,
  :controller=> ProdutoKitsController,
  :title=> 'Produtos Kit',
  :width=>350,
  :fields=>['id','produto_id','empresa_id','fator_conversao','status','preco_normal','preco_especial'],
  :hideId=>false,
  :authenticity_token=> form_authenticity_token
})
