class DuplicatasController < ApplicationController
  # GET /duplicatas
  # GET /duplicatas.xml
  def index
    @duplicatas = Duplicata.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @duplicatas }
    end
  end

  # GET /duplicatas/1
  # GET /duplicatas/1.xml
  def show
    @duplicata = Duplicata.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @duplicata }
    end
  end

  # GET /duplicatas/new
  # GET /duplicatas/new.xml
  def new
    @duplicata = Duplicata.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @duplicata }
    end
  end

  # GET /duplicatas/1/edit
  def edit
    @duplicata = Duplicata.find(params[:id])
  end

  # POST /duplicatas
  # POST /duplicatas.xml
  def create
    @duplicata = Duplicata.new(params[:duplicata])

    respond_to do |format|
      if @duplicata.save
        flash[:notice] = 'Duplicata was successfully created.'
        format.html { redirect_to(@duplicata) }
        format.xml  { render :xml => @duplicata, :status => :created, :location => @duplicata }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @duplicata.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /duplicatas/1
  # PUT /duplicatas/1.xml
  def update
    @duplicata = Duplicata.find(params[:id])

    respond_to do |format|
      if @duplicata.update_attributes(params[:duplicata])
        flash[:notice] = 'Duplicata was successfully updated.'
        format.html { redirect_to(@duplicata) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @duplicata.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /duplicatas/1
  # DELETE /duplicatas/1.xml
  def destroy
    @duplicata = Duplicata.find(params[:id])
    @duplicata.destroy

    respond_to do |format|
      format.html { redirect_to(duplicatas_url) }
      format.xml  { head :ok }
    end
  end
end
