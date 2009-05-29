class AcoesController < ApplicationController
  # GET /acoes
  # GET /acoes.xml
  def index
    @acoes = Acao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @acoes }
    end
  end

  # GET /acoes/1
  # GET /acoes/1.xml
  def show
    @acao = Acao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @acao }
    end
  end

  # GET /acoes/new
  # GET /acoes/new.xml
  def new
    @acao = Acao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @acao }
    end
  end

  # GET /acoes/1/edit
  def edit
    @acao = Acao.find(params[:id])
  end

  # POST /acoes
  # POST /acoes.xml
  def create
    @acao = Acao.new(params[:acao])

    respond_to do |format|
      if @acao.save
        flash[:notice] = 'Acao was successfully created.'
        format.html { redirect_to(@acao) }
        format.xml  { render :xml => @acao, :status => :created, :location => @acao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @acao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /acoes/1
  # PUT /acoes/1.xml
  def update
    @acao = Acao.find(params[:id])

    respond_to do |format|
      if @acao.update_attributes(params[:acao])
        flash[:notice] = 'Acao was successfully updated.'
        format.html { redirect_to(@acao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @acao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /acoes/1
  # DELETE /acoes/1.xml
  def destroy
    @acao = Acao.find(params[:id])
    @acao.destroy

    respond_to do |format|
      format.html { redirect_to(acoes_url) }
      format.xml  { head :ok }
    end
  end
end
