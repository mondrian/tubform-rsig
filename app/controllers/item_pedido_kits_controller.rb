class ItemPedidoKitsController < ApplicationController
  before_filter :load_page, :only => :index
  before_filter :load_item_pedido_kit, :only => [ :edit, :new, :create, :update, :detroy ]


  # Inicío da Index
  def index
    @item_pedido_kits = ItemPedidoKit.paginate( :page => @page, :per_page => @per_page)

    respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.erb
      format.json { render :json => { :metaData => { :totalProperty => 'total', :root => 'results', :id => 'id',
            :fields =>
              [ { :name => 'id', :mapping => 'id' },
              { :name => 'pedido_id', :mapping => 'pedido_id' },
              { :name => 'quantidade', :mapping => 'quantidade' },
              { :name => 'valor_tabela', :mapping => 'valor_tabela' },
              { :name => 'valor_venda', :mapping => 'valor_venda' },
              { :name => 'desconto', :mapping => 'desconto' },
              { :name => 'produto_id', :mapping => 'produto_id' },
              { :name => 'produto_kit', :mapping => 'produto_kit' }
             ]
          }, :results => @item_pedido_kits, :total => @item_pedido_kits.total_entries }.to_json(:include => [ ])
      }
    end
  end

  def create
    create_or_update
  end

  def new
    respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.erb
    end

  end

  def edit;end


  protected

  def load_item_pedido_kit
    @item_pedido_kit = params[:id].blank? ? ItemPedidoKit.new : ItemPedidoKit.find(params[:id])
  end

  def create_or_update
    if @item_pedido_kit.update_attributes(params[:item_pedido_kit])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
            :results => @item_pedido_kit
          },
          :status => :created,
          :location => @item_pedido_kit
        }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @item_pedido_kit.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
            :errors => @errors
          },
          :location => @item_pedido_kit,
          :status => :unprocessable_entity

        }
      end
    end
  end
end
