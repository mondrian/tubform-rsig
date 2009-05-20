class ItemPedidosController < ApplicationController
  before_filter :load_produtos, :only => [:new, :edit, :create, :update]
  # GET /item_pedidos
  # GET /item_pedidos.xml
  def index
    @item_pedidos = ItemPedido.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @item_pedidos }
    end
  end

  # GET /item_pedidos/1
  # GET /item_pedidos/1.xml
  def show
    @item_pedido = ItemPedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @item_pedido }
    end
  end

  # GET /item_pedidos/new
  # GET /item_pedidos/new.xml
  def new
    @item_pedido = ItemPedido.new
    @item_pedido.pedido_id = params[:id]


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_pedido }
    end
  end

  # GET /item_pedidos/1/edit
  def edit
    @item_pedido = ItemPedido.find(params[:id])
  end

  # POST /item_pedidos
  # POST /item_pedidos.xml
  def create
    @item_pedido = ItemPedido.new(params[:item_pedido])
    @item_pedido.valor_tabela = @item_pedido.produto.valor_normal

    respond_to do |format|
      if @item_pedido.save
        flash[:notice] = "ItemPedido criado com sucesso."
        format.html { redirect_to(:controller => "pedidos", :action => "show", :id => @item_pedido.pedido_id ) }
        format.xml  { render :xml => @item_pedido, :status => :created, :location => @item_pedido }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_pedido.erros, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_pedidos/1
  # PUT /item_pedidos/1.xml
  def update
    @item_pedido = ItemPedido.find(params[:id])

    respond_to do |format|
      if @item_pedido.update_attributes(params[:item_pedido])
        flash[:notice] = "ItemPedido atualizado com sucesso."
        format.html { redirect_to(:controller => "pedidos", :action => "show", :id => @item_pedido.pedido_id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_pedido.erros, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_pedidos/1
  # DELETE /item_pedidos/1.xml
  def destroy
    @item_pedido = ItemPedido.find(params[:id])
    @item_pedido.destroy

    respond_to do |format|
      format.html { redirect_to(item_pedidos_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def load_produtos
    @produtos = Produto.all.collect { |p| [p.descricao + ' -  R$ ' + p.valor_normal.to_s , p.id] }
  end
end
