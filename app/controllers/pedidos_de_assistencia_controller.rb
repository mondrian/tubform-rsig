class PedidosDeAssistenciaController < ApplicationController

  # GET /pedidos_de_assistencia
  # GET /pedidos_de_assistencia.xml

  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_pedidos_de_assistencia(params[:filter]).to_ext_json(:class=>:pedido_de_assistencia, :count => count(params[:fields])) }
    end
  end


  # GET /pedidos_de_assistencia/1
  # GET /pedidos_de_assistencia/1.xml
  def show
    @pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @pedido_de_assistencia }
    end
  end

  # GET /pedidos_de_assistencia/new
  # GET /pedidos_de_assistencia/new.xml
  def new
    @pedido_de_assistencia = PedidoDeAssistencia.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end


  # GET /pedidos_de_assistencia/1/edit
  def edit
    @pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # POST /pedidos_de_assistencia
  # POST /pedidos_de_assistencia.xml

  def create
    @pedido_de_assistencia = PedidoDeAssistencia.new(params[:pedido_de_assistencia])
    respond_to do |format|
      format.js do
        if @pedido_de_assistencia.save
          rwt_ok
        else
          rwt_err_messages(@pedido_de_assistencia)
        end
      end
    end
  end


  # PUT /pedidos_de_assistencia/1
  # PUT /pedidos_de_assistencia/1.xml
  def update
    @pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])
    respond_to do |format|
      format.js do
        if @pedido_de_assistencia.update_attributes(params[:pedido_de_assistencia])
          rwt_ok
        else
          rwt_err_messages(@pedido_de_assistencia)
        end
      end
    end
  end


  # DELETE /pedidos_de_assistencia/1
  # DELETE /pedidos_de_assistencia/1.xml
  def destroy
    @pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])
    if @pedido_de_assistencia.destroy
      rwt_ok
    else
      rwt_err_messages(@pedido_de_assistencia)
    end
  end

  protected

    def find_pedidos_de_assistencia(filter)
      pagination_state = update_pagination_state_with_params!(:pedido_de_assistencia)
      PedidoDeAssistencia.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["id = ?","#{filter}"]))
    end

    def count(filter)
      if filter == nil or filter.empty? then
         PedidoDeAssistencia.count
      else
         PedidoDeAssistencia.count(:conditions=>"id = '#{filter}'")
      end
    end
end
