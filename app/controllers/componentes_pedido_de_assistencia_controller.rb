class ComponentesPedidoDeAssistenciaController < ApplicationController
  # GET /componentes_pedido_de_assistencia
  # GET /componentes_pedido_de_assistencia.xml
  def index
    @componentes_pedido_de_assistencia = ComponentePedidoDeAssistencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @componentes_pedido_de_assistencia }
    end
  end

  # GET /componentes_pedido_de_assistencia/1
  # GET /componentes_pedido_de_assistencia/1.xml
  def show
    @componente_pedido_de_assistencia = ComponentePedidoDeAssistencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @componente_pedido_de_assistencia }
    end
  end

  # GET /componentes_pedido_de_assistencia/new
  # GET /componentes_pedido_de_assistencia/new.xml
  def new
    @componente_pedido_de_assistencia = ComponentePedidoDeAssistencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @componente_pedido_de_assistencia }
    end
  end

  # GET /componentes_pedido_de_assistencia/1/edit
  def edit
    @componente_pedido_de_assistencia = ComponentePedidoDeAssistencia.find(params[:id])
  end

  # POST /componentes_pedido_de_assistencia
  # POST /componentes_pedido_de_assistencia.xml
  def create
    @componente_pedido_de_assistencia = ComponentePedidoDeAssistencia.new(params[:componente_pedido_de_assistencia])

    respond_to do |format|
      if @componente_pedido_de_assistencia.save
        flash[:notice] = 'ComponentePedidoDeAssistencia was successfully created.'
        format.html { redirect_to(@componente_pedido_de_assistencia) }
        format.xml  { render :xml => @componente_pedido_de_assistencia, :status => :created, :location => @componente_pedido_de_assistencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @componente_pedido_de_assistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /componentes_pedido_de_assistencia/1
  # PUT /componentes_pedido_de_assistencia/1.xml
  def update
    @componente_pedido_de_assistencia = ComponentePedidoDeAssistencia.find(params[:id])

    respond_to do |format|
      if @componente_pedido_de_assistencia.update_attributes(params[:componente_pedido_de_assistencia])
        flash[:notice] = 'ComponentePedidoDeAssistencia was successfully updated.'
        format.html { redirect_to(@componente_pedido_de_assistencia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @componente_pedido_de_assistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /componentes_pedido_de_assistencia/1
  # DELETE /componentes_pedido_de_assistencia/1.xml
  def destroy
    @componente_pedido_de_assistencia = ComponentePedidoDeAssistencia.find(params[:id])
    @componente_pedido_de_assistencia.destroy

    respond_to do |format|
      format.html { redirect_to(componentes_pedido_de_assistencia_url) }
      format.xml  { head :ok }
    end
  end
end
