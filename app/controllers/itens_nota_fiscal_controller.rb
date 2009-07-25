class ItensNotaFiscalController < ApplicationController
  # GET /itens_nota_fiscal
  # GET /itens_nota_fiscal.xml
  before_filter :load_page, :only => :index
  before_filter :load_duplicata, :only => [ :edit, :new, :create, :update, :destroy ]

  def index
    @itens_nota_fiscal = ItemNotaFiscal.paginate( :page => @page,
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
                                 { :name => 'quantidade', :mapping => 'quantidade' }      
                               ]
                             },
                             :results => @itens_pedidos,
                             :total => @itens_pedidos.total_entries
                           }.to_json(:include => [ ])
                  }

   
    end
  end

  # GET /itens_nota_fiscal/1
  # GET /itens_nota_fiscal/1.xml
  def show
    @item_nota_fiscal = ItemNotaFiscal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_nota_fiscal }
    end
  end

  # GET /itens_nota_fiscal/new
  # GET /itens_nota_fiscal/new.xml
  def new
    @item_nota_fiscal = ItemNotaFiscal.new
    @item_nota_fiscal.nota_fiscal_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_nota_fiscal }
    end
  end

  # GET /itens_nota_fiscal/1/edit
  def edit
    @item_nota_fiscal = ItemNotaFiscal.find(params[:id])
  end

  def load_grupo
    @item_nota_fiscal = params[:id].blank? ? ItemNotaFiscal.new : ItemNotaFiscal.find(params[:id])
  end


  def create_or_update
    if @item_nota_fiscal.update_attributes(params[:item_nota_fiscal])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
                                        :results => @item_nota_fiscal
                                      },
                             :status => :created,
                             :location => @item_nota_fiscal
                    }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @item_nota_fiscal.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
                                        :errors => @errors
                                      },
                             :location => @item_nota_fiscal,
                             :status => :unprocessable_entity
                    }

    end
  end
end

  def detalhe
		begin
			@produto = Produto.find(params[:item_nota_fiscal_produto_id])
		rescue
			render :text => "Produto não encontrado"
		end
  end
