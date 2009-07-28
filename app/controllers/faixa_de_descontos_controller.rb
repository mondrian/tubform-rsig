class FaixaDeDescontosController < ApplicationController
  before_filter :load_page, :only => :index
  before_filter :load_faixa_de_descontos, :only => [ :edit, :new, :create, :update, :detroy ]


  # Inicío da Index
  def index
    @faixa_de_descontos = FaixaDeDescontos.paginate( :page => @page, :per_page => @per_page)

    respond_to do |format|
      format.html #index.html.erb
      format.js   #index.js.erb
      format.json { render :json => { :metaData => { :totalProperty => 'total', :root => 'results', :id => 'id',
            :fields =>
              [ { :name => 'id', :mapping => 'id' },
              { :name => 'de', :mapping => 'de' },
              { :name => 'ate', :mapping => 'ate' },
              { :name => 'desconto_permitido', :mapping => 'desconto_permitido' }
             ]
          }, :results => @faixa_de_descontos, :total => @faixa_de_descontos.total_entries }.to_json(:include => [ ])
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

  def load_faixa_de_desconto
    @faixa_de_desconto = params[:id].blank? ? FaixaDeDescontos.new : FaixaDeDescontos.find(params[:id])
  end

  def create_or_update
    if @faixa_de_desconto.update_attributes(params[:faixa_de_desconto])
      respond_to do |format|
        format.json { render :json => { :success => 'true',
            :results => @faixa_de_desconto
          },
          :status => :created,
          :location => @faixa_de_desconto
        }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @faixa_de_desconto.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json { render :json => { :success => 'false',
            :errors => @errors
          },
          :location => @faixa_de_desconto,
          :status => :unprocessable_entity

        }
      end
    end
  end
end
