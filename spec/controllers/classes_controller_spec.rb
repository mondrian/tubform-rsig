require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClassesController do

  def mock_classe(stubs={})
    @mock_classe ||= mock_model(Classe, stubs)
  end
  
  describe "GET index" do
    it "assigns all classes as @classes" do
      Classe.stub!(:find).with(:all).and_return([mock_classe])
      get :index
      assigns[:classes].should == [mock_classe]
    end
  end

  describe "GET show" do
    it "assigns the requested classe as @classe" do
      Classe.stub!(:find).with("37").and_return(mock_classe)
      get :show, :id => "37"
      assigns[:classe].should equal(mock_classe)
    end
  end

  describe "GET new" do
    it "assigns a new classe as @classe" do
      Classe.stub!(:new).and_return(mock_classe)
      get :new
      assigns[:classe].should equal(mock_classe)
    end
  end

  describe "GET edit" do
    it "assigns the requested classe as @classe" do
      Classe.stub!(:find).with("37").and_return(mock_classe)
      get :edit, :id => "37"
      assigns[:classe].should equal(mock_classe)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created classe as @classe" do
        Classe.stub!(:new).with({'these' => 'params'}).and_return(mock_classe(:save => true))
        post :create, :classe => {:these => 'params'}
        assigns[:classe].should equal(mock_classe)
      end

      it "redirects to the created classe" do
        Classe.stub!(:new).and_return(mock_classe(:save => true))
        post :create, :classe => {}
        response.should redirect_to(class_url(mock_classe))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved classe as @classe" do
        Classe.stub!(:new).with({'these' => 'params'}).and_return(mock_classe(:save => false))
        post :create, :classe => {:these => 'params'}
        assigns[:classe].should equal(mock_classe)
      end

      it "re-renders the 'new' template" do
        Classe.stub!(:new).and_return(mock_classe(:save => false))
        post :create, :classe => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested classe" do
        Classe.should_receive(:find).with("37").and_return(mock_classe)
        mock_classe.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :classe => {:these => 'params'}
      end

      it "assigns the requested classe as @classe" do
        Classe.stub!(:find).and_return(mock_classe(:update_attributes => true))
        put :update, :id => "1"
        assigns[:classe].should equal(mock_classe)
      end

      it "redirects to the classe" do
        Classe.stub!(:find).and_return(mock_classe(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(class_url(mock_classe))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested classe" do
        Classe.should_receive(:find).with("37").and_return(mock_classe)
        mock_classe.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :classe => {:these => 'params'}
      end

      it "assigns the classe as @classe" do
        Classe.stub!(:find).and_return(mock_classe(:update_attributes => false))
        put :update, :id => "1"
        assigns[:classe].should equal(mock_classe)
      end

      it "re-renders the 'edit' template" do
        Classe.stub!(:find).and_return(mock_classe(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested classe" do
      Classe.should_receive(:find).with("37").and_return(mock_classe)
      mock_classe.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the classes list" do
      Classe.stub!(:find).and_return(mock_classe(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(classes_url)
    end
  end

end
