class ContraPartidasController < ApplicationController
  # GET /contra_partidas
  # GET /contra_partidas.xml
  def index
    @contra_partidas = ContraPartida.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contra_partidas }
    end
  end

  # GET /contra_partidas/1
  # GET /contra_partidas/1.xml
  def show
    @contra_partida = ContraPartida.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contra_partida }
    end
  end

  # GET /contra_partidas/new
  # GET /contra_partidas/new.xml
  def new
    @contra_partida = ContraPartida.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contra_partida }
    end
  end

  # GET /contra_partidas/1/edit
  def edit
    @contra_partida = ContraPartida.find(params[:id])
  end

  # POST /contra_partidas
  # POST /contra_partidas.xml
  def create
    @contra_partida = ContraPartida.new(params[:contra_partida])

    respond_to do |format|
      if @contra_partida.save
        flash[:notice] = 'ContraPartida was successfully created.'
        format.html { redirect_to(@contra_partida) }
        format.xml  { render :xml => @contra_partida, :status => :created, :location => @contra_partida }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contra_partida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contra_partidas/1
  # PUT /contra_partidas/1.xml
  def update
    @contra_partida = ContraPartida.find(params[:id])

    respond_to do |format|
      if @contra_partida.update_attributes(params[:contra_partida])
        flash[:notice] = 'ContraPartida was successfully updated.'
        format.html { redirect_to(@contra_partida) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contra_partida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contra_partidas/1
  # DELETE /contra_partidas/1.xml
  def destroy
    @contra_partida = ContraPartida.find(params[:id])
    @contra_partida.destroy

    respond_to do |format|
      format.html { redirect_to(contra_partidas_url) }
      format.xml  { head :ok }
    end
  end
end
