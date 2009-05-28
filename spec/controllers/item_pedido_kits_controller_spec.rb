require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemPedidoKitsController do

  def mock_item_pedido_kit(stubs={})
    @mock_item_pedido_kit ||= mock_model(ItemPedidoKit, stubs)
  end
  
  describe "GET index" do
    it "assigns all item_pedido_kits as @item_pedido_kits" do
      ItemPedidoKit.stub!(:find).with(:all).and_return([mock_item_pedido_kit])
      get :index
      assigns[:item_pedido_kits].should == [mock_item_pedido_kit]
    end
  end

  describe "GET show" do
    it "assigns the requested item_pedido_kit as @item_pedido_kit" do
      ItemPedidoKit.stub!(:find).with("37").and_return(mock_item_pedido_kit)
      get :show, :id => "37"
      assigns[:item_pedido_kit].should equal(mock_item_pedido_kit)
    end
  end

  describe "GET new" do
    it "assigns a new item_pedido_kit as @item_pedido_kit" do
      ItemPedidoKit.stub!(:new).and_return(mock_item_pedido_kit)
      get :new
      assigns[:item_pedido_kit].should equal(mock_item_pedido_kit)
    end
  end

  describe "GET edit" do
    it "assigns the requested item_pedido_kit as @item_pedido_kit" do
      ItemPedidoKit.stub!(:find).with("37").and_return(mock_item_pedido_kit)
      get :edit, :id => "37"
      assigns[:item_pedido_kit].should equal(mock_item_pedido_kit)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created item_pedido_kit as @item_pedido_kit" do
        ItemPedidoKit.stub!(:new).with({'these' => 'params'}).and_return(mock_item_pedido_kit(:save => true))
        post :create, :item_pedido_kit => {:these => 'params'}
        assigns[:item_pedido_kit].should equal(mock_item_pedido_kit)
      end

      it "redirects to the created item_pedido_kit" do
        ItemPedidoKit.stub!(:new).and_return(mock_item_pedido_kit(:save => true))
        post :create, :item_pedido_kit => {}
        response.should redirect_to(item_pedido_kit_url(mock_item_pedido_kit))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved item_pedido_kit as @item_pedido_kit" do
        ItemPedidoKit.stub!(:new).with({'these' => 'params'}).and_return(mock_item_pedido_kit(:save => false))
        post :create, :item_pedido_kit => {:these => 'params'}
        assigns[:item_pedido_kit].should equal(mock_item_pedido_kit)
      end

      it "re-renders the 'new' template" do
        ItemPedidoKit.stub!(:new).and_return(mock_item_pedido_kit(:save => false))
        post :create, :item_pedido_kit => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested item_pedido_kit" do
        ItemPedidoKit.should_receive(:find).with("37").and_return(mock_item_pedido_kit)
        mock_item_pedido_kit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_pedido_kit => {:these => 'params'}
      end

      it "assigns the requested item_pedido_kit as @item_pedido_kit" do
        ItemPedidoKit.stub!(:find).and_return(mock_item_pedido_kit(:update_attributes => true))
        put :update, :id => "1"
        assigns[:item_pedido_kit].should equal(mock_item_pedido_kit)
      end

      it "redirects to the item_pedido_kit" do
        ItemPedidoKit.stub!(:find).and_return(mock_item_pedido_kit(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(item_pedido_kit_url(mock_item_pedido_kit))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested item_pedido_kit" do
        ItemPedidoKit.should_receive(:find).with("37").and_return(mock_item_pedido_kit)
        mock_item_pedido_kit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_pedido_kit => {:these => 'params'}
      end

      it "assigns the item_pedido_kit as @item_pedido_kit" do
        ItemPedidoKit.stub!(:find).and_return(mock_item_pedido_kit(:update_attributes => false))
        put :update, :id => "1"
        assigns[:item_pedido_kit].should equal(mock_item_pedido_kit)
      end

      it "re-renders the 'edit' template" do
        ItemPedidoKit.stub!(:find).and_return(mock_item_pedido_kit(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested item_pedido_kit" do
      ItemPedidoKit.should_receive(:find).with("37").and_return(mock_item_pedido_kit)
      mock_item_pedido_kit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the item_pedido_kits list" do
      ItemPedidoKit.stub!(:find).and_return(mock_item_pedido_kit(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(item_pedido_kits_url)
    end
  end

end
