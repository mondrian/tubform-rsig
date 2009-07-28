class ItensPedidoDeAssistenciaController < ApplicationController
  before_filter :load_produtos, :only => [:new, :edit, :create, :update]
  before_filter :load_page, :only => :index
  before_filter :load_item_pedido_de_assistencias, :only => [ :edit, :new, :create, :update, :detroy ]


  # Inicío da Index
  def index
    @item_pedido_de_assistencias = PedidoDeAssistencia.paginate( :page => @page, :per_page => @per_page)

    respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.erb
      format.json { render :json => { :metaData => { :totalProperty => 'total', :root => 'results', :id => 'id',
            :fields =>
              [ { :name => 'id', :mapping => 'id' },
              { :name => 'produto', :mapping => 'produto' },
              { :name => 'quantidade', :mapping => 'quantidade' },
              { :name => 'valor', :mapping => 'valor' },
              { :name => 'sequencia_monvimento', :mapping => 'sequencia_monvimento' },
              { :name => 'emite_relatorio', :mapping => 'emite_relatorio' },
              { :name => 'codigo_produto_kit', :mapping => 'codigo_produto_kit' },
              { :name => 'justificativa', :mapping => 'justificativa' },
              { :name => 'usa_componente', :mapping => 'usa_componente' },
              { :name => 'motivo_id', :mapping => 'motivo_id' }
             ]
          }, :results => @item_pedido_de_assistencias, :total => @item_pedido_de_assistencias.total_entries }.to_json(:include => [ ])
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

	def usando_o_componente
		if params[:usa_componente] == 'true' and !params[:produto_id].nil?
		  sql = "select * from fnc_consultar_componentes_do_produto(#{'31'})"
			@exibeformcomponentes = Produto.find_by_sql(sql)
		else
			render :nothing => true
		end
	end

	# vai pegar os componentes e as quantidade de cada produto/componente
	def iterando_nos_componente_enviados
		quantidade = params[:produto_quantidade]
		i = 1
		for i in quantidade.to_i do
			@componentesenviados << Produto.all(params[:exibeformcomponente_id])
		end
	end

  protected
  def load_produtos
    @produtos = Produto.all.collect { |p| [p.descricao , p.id] }
  end


  def load_item_pedido_de_assistencia
    @item_pedido_de_assistencia = params[:id].blank? ? PedidoDeAssistencia.new : PedidoDeAssistencia.find(params[:id])
  end

  def create_or_update
    if @item_pedido_de_assistencia.update_attributes(params[:pedido])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
            :results => @item_pedido_de_assistencia
          },
          :status => :created,
          :location => @item_pedido_de_assistencia
        }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @item_pedido_de_assistencia.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
            :errors => @errors
          },
          :location => @item_pedido_de_assistencia,
          :status => :unprocessable_entity

        }
      end
    end
  end

  def find_item_pedido_de_assistencias(filter)
  	pagination_state = update_pagination_state_with_params!(:item_pedido_de_assistencia)
  	PedidoDeAssistencia.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
  end

  def count(filter)
	  if filter == nil or filter.empty? then
  		PedidoDeAssistencia.count
  	else
  		PedidoDeAssistencia.count(:conditions=>"first like '%#{filter}%'")
  	end
  end

end
