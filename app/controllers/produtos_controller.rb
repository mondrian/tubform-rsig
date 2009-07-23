class ProdutosController < ApplicationController
  # GET /produtos
  # GET /produtos.xml

  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_produtos(params[:filter]).to_ext_json(:class=>:produto, :count => count(params[:fields])) }
    end
  end


  # GET /produtos/1
  # GET /produtos/1.xml
  def show
    @produto = Produto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @produto }
    end
  end

  # GET /produtos/new
  # GET /produtos/new.xml
  def new
    @produto = Produto.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end


  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # POST /produtos
  # POST /produtos.xml

  def create
    @produto = Produto.new(params[:produto])
    respond_to do |format|
      format.js do
        if @produto.save
          rwt_ok
        else
          rwt_err_messages(@produto)
        end
      end
    end
  end


  # PUT /produtos/1
  # PUT /produtos/1.xml
  def update
    @produto = Produto.find(params[:id])
    respond_to do |format|
      format.js do
        if @produto.update_attributes(params[:produto])
          rwt_ok
        else
          rwt_err_messages(@produto)
        end
      end
    end
  end


  # DELETE /produtos/1
  # DELETE /produtos/1.xml
  def destroy
    @produto = Produto.find(params[:id])
    if @produto.destroy
      rwt_ok
    else
      rwt_err_messages(@produto)
    end
  end

  protected

    def find_produtos(filter)
      pagination_state = update_pagination_state_with_params!(:produto)
      Produto.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["descricao like ?","%#{filter}%"]))
    end

    def count(filter)
      if filter == nil or filter.empty? then
         Produto.count
      else
         Produto.count(:conditions=>"descricao like '%#{filter}%'")
      end
    end
end
