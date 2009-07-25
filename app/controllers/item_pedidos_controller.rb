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
     @itens_nota_fiscal = ItemNotaFiscal.paginate( :page => @page,
                              :per_page => @per_page)

     respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.erb
      format.json { render :json => {
                             :metaData => {
                               :totalProperty => 'total',
                               :root => 'results',
                               :id => 'id',
                               :fields => [
                                 { :name => 'id', :mapping => 'id' },
                                 { :name => 'produto_id', :mapping => 'produto_id' }      
                                 { :name => 'quantidade', :mapping => 'quantidade' }      
                                 { :name => 'valor_item', :mapping => 'valor_item' }      
                                 { :name => 'perc_icms', :mapping => 'perc_icms' }      
                                 { :name => 'perc_ipi', :mapping => 'perc_ipi' }                                    
                               ]
                             },
                             :results => @itens_nota_fiscal,
                             :total => @itens_nota_fiscal.total_entries
                           }.to_json(:include => [ ])
                  }
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

  def load_grupo
    @item_pedido = params[:id].blank? ? ItemNotaFiscal.new : ItemNotaFiscal.find(params[:id])
  end

  def create_or_update
    if @item_pedido.update_attributes(params[:item_pedido])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
                                        :results => @item_pedido
                                      },
                             :status => :created,
                             :location => @item_pedido
                    }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @item_pedido.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
                                        :errors => @errors
                                      },
                             :location => @item_pedido,
                             :status => :unprocessable_entity
                    }

    end
  end

  def destroy
    @item_pedido = ItemPedido.find(params[:id])
    @item_pedido.destroy
    respond_to do |format|
      format.html { redirect_to(:back) }
    end
  end

  protected
  def load_produtos
    @produtos = Produto.all.collect { |p| [p.descricao , p.id] }
  end
end

