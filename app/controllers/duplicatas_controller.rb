class DuplicatasController < ApplicationController
	# bem no metadata_for vai os campos que são symbol do @coisas dentro da interação do for, para serem renderizados e retornados ao cliente, por exemplo id, valor, vendedor e cliente_nome.
  controller_crud_methods_for Duplicata, :metadata_for => ['valor','data_emissao','data_vencimento']


def index
    @duplicatas = Duplicata.find(:all, :conditions => @conditions, :joins => :cliente).paginate( :page => @page,
                                                                  :per_page => @per_page )
    @coisas = []
		#pedidos retorna um array de hash, então, faz-se um laço em pedido pegando apenas os campos que quer retorna para o lado client-side, para não ficar pesado demais.
    for p in @duplicatas
			@coisas << {:id => p.id, :valor => p.valor, :data_emissao => p.data_emissao, :data_vencimento => p.data_vencimento}
    end

    render_from_hash(@coisas)

  end
end
