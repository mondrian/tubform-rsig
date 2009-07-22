class ComponentesPedidoDeAssistenciaController < ApplicationController
   def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_omponentes_pedido_de_assistencia(params[:filter]).to_ext_json(:class=>:componentes_pedido_de_assistencia, :count => count(params[:fields])) }
    end
  end

  def new
    @componentes_pedido_de_assistencia = Componentes_pedido_de_assistencia.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end


  def edit
    @componentes_pedido_de_assistencia = Componentes_pedido_de_assistencia.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  def create
    @componentes_pedido_de_assistencia = Componentes_pedido_de_assistencia.new(params[:contact])
    respond_to do |format|
      format.js do
        if @componentes_pedido_de_assistencia.save
          rwt_ok
        else
          rwt_err_messages(@componentes_pedido_de_assistencia)
        end
      end
    end
  end
 
  def update
    @componente_pedido_de_assistencia = Componente_pedido_de_assistencia.find(params[:id])
    respond_to do |format|
      format.js do
        if @componente_pedido_de_assistencia.update_attributes(params[:componente_pedido_de_assistencia])
          rwt_ok
        else
          rwt_err_messages(@componente_pedido_de_assistencia)
        end
      end
    end
  end

 def destroy
    @componente_pedido_de_assistencia = Componente_pedido_de_assistencia.find(params[:id])
    if @componente_pedido_de_assistencia.destroy
      rwt_ok
    else
      rwt_err_messages(@componente_pedido_de_assistencia)
    end
  end


  protected

    def find_componente_pedido_de_assistencia(filter)
      pagination_state = update_pagination_state_with_params!(:componente_pedido_de_assistencia)
      Componente_pedido_de_assistencia.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
    end

    def count(filter)
      if filter == nil or filter.empty? then
         Componente_pedido_de_assistencia.count
      else
         Componente_pedido_de_assistencia.count(:conditions=>"first like '%#{filter}%'")
      end
    end
end
