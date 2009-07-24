class PedidosDeAssistenciaController < ApplicationController

  before_filter :load_page, :only => :index
  before_filter :load_pedido_de_assistencia, :only => [ :edit, :new, :create, :update, :detroy ]

  def index
    @pedidos_de_assistencia = PedidoDeAssistencia.paginate( :page => @page,
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
                                 { :name => 'nome', :mapping => 'nome' }
                               ]
                             },
                             :results => @pedidos_de_assistencia,
                             :total => @pedidos_de_assistencia.total_entries
                           }.to_json(:include => [ ])
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

  def load_pedido_de_assistencia
    @pedido_de_assistencia = params[:id].blank? ? PedidoDeAssistencia.new : PedidoDeAssistencia.find(params[:id])
  end

  def create_or_update
    if @pedido_de_assistencia.update_attributes(params[:pedido_de_assistencia])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
                                        :results => @pedido_de_assistencia
                                      },
                             :status => :created,
                             :location => @pedido_de_assistencia
                    }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @pedido_de_assistencia.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
                                        :errors => @errors
                                      },
                             :location => @pedido_de_assistencia,
                             :status => :unprocessable_entity

                    }
      end
    end
  end


end

