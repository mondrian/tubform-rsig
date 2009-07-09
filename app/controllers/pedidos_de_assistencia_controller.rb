class PedidosDeAssistenciaController < ApplicationController
  # GET /pedidos_de_assistencia
  # GET /pedidos_de_assistencia.xml
  def index
    @pedidos_de_assistencia = PedidoDeAssistencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pedidos_de_assistencia }
    end
  end

  # GET /pedidos_de_assistencia/1
  # GET /pedidos_de_assistencia/1.xml
  def show
    @pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pedido_de_assistencia }
    end
  end

  # GET /pedidos_de_assistencia/new
  # GET /pedidos_de_assistencia/new.xml
  def new
    @pedido_de_assistencia = PedidoDeAssistencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pedido_de_assistencia }
    end
  end

  # GET /pedidos_de_assistencia/1/edit
  def edit
    @pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])
  end

  # POST /pedidos_de_assistencia
  # POST /pedidos_de_assistencia.xml
  def create
    @pedido_de_assistencia = PedidoDeAssistencia.new(params[:pedido_de_assistencia])

    respond_to do |format|
      if @pedido_de_assistencia.save
        flash[:notice] = 'Pedido Cadastrado com Sucesso'
        format.html { redirect_to(@pedido_de_assistencia) }
        format.xml  { render :xml => @pedido_de_assistencia, :status => :created, :location => @pedido_de_assistencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pedido_de_assistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pedidos_de_assistencia/1
  # PUT /pedidos_de_assistencia/1.xml
  def update
    @pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])

    respond_to do |format|
      if @pedido_de_assistencia.update_attributes(params[:pedido_de_assistencia])
        flash[:notice] = 'Pedido de Assistencia Atualizado com Sucesso'
        format.html { redirect_to(@pedido_de_assistencia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pedido_de_assistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos_de_assistencia/1
  # DELETE /pedidos_de_assistencia/1.xml
  def destroy
    @pedido_de_assistencia = PedidoDeAssistencia.find(params[:id])
    @pedido_de_assistencia.destroy

    respond_to do |format|
      format.html { redirect_to(pedidos_de_assistencia_url) }
      format.xml  { head :ok }
    end
  end
end
