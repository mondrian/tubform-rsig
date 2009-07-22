class FaixaDeDescontosController < ApplicationController
  # GET /faixas_de_desconto
  # GET /faixas_de_desconto.xml
  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_faixa_de_descontos(params[:filter]).to_ext_json(:class=>:faixa_de_desconto, :count => count(params[:fields])) }
    end
  end

  # GET /faixas_de_desconto/new
  # GET /faixas_de_desconto/new.xml
  def new
    @faixa_de_desconto = FaixaDeDesconto.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # GET /faixas_de_desconto/1/edit
  def edit
    @faixa_de_desconto = FaixaDeDesconto.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # POST /faixas_de_desconto
  # POST /faixas_de_desconto.xml
  def create
    @faixa_de_desconto = FaixaDeDesconto.new(params[:faixa_de_desconto])
    respond_to do |format|
      format.js do
        if @faixa_de_desconto.save
          rwt_ok
        else
          rwt_err_messages(@faixa_de_desconto)
        end
      end
    end
  end

  # PUT /faixas_de_desconto/1
  # PUT /faixas_de_desconto/1.xml
  def update
    @faixa_de_desconto = FaixaDeDesconto.find(params[:id])
    respond_to do |format|
      format.js do
        if @faixa_de_desconto.update_attributes(params[:faixa_de_desconto])
          rwt_ok
        else
          rwt_err_messages(@faixa_de_desconto)
        end
      end
    end
  end

  # DELETE /faixas_de_desconto/1
  # DELETE /faixas_de_desconto/1.xml
  def destroy
    @faixa_de_desconto = FaixaDeDesconto.find(params[:id])
    if @faixa_de_desconto.destroy
      rwt_ok
    else
      rwt_err_messages(@faixa_de_desconto)
    end
  end


  protected

  def find_faixa_de_descontos(filter)
  	pagination_state = update_pagination_state_with_params!(:faixa_de_desconto)
  	FaixaDeDesconto.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
  end

  def count(filter)
	  if filter == nil or filter.empty? then
  		FaixaDeDesconto.count
  	else
  		FaixaDeDesconto.count(:conditions=>"first like '%#{filter}%'")
  	end
  end
end
