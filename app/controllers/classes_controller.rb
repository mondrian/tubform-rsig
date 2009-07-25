class ClassesController < ApplicationController

  before_filter :load_page, :only => :index
  before_filter :load_duplicata, :only => [ :edit, :new, :create, :update, :destroy ]

  def index
    @classes = Classe.paginate( :page => @page,
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
                                 { :name => 'descricao', :mapping => 'descricao' }      
                                          ]                    
                             :results => @classes,
                             :total => @classes.total_entries
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
    @classe = Classe.find(params[:id])
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
    @classe = params[:id].blank? ? Classe.new : Classe.find(params[:id])
  end

  def create_or_update
    if @classe.update_attributes(params[:classe])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
                                        :results => @classe
                                      },
                             :status => :created,
                             :location => @classe
                    }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @classe.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
                                        :errors => @errors
                                      },
                             :location => @classe,
                             :status => :unprocessable_entity

                    }
      end
    end
  end
end
