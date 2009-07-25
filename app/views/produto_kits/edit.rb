Rwt::DbEditWindow.new(
  :model=> ProdutoKit,
  :title=>'Editar Produto Kit',
  :height=>200,
  :width=>500,
  :controller=> ProdutoKitsController,
  :fields=>['produto_id','empresa_id','fator_conversao','status','preco_normal','preco_especial'],
  :authenticity_token=> form_authenticity_token,
  :data => @produto_kit,
  :id=>params[:id]
)
