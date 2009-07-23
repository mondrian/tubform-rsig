class DuplicatasController < ApplicationController
  # GET /duplicatas
  # GET /duplicatas.xml
  def index
    respond_to do |format|
      format.js {rwt_render}
      format.json { render :json => find_duplicatas(params[:filter]).to_ext_json(:class=>:duplicata, :count => count(params[:fields])) }
    end
  end

  # GET /duplicatas/new
  # GET /duplicatas/new.xml
  def new
    @duplicata = Duplicata.new
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # GET /duplicatas/1/edit
  def edit
    @duplicata = Duplicata.find(params[:id])
    respond_to do |format|
      format.js {rwt_render}
    end
  end

  # POST /duplicatas
  # POST /duplicatas.xml
  def create
    @duplicata = Duplicata.new(params[:duplicata])
    respond_to do |format|
      format.js do
        if @duplicata.save
          rwt_ok
        else
          rwt_err_messages(@duplicata)
        end
      end
    end
  end

  # PUT /duplicatas/1
  # PUT /duplicatas/1.xml
  def update
    @duplicata = Duplicata.find(params[:id])
    respond_to do |format|
      format.js do
        if @duplicata.update_attributes(params[:duplicata])
          rwt_ok
        else
          rwt_err_messages(@duplicata)
        end
      end
    end
  end

  # DELETE /duplicatas/1
  # DELETE /duplicatas/1.xml
  def destroy
    @duplicata = Duplicata.find(params[:id])
    if @duplicata.destroy
      rwt_ok
    else
      rwt_err_messages(@duplicata)
    end
  end


  protected

  def find_duplicatas(filter)
  	pagination_state = update_pagination_state_with_params!(:duplicata)
  	Duplicata.find(:all, options_from_pagination_state(pagination_state).merge(:conditions=>["first like ?","%#{filter}%"]))
  end

  def count(filter)
	  if filter == nil or filter.empty? then
  		Duplicata.count
  	else
  		Duplicata.count(:conditions=>"first like '%#{filter}%'")
  	end
  end
end
