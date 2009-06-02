class NotasFiscaisController < ApplicationController
  # GET /notas_fiscais
  # GET /notas_fiscais.xml
  def index
    @notas_fiscais = NotaFiscal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notas_fiscais }
    end
  end

  # GET /notas_fiscais/1
  # GET /notas_fiscais/1.xml
  def show
    @nota_fiscal = NotaFiscal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nota_fiscal }
    end
  end

  # GET /notas_fiscais/new
  # GET /notas_fiscais/new.xml
  def new
    @nota_fiscal = NotaFiscal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nota_fiscal }
    end
  end

  # GET /notas_fiscais/1/edit
  def edit
    @nota_fiscal = NotaFiscal.find(params[:id])
  end

  # POST /notas_fiscais
  # POST /notas_fiscais.xml
  def create
    @nota_fiscal = NotaFiscal.new(params[:nota_fiscal])

    respond_to do |format|
      if @nota_fiscal.save
        flash[:notice] = 'NotaFiscal was successfully created.'
        format.html { redirect_to(@nota_fiscal) }
        format.xml  { render :xml => @nota_fiscal, :status => :created, :location => @nota_fiscal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nota_fiscal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notas_fiscais/1
  # PUT /notas_fiscais/1.xml
  def update
    @nota_fiscal = NotaFiscal.find(params[:id])

    respond_to do |format|
      if @nota_fiscal.update_attributes(params[:nota_fiscal])
        flash[:notice] = 'NotaFiscal was successfully updated.'
        format.html { redirect_to(@nota_fiscal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nota_fiscal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notas_fiscais/1
  # DELETE /notas_fiscais/1.xml
  def destroy
    @nota_fiscal = NotaFiscal.find(params[:id])
    @nota_fiscal.destroy

    respond_to do |format|
      format.html { redirect_to(notas_fiscais_url) }
      format.xml  { head :ok }
    end
  end
end
