class ClassesController < ApplicationController
  # GET /classes
  # GET /classes.xml
  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_classes(params[:filter]).to_ext_json(:class=>:classe, :count => count(params[:fields])) }
    end
  end

  # GET /classes/new
  # GET /classes/new.xml
  def new
    @classe = Classe.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # GET /classes/1/edit
  def edit
    @classe = Classe.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # POST /classes
  # POST /classes.xml
  def create
    @classe = Classe.new(params[:classe])
    respond_to do |format|
      format.js do
        if @classe.save
          rwt_ok
        else
          rwt_err_messages(@classe)
        end
      end
    end
  end

  # PUT /classes/1
  # PUT /classes/1.xml
  def update
    @classe = Classe.find(params[:id])
    respond_to do |format|
      format.js do
        if @classe.update_attributes(params[:classe])
          rwt_ok
        else
          rwt_err_messages(@classe)
        end
      end
    end
  end

  # DELETE /classes/1
  # DELETE /classes/1.xml
  def destroy
    @classe = Classe.find(params[:id])
    if @classe.destroy
      rwt_ok
    else
      rwt_err_messages(@classe)
    end
  end


  protected

  def find_classes(filter)
  	pagination_state = update_pagination_state_with_params!(:classe)
  	Classe.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
  end

  def count(filter)
	  if filter == nil or filter.empty? then
  		Classe.count
  	else
  		Classe.count(:conditions=>"first like '%#{filter}%'")
  	end
  end
end
