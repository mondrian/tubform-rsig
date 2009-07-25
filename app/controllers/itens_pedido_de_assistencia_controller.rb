class ItensPedidoDeAssistenciaController < ApplicationController
  before_filter :load_produtos, :only => [:new, :edit, :create, :update]

  # GET /itens_pedido_de_assistencia
  # GET /itens_pedido_de_assistencia.xml
  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_item_pedido_de_assistencias(params[:filter]).to_ext_json(:class=>:item_pedido_de_assistencia, :count => count(params[:fields])) }
    end
  end

  # GET /itens_pedido_de_assistencia/new
  # GET /itens_pedido_de_assistencia/new.xml
  def new
    @item_pedido_de_assistencia = PedidoDeAssistencia.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # GET /itens_pedido_de_assistencia/1/edit
  def edit
    @item_pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # POST /itens_pedido_de_assistencia
  # POST /itens_pedido_de_assistencia.xml
  def create
    @item_pedido_de_assistencia = PedidoDeAssistencia.new(params[:item_pedido_de_assistencia])
    respond_to do |format|
      format.js do
        if @item_pedido_de_assistencia.save
          rwt_ok
        else
          rwt_err_messages(@item_pedido_de_assistencia)
        end
      end
    end
  end

  # PUT /itens_pedido_de_assistencia/1
  # PUT /itens_pedido_de_assistencia/1.xml
  def update
    @item_pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])
    respond_to do |format|
      format.js do
        if @item_pedido_de_assistencia.update_attributes(params[:item_pedido_de_assistencia])
          rwt_ok
        else
          rwt_err_messages(@item_pedido_de_assistencia)
        end
      end
    end
  end

  # DELETE /itens_pedido_de_assistencia/1
  # DELETE /itens_pedido_de_assistencia/1.xml
  def destroy
    @item_pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])
    if @item_pedido_de_assistencia.destroy
      rwt_ok
    else
      rwt_err_messages(@item_pedido_de_assistencia)
    end
  end


	def usando_o_componente
		if params[:usa_componente] == 'true' and !params[:produto_id].nil?
		  sql = "select * from fnc_consultar_componentes_do_produto(#{'31'})"
			@exibeformcomponentes = Produto.find_by_sql(sql)
		else
			render :nothing => true
		end
	end

	# vai pegar os componentes e as quantidade de cada produto/componente
	def iterando_nos_componente_enviados
		quantidade = params[:produto_quantidade]
		i = 1
		for i in quantidade.to_i do
			@componentesenviados << Produto.all(params[:exibeformcomponente_id])
		end
	end

  protected
  def load_produtos
    @produtos = Produto.all.collect { |p| [p.descricao , p.id] }
  end


  def find_item_pedido_de_assistencias(filter)
  	pagination_state = update_pagination_state_with_params!(:item_pedido_de_assistencia)
  	PedidoDeAssistencia.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
  end

  def count(filter)
	  if filter == nil or filter.empty? then
  		PedidoDeAssistencia.count
  	else
  		PedidoDeAssistencia.count(:conditions=>"first like '%#{filter}%'")
  	end
  end

end
