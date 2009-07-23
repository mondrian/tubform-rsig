class ProdutoKitsController < ApplicationController
  # GET /produto_kits
  # GET /produto_kits.xml
  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_produto_kits(params[:filter]).to_ext_json(:class=>:produto, :count => count(params[:fields])) }
    end
  end

  # GET /produto_kits/1
  # GET /produto_kits/1.xml
  def show
    @produto_kit = ProdutoKit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produto_kit }
    end
  end

  # GET /produto_kits/new
  # GET /produto_kits/new.xml
  def new
    @produto_kit = ProdutoKit.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # GET /produto_kits/1/edit
  def edit
    @produto_kit = ProdutoKit.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end


  # POST /produto_kits
  # POST /produto_kits.xml
  def create
    @produto_kit = ProdutoKit.new(params[:produto_kit])
    respond_to do |format|
      format.js do
        if @produto_kit.save
          rwt_ok
        else
          rwt_err_messages(@produto_kit)
        end
      end
    end
  end

  # PUT /produto_kits/1
  # PUT /produto_kits/1.xml
  def update
    @produto_kit = ProdutoKit.find(params[:id])
    respond_to do |format|
      format.js do
        if @produto_kit.update_attributes(params[:produt_kit])
          rwt_ok
        else
          rwt_err_messages(@produto_kit)
        end
      end
    end
  end


  # DELETE /produto_kits/1
  # DELETE /produto_kits/1.xml
  def destroy
    @produto_kit = ProdutoKit.find(params[:id])
    @produto_kit.destroy

    respond_to do |format|
      format.html { redirect_to(produto_kits_url) }
      format.xml  { head :ok }
    end
  end

  def destroy
    @produto_kit = ProdutoKit.find(params[:id])
    if @produto_kit.destroy
      rwt_ok
    else
      rwt_err_messages(@produto_kit)
    end
  end

  def find_produto_kits(filter)
      pagination_state = update_pagination_state_with_params!(:produto_kit)
      ProdutoKit.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["descricao like ?","%#{filter}%"]))
    end

    def count(filter)
      if filter == nil or filter.empty? then
         ProdutoKit.count
      else
         ProdutoKit.count(:conditions=>"descricao like '%#{filter}%'")
      end
    end
end
