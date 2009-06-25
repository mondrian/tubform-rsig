class FaixaDeDescontosController < ApplicationController
  # GET /faixas_de_desconto
  # GET /faixas_de_desconto.xml
  def index
    @faixas_de_desconto = FaixaDeDesconto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @faixas_de_desconto }
    end
  end

  # GET /faixas_de_desconto/1
  # GET /faixas_de_desconto/1.xml
  def show
    @faixa_de_desconto = FaixaDeDesconto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @faixa_de_desconto }
    end
  end

  # GET /faixas_de_desconto/new
  # GET /faixas_de_desconto/new.xml
  def new
    @faixa_de_desconto = FaixaDeDesconto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @faixa_de_desconto }
    end
  end

  # GET /faixas_de_desconto/1/edit
  def edit
    @faixa_de_desconto = FaixaDeDesconto.find(params[:id])
  end

  # POST /faixas_de_desconto
  # POST /faixas_de_desconto.xml
  def create
    @faixa_de_desconto = FaixaDeDesconto.new(params[:faixa_de_desconto])

    respond_to do |format|
      if @faixa_de_desconto.save
        flash[:notice] = 'FaixaDeDesconto was successfully created.'
        format.html { redirect_to(@faixa_de_desconto) }
        format.xml  { render :xml => @faixa_de_desconto, :status => :created, :location => @faixa_de_desconto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @faixa_de_desconto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /faixas_de_desconto/1
  # PUT /faixas_de_desconto/1.xml
  def update
    @faixa_de_desconto = FaixaDeDesconto.find(params[:id])

    respond_to do |format|
      if @faixa_de_desconto.update_attributes(params[:faixa_de_desconto])
        flash[:notice] = 'FaixaDeDesconto was successfully updated.'
        format.html { redirect_to(@faixa_de_desconto) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @faixa_de_desconto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /faixas_de_desconto/1
  # DELETE /faixas_de_desconto/1.xml
  def destroy
    @faixa_de_desconto = FaixaDeDesconto.find(params[:id])
    @faixa_de_desconto.destroy

    respond_to do |format|
      format.html { redirect_to(faixas_de_desconto_url) }
      format.xml  { head :ok }
    end
  end
end