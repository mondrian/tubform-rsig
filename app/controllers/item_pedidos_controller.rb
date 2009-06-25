class ItemPedidosController < ApplicationController
  before_filter :load_produtos, :only => [:new, :edit, :create, :update]

  def detalhe
		begin
			@produto = Produto.find(params[:item_pedido_produto_id])
		rescue
			render :text => "Produto não encontrado"
		end
  end

  def index
    @item_pedidos = ItemPedido.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @item_pedidos }
    end
  end

  def show
    @item_pedido = ItemPedido.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @item_pedido }
    end
  end

  def new
    @item_pedido = ItemPedido.new
    @item_pedido.pedido_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_pedido }
    end
  end

  def edit
    @item_pedido = ItemPedido.find(params[:id])
  end

  def create
    @item_pedido = ItemPedido.new(params[:item_pedido])
    @item_pedido.valor_tabela = @item_pedido.produto.valor_normal

    respond_to do |format|
      if @item_pedido.save
        flash[:notice] = "Item adicionado com sucesso ao pedido."
        format.html { redirect_to(:controller => "pedidos", :action => "show", :id => @item_pedido.pedido_id ) }
        format.xml  { render :xml => @item_pedido, :status => :created, :location => @item_pedido }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_pedido.erros, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @item_pedido = ItemPedido.find(params[:id])
    respond_to do |format|
      if @item_pedido.update_attributes(params[:item_pedido])
        flash[:notice] = "Item atualizado com sucesso."
        format.html { redirect_to(:controller => "pedidos", :action => "show", :id => @item_pedido.pedido_id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_pedido.erros, :status => :unprocessable_entity }
      end
    end
  end

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
    @produtos = Produto.all.collect { |p| [p.descricao , p.id] }
  end
end

