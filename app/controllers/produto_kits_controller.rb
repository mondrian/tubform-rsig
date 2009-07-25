class ProdutoKitsController < ApplicationController

  before_filter :load_page, :only => :index
  before_filter :load_produto_kit, :only => [ :edit, :new, :create, :update, :detroy ]

  def index
    @produto_kits = ProdutoKit.paginate( :page => @page,
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
                                 { :name => 'descricao', :mapping => 'descricao' },
                                 { :name => 'valor_normal', :mapping => 'valor_normal' },
                                 { :name => 'valor_especial', :mapping => 'valor_especial' } 
                               ]
                             },
                             :results => @produto_kits,
                             :total => @produto_kits.total_entries
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

  def load_produto_kit
    @produto_kit = params[:id].blank? ? ProdutoKit.new : ProdutoKit.find(params[:id])
  end

  def create_or_update
    if @produto_kit.update_attributes(params[:grupo])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
                                        :results => @produto_kit
                                      },
                             :status => :created,
                             :location => @produto_kit
                    }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @produto_kit.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
                                        :errors => @errors
                                      },
                             :location => @produto_kit,
                             :status => :unprocessable_entity

                    }
      end
    end
  end


end

