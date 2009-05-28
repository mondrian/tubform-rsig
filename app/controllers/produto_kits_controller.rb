class ProdutoKitsController < ApplicationController
  # GET /produto_kits
  # GET /produto_kits.xml
  def index
    @produto_kits = ProdutoKit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produto_kits }
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
      format.html # new.html.erb
      format.xml  { render :xml => @produto_kit }
    end
  end

  # GET /produto_kits/1/edit
  def edit
    @produto_kit = ProdutoKit.find(params[:id])
  end

  # POST /produto_kits
  # POST /produto_kits.xml
  def create
    @produto_kit = ProdutoKit.new(params[:produto_kit])

    respond_to do |format|
      if @produto_kit.save
        flash[:notice] = 'ProdutoKit was successfully created.'
        format.html { redirect_to(@produto_kit) }
        format.xml  { render :xml => @produto_kit, :status => :created, :location => @produto_kit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produto_kit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /produto_kits/1
  # PUT /produto_kits/1.xml
  def update
    @produto_kit = ProdutoKit.find(params[:id])

    respond_to do |format|
      if @produto_kit.update_attributes(params[:produto_kit])
        flash[:notice] = 'ProdutoKit was successfully updated.'
        format.html { redirect_to(@produto_kit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @produto_kit.errors, :status => :unprocessable_entity }
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
end
