require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PedidosController do

  def mock_pedido(stubs={})
    @mock_pedido ||= mock_model(Pedido, stubs)
  end
  
  describe "GET index" do
    it "assigns all pedidos as @pedidos" do
      Pedido.stub!(:find).with(:all).and_return([mock_pedido])
      get :index
      assigns[:pedidos].should == [mock_pedido]
    end
  end

  describe "GET show" do
    it "assigns the requested pedido as @pedido" do
      Pedido.stub!(:find).with("37").and_return(mock_pedido)
      get :show, :id => "37"
      assigns[:pedido].should equal(mock_pedido)
    end
  end

  describe "GET new" do
    it "assigns a new pedido as @pedido" do
      Pedido.stub!(:new).and_return(mock_pedido)
      get :new
      assigns[:pedido].should equal(mock_pedido)
    end
  end

  describe "GET edit" do
    it "assigns the requested pedido as @pedido" do
      Pedido.stub!(:find).with("37").and_return(mock_pedido)
      get :edit, :id => "37"
      assigns[:pedido].should equal(mock_pedido)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created pedido as @pedido" do
        Pedido.stub!(:new).with({'these' => 'params'}).and_return(mock_pedido(:save => true))
        post :create, :pedido => {:these => 'params'}
        assigns[:pedido].should equal(mock_pedido)
      end

      it "redirects to the created pedido" do
        Pedido.stub!(:new).and_return(mock_pedido(:save => true))
        post :create, :pedido => {}
        response.should redirect_to(pedido_url(mock_pedido))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved pedido as @pedido" do
        Pedido.stub!(:new).with({'these' => 'params'}).and_return(mock_pedido(:save => false))
        post :create, :pedido => {:these => 'params'}
        assigns[:pedido].should equal(mock_pedido)
      end

      it "re-renders the 'new' template" do
        Pedido.stub!(:new).and_return(mock_pedido(:save => false))
        post :create, :pedido => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested pedido" do
        Pedido.should_receive(:find).with("37").and_return(mock_pedido)
        mock_pedido.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pedido => {:these => 'params'}
      end

      it "assigns the requested pedido as @pedido" do
        Pedido.stub!(:find).and_return(mock_pedido(:update_attributes => true))
        put :update, :id => "1"
        assigns[:pedido].should equal(mock_pedido)
      end

      it "redirects to the pedido" do
        Pedido.stub!(:find).and_return(mock_pedido(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(pedido_url(mock_pedido))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested pedido" do
        Pedido.should_receive(:find).with("37").and_return(mock_pedido)
        mock_pedido.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pedido => {:these => 'params'}
      end

      it "assigns the pedido as @pedido" do
        Pedido.stub!(:find).and_return(mock_pedido(:update_attributes => false))
        put :update, :id => "1"
        assigns[:pedido].should equal(mock_pedido)
      end

      it "re-renders the 'edit' template" do
        Pedido.stub!(:find).and_return(mock_pedido(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested pedido" do
      Pedido.should_receive(:find).with("37").and_return(mock_pedido)
      mock_pedido.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the pedidos list" do
      Pedido.stub!(:find).and_return(mock_pedido(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(pedidos_url)
    end
  end

end
