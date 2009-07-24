class AcoesController < ApplicationController
  # GET /duplicatas
  # GET /duplicatas.xml
  before_filter :load_page, :only => :index
  before_filter :load_duplicata, :only => [ :edit, :new, :create, :update, :destroy ]

  def index
    @acoes = Acao.paginate( :page => @page,
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
                                 { :name => 'controller_name', :mapping => 'controller_name' },      
                                 { :name => 'action_name', :mapping => 'action_name' }   
                               ]
                             },
                             :results => @acoes,
                             :total => @acoes.total_entries
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
    @acao = Acao.find(params[:id])
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

  def load_grupo
    @acao = params[:id].blank? ? Acao.new : Acao.find(params[:id])
  end

  def create_or_update
    if @acao.update_attributes(params[:acao])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
                                        :results => @acao
                                      },
                             :status => :created,
                             :location => @acao
                    }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @acao.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
                                        :errors => @errors
                                      },
                             :location => @acao,
                             :status => :unprocessable_entity

                    }
      end
    end
  end
end
