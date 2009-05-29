require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProdutoKitsController do

  def mock_produto_kit(stubs={})
    @mock_produto_kit ||= mock_model(ProdutoKit, stubs)
  end
  
  describe "GET index" do
    it "assigns all produto_kits as @produto_kits" do
      ProdutoKit.stub!(:find).with(:all).and_return([mock_produto_kit])
      get :index
      assigns[:produto_kits].should == [mock_produto_kit]
    end
  end

  describe "GET show" do
    it "assigns the requested produto_kit as @produto_kit" do
      ProdutoKit.stub!(:find).with("37").and_return(mock_produto_kit)
      get :show, :id => "37"
      assigns[:produto_kit].should equal(mock_produto_kit)
    end
  end

  describe "GET new" do
    it "assigns a new produto_kit as @produto_kit" do
      ProdutoKit.stub!(:new).and_return(mock_produto_kit)
      get :new
      assigns[:produto_kit].should equal(mock_produto_kit)
    end
  end

  describe "GET edit" do
    it "assigns the requested produto_kit as @produto_kit" do
      ProdutoKit.stub!(:find).with("37").and_return(mock_produto_kit)
      get :edit, :id => "37"
      assigns[:produto_kit].should equal(mock_produto_kit)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created produto_kit as @produto_kit" do
        ProdutoKit.stub!(:new).with({'these' => 'params'}).and_return(mock_produto_kit(:save => true))
        post :create, :produto_kit => {:these => 'params'}
        assigns[:produto_kit].should equal(mock_produto_kit)
      end

      it "redirects to the created produto_kit" do
        ProdutoKit.stub!(:new).and_return(mock_produto_kit(:save => true))
        post :create, :produto_kit => {}
        response.should redirect_to(produto_kit_url(mock_produto_kit))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved produto_kit as @produto_kit" do
        ProdutoKit.stub!(:new).with({'these' => 'params'}).and_return(mock_produto_kit(:save => false))
        post :create, :produto_kit => {:these => 'params'}
        assigns[:produto_kit].should equal(mock_produto_kit)
      end

      it "re-renders the 'new' template" do
        ProdutoKit.stub!(:new).and_return(mock_produto_kit(:save => false))
        post :create, :produto_kit => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested produto_kit" do
        ProdutoKit.should_receive(:find).with("37").and_return(mock_produto_kit)
        mock_produto_kit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :produto_kit => {:these => 'params'}
      end

      it "assigns the requested produto_kit as @produto_kit" do
        ProdutoKit.stub!(:find).and_return(mock_produto_kit(:update_attributes => true))
        put :update, :id => "1"
        assigns[:produto_kit].should equal(mock_produto_kit)
      end

      it "redirects to the produto_kit" do
        ProdutoKit.stub!(:find).and_return(mock_produto_kit(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(produto_kit_url(mock_produto_kit))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested produto_kit" do
        ProdutoKit.should_receive(:find).with("37").and_return(mock_produto_kit)
        mock_produto_kit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :produto_kit => {:these => 'params'}
      end

      it "assigns the produto_kit as @produto_kit" do
        ProdutoKit.stub!(:find).and_return(mock_produto_kit(:update_attributes => false))
        put :update, :id => "1"
        assigns[:produto_kit].should equal(mock_produto_kit)
      end

      it "re-renders the 'edit' template" do
        ProdutoKit.stub!(:find).and_return(mock_produto_kit(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested produto_kit" do
      ProdutoKit.should_receive(:find).with("37").and_return(mock_produto_kit)
      mock_produto_kit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the produto_kits list" do
      ProdutoKit.stub!(:find).and_return(mock_produto_kit(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(produto_kits_url)
    end
  end

end
