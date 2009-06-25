require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ParametrosController do

  def mock_parametro(stubs={})
    @mock_parametro ||= mock_model(Parametro, stubs)
  end
  
  describe "GET index" do
    it "assigns all parametros as @parametros" do
      Parametro.stub!(:find).with(:all).and_return([mock_parametro])
      get :index
      assigns[:parametros].should == [mock_parametro]
    end
  end

  describe "GET show" do
    it "assigns the requested parametro as @parametro" do
      Parametro.stub!(:find).with("37").and_return(mock_parametro)
      get :show, :id => "37"
      assigns[:parametro].should equal(mock_parametro)
    end
  end

  describe "GET new" do
    it "assigns a new parametro as @parametro" do
      Parametro.stub!(:new).and_return(mock_parametro)
      get :new
      assigns[:parametro].should equal(mock_parametro)
    end
  end

  describe "GET edit" do
    it "assigns the requested parametro as @parametro" do
      Parametro.stub!(:find).with("37").and_return(mock_parametro)
      get :edit, :id => "37"
      assigns[:parametro].should equal(mock_parametro)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created parametro as @parametro" do
        Parametro.stub!(:new).with({'these' => 'params'}).and_return(mock_parametro(:save => true))
        post :create, :parametro => {:these => 'params'}
        assigns[:parametro].should equal(mock_parametro)
      end

      it "redirects to the created parametro" do
        Parametro.stub!(:new).and_return(mock_parametro(:save => true))
        post :create, :parametro => {}
        response.should redirect_to(parametro_url(mock_parametro))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved parametro as @parametro" do
        Parametro.stub!(:new).with({'these' => 'params'}).and_return(mock_parametro(:save => false))
        post :create, :parametro => {:these => 'params'}
        assigns[:parametro].should equal(mock_parametro)
      end

      it "re-renders the 'new' template" do
        Parametro.stub!(:new).and_return(mock_parametro(:save => false))
        post :create, :parametro => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested parametro" do
        Parametro.should_receive(:find).with("37").and_return(mock_parametro)
        mock_parametro.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :parametro => {:these => 'params'}
      end

      it "assigns the requested parametro as @parametro" do
        Parametro.stub!(:find).and_return(mock_parametro(:update_attributes => true))
        put :update, :id => "1"
        assigns[:parametro].should equal(mock_parametro)
      end

      it "redirects to the parametro" do
        Parametro.stub!(:find).and_return(mock_parametro(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(parametro_url(mock_parametro))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested parametro" do
        Parametro.should_receive(:find).with("37").and_return(mock_parametro)
        mock_parametro.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :parametro => {:these => 'params'}
      end

      it "assigns the parametro as @parametro" do
        Parametro.stub!(:find).and_return(mock_parametro(:update_attributes => false))
        put :update, :id => "1"
        assigns[:parametro].should equal(mock_parametro)
      end

      it "re-renders the 'edit' template" do
        Parametro.stub!(:find).and_return(mock_parametro(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested parametro" do
      Parametro.should_receive(:find).with("37").and_return(mock_parametro)
      mock_parametro.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the parametros list" do
      Parametro.stub!(:find).and_return(mock_parametro(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(parametros_url)
    end
  end

end
