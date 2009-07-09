class LojasController < ApplicationController
  # GET /lojas
  # GET /lojas.xml
  def index
    @lojas = Loja.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lojas }
    end
  end

  # GET /lojas/1
  # GET /lojas/1.xml
  def show
    @loja = Loja.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loja }
    end
  end

  # GET /lojas/new
  # GET /lojas/new.xml
  def new
    @loja = Loja.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loja }
    end
  end

  # GET /lojas/1/edit
  def edit
    @loja = Loja.find(params[:id])
  end

  # POST /lojas
  # POST /lojas.xml
  def create
    @loja = Loja.new(params[:loja])

    respond_to do |format|
      if @loja.save
        flash[:notice] = 'Loja was successfully created.'
        format.html { redirect_to(@loja) }
        format.xml  { render :xml => @loja, :status => :created, :location => @loja }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loja.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lojas/1
  # PUT /lojas/1.xml
  def update
    @loja = Loja.find(params[:id])

    respond_to do |format|
      if @loja.update_attributes(params[:loja])
        flash[:notice] = 'Loja was successfully updated.'
        format.html { redirect_to(@loja) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loja.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lojas/1
  # DELETE /lojas/1.xml
  def destroy
    @loja = Loja.find(params[:id])
    @loja.destroy

    respond_to do |format|
      format.html { redirect_to(lojas_url) }
      format.xml  { head :ok }
    end
  end
end
