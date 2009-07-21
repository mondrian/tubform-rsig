class ContraPartidasController < ApplicationController
  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_contra_partidas(params[:filter]).to_ext_json(:class=>:contra_partidas, :count => count(params[:fields])) }
    end
  end


  def new
    @contra_partidas = ContraPartidas.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end
  
  def edit
    @contra_partida = ContraPartida.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  def create
    @contra_partida = ContraPartida.new(params[:contra_partida])
    respond_to do |format|
      format.js do
        if @contra_partida.save
          rwt_ok
        else
          rwt_err_messages(@contra_partida)
        end
      end
    end
  end

  def update
    @contra_partida = ContraPartida.find(params[:id])
    respond_to do |format|
      format.js do
        if @contra_partida.update_attributes(params[:contra_partida])
          rwt_ok
        else
          rwt_err_messages(@contra_partida)
        end
      end
    end
  end

  def destroy
    @contra_partida = ContraPartida.find(params[:id])
    if @contra_partida.destroy
      rwt_ok
    else
      rwt_err_messages(@contra_partida)
    end
  end

  protected

    def find_contacts(filter)
      pagination_state = update_pagination_state_with_params!(:contra_partida)
      ContraPartida.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
    end

    def count(filter)
      if filter == nil or filter.empty? then
         ContraPartida.count
      else
         ContraPartida.count(:conditions=>"first like '%#{filter}%'")
      end
    end
end
