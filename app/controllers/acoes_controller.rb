class AcoesController < ApplicationController

  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_contacts(params[:filter]).to_ext_json(:class=>:acao, :count => count(params[:fields])) }
    end
  end


  def new
    @acao = Acao.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  def create
    @acao = Acao.new(params[:acao])
    respond_to do |format|
      format.js do
        if @acao.save
          rwt_ok
        else
          rwt_err_messages(@acao)
        end
      end
    end
  end

  def update
    @acao = Acao.find(params[:id])
    respond_to do |format|
      format.js do
        if @acao.update_attributes(params[:acao])
          rwt_ok
        else
          rwt_err_messages(@acao)
        end
      end
    end
  end

  def destroy
    @acao = Acao.find(params[:id])
    if @acao.destroy
      rwt_ok
    else
      rwt_err_messages(@acao)
    end
  end

  protected

    def find_acoes(filter)
      pagination_state = update_pagination_state_with_params!(:acao)
      Acao.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
    end

    def count(filter)
      if filter == nil or filter.empty? then
         Acao.count
      else
         Acao.count(:conditions=>"first like '%#{filter}%'")
      end
    end
end
  def edit
    @acao = Acao.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  def edit
    @acao = Acao.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end
