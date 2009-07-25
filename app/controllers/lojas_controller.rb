class LojasController < ApplicationController
  before_filter :load_page, :only => :index
  before_filter :load_lojas, :only => [ :edit, :new, :create, :update, :detroy ]


  # Inicío da Index
  def index
    @lojas = Pedido.paginate( :page => @page, :per_page => @per_page)

    respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.erb
      format.json { render :json => { :metaData => { :totalProperty => 'total', :root => 'results', :id => 'id',
            :fields =>
              [ { :name => 'id', :mapping => 'id' },
              { :name => 'nome_loja', :mapping => 'nome_loja' }
             ]
          }, :results => @lojas, :total => @lojas.total_entries }.to_json(:include => [ ])
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

  def load_loja
    @loja = params[:id].blank? ? Loja.new : Loja.find(params[:id])
  end

  def create_or_update
    if @loja.update_attributes(params[:pedido])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
            :results => @loja
          },
          :status => :created,
          :location => @loja
        }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @loja.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
            :errors => @errors
          },
          :location => @loja,
          :status => :unprocessable_entity

        }
      end
    end
  end
end
