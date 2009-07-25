class PedidosController < ApplicationController
  before_filter :load_page, :only => :index
  before_filter :load_pedido, :only => [ :edit, :new, :create, :update, :detroy ]


  # Inicío da Index
  def index
    @pedidos = Pedido.paginate( :page => @page, :per_page => @per_page)

    respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.erb
      format.json { render :json => { :metaData => { :totalProperty => 'total', :root => 'results', :id => 'id',
            :fields =>
              [ { :name => 'id', :mapping => 'id' },
              { :name => 'tipo', :mapping => 'tipo' },
              { :name => 'data', :mapping => 'data' },
              { :name => 'valor', :mapping => 'valor' },
              { :name => 'cliente_id', :mapping => 'cliente_id' }
             ]
          }, :results => @pedidos, :total => @pedidos.total_entries }.to_json(:include => [ ])
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

  def load_pedido
    @pedido = params[:id].blank? ? Pedido.new : Pedido.find(params[:id])
  end

  def create_or_update
    if @pedido.update_attributes(params[:pedido])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
            :results => @pedido
          },
          :status => :created,
          :location => @pedido
        }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @pedido.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
            :errors => @errors
          },
          :location => @pedido,
          :status => :unprocessable_entity

        }
      end
    end
  end

end
