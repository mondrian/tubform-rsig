class AcoesFuncionariosController < ApplicationController
  # GET /acoes_funcionarios
  # GET /acoes_funcionarios.xml
  def index
    @acoes_funcionarios = AcaoFuncionario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @acoes_funcionarios }
    end
  end

  # GET /acoes_funcionarios/1
  # GET /acoes_funcionarios/1.xml
  def show
    @acoes_funcionarios = AcaoFuncionario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @acoes_funcionarios }
    end
  end

  # GET /acoes_funcionarios/new
  # GET /acoes_funcionarios/new.xml
  def new
    @acoes_funcionarios = AcaoFuncionario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @acoes_funcionarios }
    end
  end

  # GET /acoes_funcionarios/1/edit
  def edit
    @acoes_funcionarios = AcaoFuncionario.find(params[:id])
  end

  # POST /acoes_funcionarios
  # POST /acoes_funcionarios.xml
  def create
    @acoes_funcionarios = AcaoFuncionario.new(params[:acoes_funcionarios])

    respond_to do |format|
      if @acoes_funcionarios.save
        flash[:notice] = 'AcaoFuncionario was successfully created.'
        format.html { redirect_to(@acoes_funcionarios) }
        format.xml  { render :xml => @acoes_funcionarios, :status => :created, :location => @acoes_funcionarios }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @acoes_funcionarios.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /acoes_funcionarios/1
  # PUT /acoes_funcionarios/1.xml
  def update
    @acoes_funcionarios = AcaoFuncionario.find(params[:id])

    respond_to do |format|
      if @acoes_funcionarios.update_attributes(params[:acoes_funcionarios])
        flash[:notice] = 'AcaoFuncionario was successfully updated.'
        format.html { redirect_to(@acoes_funcionarios) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @acoes_funcionarios.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /acoes_funcionarios/1
  # DELETE /acoes_funcionarios/1.xml
  def destroy
    @acoes_funcionarios = AcaoFuncionario.find(params[:id])
    @acoes_funcionarios.destroy

    respond_to do |format|
      format.html { redirect_to(acoes_funcionarios_url) }
      format.xml  { head :ok }
    end
  end
end
