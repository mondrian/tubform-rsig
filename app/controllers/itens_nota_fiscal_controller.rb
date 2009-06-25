class ItensNotaFiscalController < ApplicationController
  # GET /itens_nota_fiscal
  # GET /itens_nota_fiscal.xml
  def index
    @itens_nota_fiscal = ItemNotaFiscal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @itens_nota_fiscal }
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

  # POST /itens_nota_fiscal
  # POST /itens_nota_fiscal.xml
  def create
    @item_nota_fiscal = ItemNotaFiscal.new(params[:item_nota_fiscal])

    respond_to do |format|
      if @item_nota_fiscal.save
        flash[:notice] = 'ItemNotaFiscal was successfully created.'
        format.html { redirect_to(@item_nota_fiscal) }
        format.xml  { render :xml => @item_nota_fiscal, :status => :created, :location => @item_nota_fiscal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_nota_fiscal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /itens_nota_fiscal/1
  # PUT /itens_nota_fiscal/1.xml
  def update
    @item_nota_fiscal = ItemNotaFiscal.find(params[:id])

    respond_to do |format|
      if @item_nota_fiscal.update_attributes(params[:item_nota_fiscal])
        flash[:notice] = 'ItemNotaFiscal was successfully updated.'
        format.html { redirect_to(@item_nota_fiscal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_nota_fiscal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /itens_nota_fiscal/1
  # DELETE /itens_nota_fiscal/1.xml
  def destroy
    @item_nota_fiscal = ItemNotaFiscal.find(params[:id])
    @item_nota_fiscal.destroy

    respond_to do |format|
      format.html { redirect_to(itens_nota_fiscal_url) }
      format.xml  { head :ok }
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
