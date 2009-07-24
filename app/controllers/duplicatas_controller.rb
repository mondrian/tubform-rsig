class DuplicatasController < ApplicationController
  # GET /duplicatas
  # GET /duplicatas.xml
  before_filter :load_page, :only => :index
  before_filter :load_duplicata, :only => [ :edit, :new, :create, :update, :destroy ]

  def index
    @duplicatas = Grupo.paginate( :page => @page,
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
                                 { :name => 'plano_de_conta_id', :mapping => 'plano_de_conta_id' }      
                                 { :name => 'razao_social', :mapping => 'razao_social' }      
                                 { :name => 'cliente_id', :mapping => 'cliente_id' }      
                                 { :name => 'devedor_id', :mapping => 'devedor_id' }      
                                 { :name => 'pedido_id', :mapping => 'pedido_id' }                                    
                                 { :name => 'tipo_cobranca', :mapping => 'tipo_cobranca' }  
                                 { :name => 'data_vencimento', :mapping => 'data_vencimento' } 
                                 { :name => 'data_cobranca', :mapping => 'data_cobranca' }   
                                 { :name => 'valor', :mapping => 'valor' }  
                               ]
                             },
                             :results => @duplicatas,
                             :total => @duplicatas.total_entries
                           }.to_json(:include => [ ])
                  }
    end
  end
 

  # GET /duplicatas/new
  # GET /duplicatas/new.xml
 def new
    respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.erb
    end
  end

  # GET /duplicatas/1/edit
  def edit
    @duplicata = Duplicata.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # POST /duplicatas
  # POST /duplicatas.xml
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

  def load_grupo
    @duplicata = params[:id].blank? ? Duplicata.new : Duplicata.find(params[:id])
  end

  def create_or_update
    if @duplicata.update_attributes(params[:grupo])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
                                        :results => @duplicata
                                      },
                             :status => :created,
                             :location => @duplicata
                    }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @duplicata.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
                                        :errors => @errors
                                      },
                             :location => @duplicata,
                             :status => :unprocessable_entity

                    }
      end
    end
  end
end
