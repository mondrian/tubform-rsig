class PedidosController < ApplicationController
	
	# bem no metadata_for vai os campos que são symbol do @coisas dentro da interação do for, para serem renderizados e retornados ao cliente, por exemplo id, valor, vendedor e cliente_nome.
  controller_crud_methods_for Pedido, :metadata_for => ['valor','vendedor','cliente_nome']


def index
    @pedidos = Pedido.find(:all, :conditions => @conditions, :joins => :vendedor).paginate( :page => @page,
                                                                  :per_page => @per_page )
    @coisas = []
		#pedidos retorna um array de hash, então, faz-se um laço em pedido pegando apenas os campos que quer retorna para o lado client-side, para não ficar pesado demais.
    for p in @pedidos
			@coisas << {:id => p.id, :valor => p.valor, :vendedor => p.vendedor.nome, :cliente_nome => p.cliente.razao_social}
    end

    render_from_hash(@coisas)

  end
end
