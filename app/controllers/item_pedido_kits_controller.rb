class ItemPedidoKitsController < ApplicationController
  # GET /item_pedido_kits
  # GET /item_pedido_kits.xml
  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_item_pedido_kits(params[:filter]).to_ext_json(:class=>:item_pedido_kit, :count => count(params[:fields])) }
    end
  end

  # GET /item_pedido_kits/new
  # GET /item_pedido_kits/new.xml
  def new
    @item_pedido_kit = ItemPedidoKit.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # GET /item_pedido_kits/1/edit
  def edit
    @item_pedido_kit = ItemPedidoKit.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # POST /item_pedido_kits
  # POST /item_pedido_kits.xml
  def create
    @item_pedido_kit = ItemPedidoKit.new(params[:item_pedido_kit])
    respond_to do |format|
      format.js do
        if @item_pedido_kit.save
          rwt_ok
        else
          rwt_err_messages(@item_pedido_kit)
        end
      end
    end
  end

  # PUT /item_pedido_kits/1
  # PUT /item_pedido_kits/1.xml
  def update
    @item_pedido_kit = ItemPedidoKit.find(params[:id])
    respond_to do |format|
      format.js do
        if @item_pedido_kit.update_attributes(params[:item_pedido_kit])
          rwt_ok
        else
          rwt_err_messages(@item_pedido_kit)
        end
      end
    end
  end

  # DELETE /item_pedido_kits/1
  # DELETE /item_pedido_kits/1.xml
  def destroy
    @item_pedido_kit = ItemPedidoKit.find(params[:id])
    if @item_pedido_kit.destroy
      rwt_ok
    else
      rwt_err_messages(@item_pedido_kit)
    end
  end


  protected

  def find_item_pedido_kits(filter)
  	pagination_state = update_pagination_state_with_params!(:item_pedido_kit)
  	ItemPedidoKit.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
  end

  def count(filter)
	  if filter == nil or filter.empty? then
  		ItemPedidoKit.count
  	else
  		ItemPedidoKit.count(:conditions=>"first like '%#{filter}%'")
  	end
  end
end
