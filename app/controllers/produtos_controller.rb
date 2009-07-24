class GruposController < ApplicationController

  before_filter :load_page, :only => :index
  before_filter :load_produto, :only => [ :edit, :new, :create, :update, :detroy ]

  def index
    @produtos = Produto.paginate( :page => @page,
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
                             :results => @produtos,
                             :total => @produtos.total_entries
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

  def load_produto
    @produto = params[:id].blank? ? Produto.new : Produto.find(params[:id])
  end

  def create_or_update
    if @produto.update_attributes(params[:produto])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
                                        :results => @produto
                                      },
                             :status => :created,
                             :location => @produto
                    }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @produto.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
                                        :errors => @errors
                                      },
                             :location => @produto,
                             :status => :unprocessable_entity

                    }
      end
    end
  end


end

