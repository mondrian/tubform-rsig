class ItensPedidoDeAssistenciaController < ApplicationController
  before_filter :load_produtos, :only => [:new, :edit, :create, :update]

  # GET /itens_pedido_de_assistencia
  # GET /itens_pedido_de_assistencia.xml
  def index
    @itens_pedido_de_assistencia = ItemPedidoDeAssistencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @itens_pedido_de_assistencia }
    end
  end

  # GET /itens_pedido_de_assistencia/1
  # GET /itens_pedido_de_assistencia/1.xml
  def show
    @item_pedido_de_assistencia = ItemPedidoDeAssistencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_pedido_de_assistencia }
    end
  end

  # GET /itens_pedido_de_assistencia/new
  # GET /itens_pedido_de_assistencia/new.xml
  def new
    @item_pedido_de_assistencia = ItemPedidoDeAssistencia.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_pedido_de_assistencia }
    end
  end

  # GET /itens_pedido_de_assistencia/1/edit
  def edit
    @item_pedido_de_assistencia = ItemPedidoDeAssistencia.find(params[:id])
  end

  # POST /itens_pedido_de_assistencia
  # POST /itens_pedido_de_assistencia.xml
  def create
    @item_pedido_de_assistencia = ItemPedidoDeAssistencia.new(params[:item_pedido_de_assistencia])
		
    respond_to do |format|
      if @item_pedido_de_assistencia.save
        flash[:notice] = 'ItemPedidoDeAssistencia was successfully created.'
        format.html { redirect_to(@item_pedido_de_assistencia) }
        format.xml  { render :xml => @item_pedido_de_assistencia, :status => :created, :location => @item_pedido_de_assistencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_pedido_de_assistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /itens_pedido_de_assistencia/1
  # PUT /itens_pedido_de_assistencia/1.xml
  def update
    @item_pedido_de_assistencia = ItemPedidoDeAssistencia.find(params[:id])

    respond_to do |format|
      if @item_pedido_de_assistencia.update_attributes(params[:item_pedido_de_assistencia])
        flash[:notice] = 'ItemPedidoDeAssistencia was successfully updated.'
        format.html { redirect_to(@item_pedido_de_assistencia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_pedido_de_assistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /itens_pedido_de_assistencia/1
  # DELETE /itens_pedido_de_assistencia/1.xml
  def destroy
    @item_pedido_de_assistencia = ItemPedidoDeAssistencia.find(params[:id])
    @item_pedido_de_assistencia.destroy

    respond_to do |format|
      format.html { redirect_to(itens_pedido_de_assistencia_url) }
      format.xml  { head :ok }
    end
  end

	def usando_o_componente
		@exibeformcomponentes = Produto.all(params[:produto_id])
	end

  protected
  def load_produtos
    @produtos = Produto.all.collect { |p| [p.descricao , p.id] }
  end

end
