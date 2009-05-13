class PedidosController < ApplicationController
  # GET /pedidos
  # GET /pedidos.xml
  def selecionar_cliente
    if request.post?
      @cliente = Cliente.find(params[:cliente][:id])
      if @cliente
        redirect_to :action => :new, :id => @cliente.id
      end
    else
      @cliente = Cliente.new
    end
  end

  def index
    @pedidos = Pedido.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pedidos }
    end
  end

  # GET /pedidos/1
  # GET /pedidos/1.xml
  def show
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pedido }
    end
  end

  # GET /pedidos/new
  # GET /pedidos/new.xml
  def new
    @pedido = Pedido.new
    @pedido.cliente = Cliente.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pedido }
    end
  end

  # GET /pedidos/1/edit
  def edit
    @pedido = Pedido.find(params[:id])
  end

  # POST /pedidos
  # POST /pedidos.xml
  def create
    @pedido = Pedido.new(params[:pedido])

    respond_to do |format|
      if @pedido.save
        flash[:notice] = 'Pedido was successfully created.'
        format.html { redirect_to(@pedido) }
        format.xml  { render :xml => @pedido, :status => :created, :location => @pedido }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pedidos/1
  # PUT /pedidos/1.xml
  def update
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      if @pedido.update_attributes(params[:pedido])
        flash[:notice] = 'Pedido was successfully updated.'
        format.html { redirect_to(@pedido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.xml
  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to(pedidos_url) }
      format.xml  { head :ok }
    end
  end
end
