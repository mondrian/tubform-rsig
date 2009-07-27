class ClientesController < ApplicationController
  # GET /clientes
  # GET /clientes.xml
   before_filter :load_page, :only => :index
  before_filter :load_cliente, :only => [ :edit, :new, :create, :update, :destroy ]

  def index
    @clientes = Cliente.paginate( :page => @page,
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
                                 { :name => 'tipo_cliente', :mapping => 'tipo_cliente' }      
                                 { :name => 'cpf', :mapping => 'cpf' }      
                                 { :name => 'cnpj', :mapping => 'cnpj' }      
                                 { :name => 'razao_social', :mapping => 'razao_social' }      
                                 { :name => 'nome_fantasia', :mapping => 'nome_fantasia' }                                    
                                 { :name => 'documento', :mapping => 'documento' }  
                                 { :name => 'endereco', :mapping => 'endereco' } 
                                 { :name => 'bairro', :mapping => 'bairro' }   
                                 { :name => 'complemento', :mapping => 'complemento' }  
#                                 { :name => 'uf', :mapping => 'uf' }  
                                 { :name => 'cep', :mapping => 'cep' }  
                                 { :name => 'referencia', :mapping => 'referencia' }  
                                 { :name => 'fone_pessoal', :mapping => 'fone_pessoal' }  
                                 { :name => 'fone_comercial', :mapping => 'fone_comercial' }  
                                 { :name => 'fone_celular', :mapping => 'fone_celular' }  
                                 { :name => 'email', :mapping => 'email' }  
                                 { :name => 'endereco_entrega', :mapping => 'endereco_entrega' }  
                                 { :name => 'regiao_entrega_id', :mapping => 'regiao_entrega_id' }  
                                 { :name => 'cidade_entrega_id', :mapping => 'cidade_entrega_id' }  
                                 { :name => 'area_id', :mapping => 'area_id' }  
                                 { :name => 'referencias_bancaria', :mapping => 'referencias_bancaria' }  
                                 { :name => 'referencias_comerciais', :mapping => 'refrencias_comerciais' }  
                                 { :name => 'observacao', :mapping => 'observacao' }  
                                 { :name => 'info_serasa', :mapping => 'info_serasa' }  
                                 { :name => 'data_nascimento', :mapping => 'data_nascimento' }
                                 { :name => 'nome_comprador', :mapping => 'nome_comprador' }  
                                 { :name => 'vendas_suspensas', :mapping => 'vendas_suspensas' }  
                                 { :name => 'observacao_suspensao_venda', :mapping => 'observacao_suspensao_venda' }    
                                 { :name => ':limite_credito', :mapping => ':limite_credito' }  
                                 { :name => 'status', :mapping => 'status' }  
                                 { :name => 'prazo_medio_maximo', :mapping => 'prazo_medio_maximo' }  
                                 { :name => 'data_inclusao_prazo_medio', :mapping => 'data_inclusao_prazo_medio' }  
                                 
                               ]
                             },
                             :results => @cliente,
                             :total => @clientes.total_entries
                           }.to_json(:include => [ ])
                  }
    end
  end
def new
    respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.erb
    end
  end

 
  def edit
    @cliente = Cliente.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
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

  def load_cliente
    @cliente = params[:id].blank? ? Cliente.new : Cliente.find(params[:id])
  end

  def create_or_update
    if @cliente.update_attributes(params[:cliente])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
                                        :results => @cliente
                                      },
                             :status => :created,
                             :location => @cliente
                    }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @cliente.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
                                        :errors => @errors
                                      },
                             :location => @cliente,
                             :status => :unprocessable_entity

                    }
      end
    end
  end
end
