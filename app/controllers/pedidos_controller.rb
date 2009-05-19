class PedidosController < ApplicationController
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

  def show
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pedido }
    end
  end

  def new
    @pedido = Pedido.new
    @pedido.cliente = Cliente.find(:first)
    @pedido.cliente = Cliente.find(:first)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pedido }
    end
  end

  def edit
    @pedido = Pedido.find(params[:id])
  end

  def create
    @pedido = Pedido.new(params[:pedido])

    respond_to do |format|
      if @pedido.save
        flash[:notice] = 'Pedido Cadastrado com Sucesso'
        format.html { redirect_to(@pedido) }
        format.xml  { render :xml => @pedido, :status => :created, :location => @pedido }
      else
        flash[:notice] = @pedido.errors
        format.html { render :action => "new" }
        format.xml  { render :xml => @pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      if @pedido.update_attributes(params[:pedido])
        flash[:notice] = 'Pedido atualizado com Sucesso!'
        format.html { redirect_to(@pedido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to(pedidos_url) }
      format.xml  { head :ok }
    end
  end

  def aprovar
    @pedido = Pedido.find(params[:id])
    @pedido.aprovar
    respond_to do |format|
      if @pedido.save
        flash[:notice] = 'Pedido confirmado com sucesso.'
        format.html { redirect_to(@pedido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pedido.errors,
                             :status => :unprocessable_entity }
      end
    end
  end
end
