class ComponentesController < ApplicationController
  # GET /componentes
  # GET /componentes.xml
  def index
    @componentes = Componente.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @componentes }
    end
  end

  # GET /componentes/1
  # GET /componentes/1.xml
  def show
    @componente = Componente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @componente }
    end
  end

  # GET /componentes/new
  # GET /componentes/new.xml
  def new
    @componente = Componente.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @componente }
    end
  end

  # GET /componentes/1/edit
  def edit
    @componente = Componente.find(params[:id])
  end

  # POST /componentes
  # POST /componentes.xml
  def create
    @componente = Componente.new(params[:componente])

    respond_to do |format|
      if @componente.save
        flash[:notice] = 'Componente was successfully created.'
        format.html { redirect_to(@componente) }
        format.xml  { render :xml => @componente, :status => :created, :location => @componente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @componente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /componentes/1
  # PUT /componentes/1.xml
  def update
    @componente = Componente.find(params[:id])

    respond_to do |format|
      if @componente.update_attributes(params[:componente])
        flash[:notice] = 'Componente was successfully updated.'
        format.html { redirect_to(@componente) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @componente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /componentes/1
  # DELETE /componentes/1.xml
  def destroy
    @componente = Componente.find(params[:id])
    @componente.destroy

    respond_to do |format|
      format.html { redirect_to(componentes_url) }
      format.xml  { head :ok }
    end
  end
end
