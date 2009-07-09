class PedidosDeAssistenciaController < ApplicationController

	# bem no metadata_for vai os campos que são symbol do @coisas dentro da interação do for,
	# para serem renderizados e retornados ao cliente, por exemplo id, valor, vendedor e cliente_nome.
  controller_crud_methods_for PedidoDeAssistencia, :metadata_for => ['id', 'tipo','cliente.razao_social','valor','data',], :includes => [ :cliente ]
=begin
  #Não precisa disso aqui!!!
def index
    @pedidos = Pedido.find(:all, :conditions => @conditions, :joins => :vendedor).paginate( :page => @page,
                                                                  :per_page => @per_page )
    @coisas = []
		#pedidos retorna um array de hash, então, faz-se um laço em pedido pegando apenas os campos que quer retorna para o lado client-side, para não ficar pesado demais.
    for p in @pedidos
			@coisas << {:id => p.id, :tipo => p.tipo, :cliente_nome => p.cliente.razao_social, :valor => p.valor, :data => p.data }
    end

    render_from_hash(@coisas)

  end
=end
end
