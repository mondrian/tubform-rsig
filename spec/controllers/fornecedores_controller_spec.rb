require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FornecedoresController do

  def mock_fornecedor(stubs={})
    @mock_fornecedor ||= mock_model(Fornecedor, stubs)
  end
  
  describe "GET index" do
    it "assigns all fornecedores as @fornecedores" do
      Fornecedor.stub!(:find).with(:all).and_return([mock_fornecedor])
      get :index
      assigns[:fornecedores].should == [mock_fornecedor]
    end
  end

  describe "GET show" do
    it "assigns the requested fornecedor as @fornecedor" do
      Fornecedor.stub!(:find).with("37").and_return(mock_fornecedor)
      get :show, :id => "37"
      assigns[:fornecedor].should equal(mock_fornecedor)
    end
  end

  describe "GET new" do
    it "assigns a new fornecedor as @fornecedor" do
      Fornecedor.stub!(:new).and_return(mock_fornecedor)
      get :new
      assigns[:fornecedor].should equal(mock_fornecedor)
    end
  end

  describe "GET edit" do
    it "assigns the requested fornecedor as @fornecedor" do
      Fornecedor.stub!(:find).with("37").and_return(mock_fornecedor)
      get :edit, :id => "37"
      assigns[:fornecedor].should equal(mock_fornecedor)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created fornecedor as @fornecedor" do
        Fornecedor.stub!(:new).with({'these' => 'params'}).and_return(mock_fornecedor(:save => true))
        post :create, :fornecedor => {:these => 'params'}
        assigns[:fornecedor].should equal(mock_fornecedor)
      end

      it "redirects to the created fornecedor" do
        Fornecedor.stub!(:new).and_return(mock_fornecedor(:save => true))
        post :create, :fornecedor => {}
        response.should redirect_to(fornecedor_url(mock_fornecedor))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved fornecedor as @fornecedor" do
        Fornecedor.stub!(:new).with({'these' => 'params'}).and_return(mock_fornecedor(:save => false))
        post :create, :fornecedor => {:these => 'params'}
        assigns[:fornecedor].should equal(mock_fornecedor)
      end

      it "re-renders the 'new' template" do
        Fornecedor.stub!(:new).and_return(mock_fornecedor(:save => false))
        post :create, :fornecedor => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested fornecedor" do
        Fornecedor.should_receive(:find).with("37").and_return(mock_fornecedor)
        mock_fornecedor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fornecedor => {:these => 'params'}
      end

      it "assigns the requested fornecedor as @fornecedor" do
        Fornecedor.stub!(:find).and_return(mock_fornecedor(:update_attributes => true))
        put :update, :id => "1"
        assigns[:fornecedor].should equal(mock_fornecedor)
      end

      it "redirects to the fornecedor" do
        Fornecedor.stub!(:find).and_return(mock_fornecedor(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(fornecedor_url(mock_fornecedor))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested fornecedor" do
        Fornecedor.should_receive(:find).with("37").and_return(mock_fornecedor)
        mock_fornecedor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fornecedor => {:these => 'params'}
      end

      it "assigns the fornecedor as @fornecedor" do
        Fornecedor.stub!(:find).and_return(mock_fornecedor(:update_attributes => false))
        put :update, :id => "1"
        assigns[:fornecedor].should equal(mock_fornecedor)
      end

      it "re-renders the 'edit' template" do
        Fornecedor.stub!(:find).and_return(mock_fornecedor(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested fornecedor" do
      Fornecedor.should_receive(:find).with("37").and_return(mock_fornecedor)
      mock_fornecedor.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the fornecedores list" do
      Fornecedor.stub!(:find).and_return(mock_fornecedor(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(fornecedores_url)
    end
  end

end
