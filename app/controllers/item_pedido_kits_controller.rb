class ItemPedidoKitsController < ApplicationController
  # GET /item_pedido_kits
  # GET /item_pedido_kits.xml
  def index
    @item_pedido_kits = ItemPedidoKit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_pedido_kits }
    end
  end

  # GET /item_pedido_kits/1
  # GET /item_pedido_kits/1.xml
  def show
    @item_pedido_kit = ItemPedidoKit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_pedido_kit }
    end
  end

  # GET /item_pedido_kits/new
  # GET /item_pedido_kits/new.xml
  def new
    @item_pedido_kit = ItemPedidoKit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_pedido_kit }
    end
  end

  # GET /item_pedido_kits/1/edit
  def edit
    @item_pedido_kit = ItemPedidoKit.find(params[:id])
  end

  # POST /item_pedido_kits
  # POST /item_pedido_kits.xml
  def create
    @item_pedido_kit = ItemPedidoKit.new(params[:item_pedido_kit])

    respond_to do |format|
      if @item_pedido_kit.save
        flash[:notice] = 'ItemPedidoKit was successfully created.'
        format.html { redirect_to(@item_pedido_kit) }
        format.xml  { render :xml => @item_pedido_kit, :status => :created, :location => @item_pedido_kit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_pedido_kit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_pedido_kits/1
  # PUT /item_pedido_kits/1.xml
  def update
    @item_pedido_kit = ItemPedidoKit.find(params[:id])

    respond_to do |format|
      if @item_pedido_kit.update_attributes(params[:item_pedido_kit])
        flash[:notice] = 'ItemPedidoKit was successfully updated.'
        format.html { redirect_to(@item_pedido_kit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_pedido_kit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_pedido_kits/1
  # DELETE /item_pedido_kits/1.xml
  def destroy
    @item_pedido_kit = ItemPedidoKit.find(params[:id])
    @item_pedido_kit.destroy

    respond_to do |format|
      format.html { redirect_to(item_pedido_kits_url) }
      format.xml  { head :ok }
    end
  end
end
