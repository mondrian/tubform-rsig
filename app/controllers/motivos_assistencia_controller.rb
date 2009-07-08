class MotivosAssistenciaController < ApplicationController
  # GET /motivos_assistencia
  # GET /motivos_assistencia.xml
  def index
    @motivos_assistencia = MotivoAssistencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @motivos_assistencia }
    end
  end

  # GET /motivos_assistencia/1
  # GET /motivos_assistencia/1.xml
  def show
    @motivo_assistencia = MotivoAssistencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @motivo_assistencia }
    end
  end

  # GET /motivos_assistencia/new
  # GET /motivos_assistencia/new.xml
  def new
    @motivo_assistencia = MotivoAssistencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @motivo_assistencia }
    end
  end

  # GET /motivos_assistencia/1/edit
  def edit
    @motivo_assistencia = MotivoAssistencia.find(params[:id])
  end

  # POST /motivos_assistencia
  # POST /motivos_assistencia.xml
  def create
    @motivo_assistencia = MotivoAssistencia.new(params[:motivo_assistencia])

    respond_to do |format|
      if @motivo_assistencia.save
        flash[:notice] = 'MotivoAssistencia was successfully created.'
        format.html { redirect_to(@motivo_assistencia) }
        format.xml  { render :xml => @motivo_assistencia, :status => :created, :location => @motivo_assistencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @motivo_assistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /motivos_assistencia/1
  # PUT /motivos_assistencia/1.xml
  def update
    @motivo_assistencia = MotivoAssistencia.find(params[:id])

    respond_to do |format|
      if @motivo_assistencia.update_attributes(params[:motivo_assistencia])
        flash[:notice] = 'MotivoAssistencia was successfully updated.'
        format.html { redirect_to(@motivo_assistencia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @motivo_assistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /motivos_assistencia/1
  # DELETE /motivos_assistencia/1.xml
  def destroy
    @motivo_assistencia = MotivoAssistencia.find(params[:id])
    @motivo_assistencia.destroy

    respond_to do |format|
      format.html { redirect_to(motivos_assistencia_url) }
      format.xml  { head :ok }
    end
  end
end
