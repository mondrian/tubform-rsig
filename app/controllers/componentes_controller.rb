class ComponentesController < ApplicationController
  # GET /componentes
  # GET /componentes.xml
  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_componentes(params[:filter]).to_ext_json(:class=>:componente, :count => count(params[:fields])) }
    end
  end

  # GET /componentes/new
  # GET /componentes/new.xml
  def new
    @componente = Componente.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # GET /componentes/1/edit
  def edit
    @componente = Componente.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # POST /componentes
  # POST /componentes.xml
  def create
    @componente = Componente.new(params[:componente])
    respond_to do |format|
      format.js do
        if @componente.save
          rwt_ok
        else
          rwt_err_messages(@componente)
        end
      end
    end
  end

  # PUT /componentes/1
  # PUT /componentes/1.xml
  def update
    @componente = Componente.find(params[:id])
    respond_to do |format|
      format.js do
        if @componente.update_attributes(params[:componente])
          rwt_ok
        else
          rwt_err_messages(@componente)
        end
      end
    end
  end

  # DELETE /componentes/1
  # DELETE /componentes/1.xml
  def destroy
    @componente = Componente.find(params[:id])
    if @componente.destroy
      rwt_ok
    else
      rwt_err_messages(@componente)
    end
  end

  protected

  def find_classes(filter)
  	pagination_state = update_pagination_state_with_params!(:componente)
  	Componente.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
  end

  def count(filter)
	  if filter == nil or filter.empty? then
  		Componente.count
  	else
  		Componente.count(:conditions=>"first like '%#{filter}%'")
  	end
  end
end
