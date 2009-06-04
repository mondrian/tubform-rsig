require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItensNotaFiscalController do

  def mock_item_nota_fiscal(stubs={})
    @mock_item_nota_fiscal ||= mock_model(ItemNotaFiscal, stubs)
  end
  
  describe "GET index" do
    it "assigns all itens_notas_fiscais as @itens_notas_fiscais" do
      ItemNotaFiscal.stub!(:find).with(:all).and_return([mock_item_nota_fiscal])
      get :index
      assigns[:itens_nota_fiscal].should == [mock_item_nota_fiscal]
    end
  end

  describe "GET show" do
    it "assigns the requested item_nota_fiscal as @item_nota_fiscal" do
      ItemNotaFiscal.stub!(:find).with("37").and_return(mock_item_nota_fiscal)
      get :show, :id => "37"
      assigns[:item_nota_fiscal].should equal(mock_item_nota_fiscal)
    end
  end

  describe "GET new" do
    it "assigns a new item_nota_fiscal as @item_nota_fiscal" do
      ItemNotaFiscal.stub!(:new).and_return(mock_item_nota_fiscal)
      get :new
      assigns[:item_nota_fiscal].should equal(mock_item_nota_fiscal)
    end
  end

  describe "GET edit" do
    it "assigns the requested item_nota_fiscal as @item_nota_fiscal" do
      ItemNotaFiscal.stub!(:find).with("37").and_return(mock_item_nota_fiscal)
      get :edit, :id => "37"
      assigns[:item_nota_fiscal].should equal(mock_item_nota_fiscal)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created item_nota_fiscal as @item_nota_fiscal" do
        ItemNotaFiscal.stub!(:new).with({'these' => 'params'}).and_return(mock_item_nota_fiscal(:save => true))
        post :create, :item_nota_fiscal => {:these => 'params'}
        assigns[:item_nota_fiscal].should equal(mock_item_nota_fiscal)
      end

      it "redirects to the created item_nota_fiscal" do
        ItemNotaFiscal.stub!(:new).and_return(mock_item_nota_fiscal(:save => true))
        post :create, :item_nota_fiscal => {}
        response.should redirect_to(item_nota_fiscal_url(mock_item_nota_fiscal))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved item_nota_fiscal as @item_nota_fiscal" do
        ItemNotaFiscal.stub!(:new).with({'these' => 'params'}).and_return(mock_item_nota_fiscal(:save => false))
        post :create, :item_nota_fiscal => {:these => 'params'}
        assigns[:item_nota_fiscal].should equal(mock_item_nota_fiscal)
      end

      it "re-renders the 'new' template" do
        ItemNotaFiscal.stub!(:new).and_return(mock_item_nota_fiscal(:save => false))
        post :create, :item_nota_fiscal => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested item_nota_fiscal" do
        ItemNotaFiscal.should_receive(:find).with("37").and_return(mock_item_nota_fiscal)
        mock_item_nota_fiscal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_nota_fiscal => {:these => 'params'}
      end

      it "assigns the requested item_nota_fiscal as @item_nota_fiscal" do
        ItemNotaFiscal.stub!(:find).and_return(mock_item_nota_fiscal(:update_attributes => true))
        put :update, :id => "1"
        assigns[:item_nota_fiscal].should equal(mock_item_nota_fiscal)
      end

      it "redirects to the item_nota_fiscal" do
        ItemNotaFiscal.stub!(:find).and_return(mock_item_nota_fiscal(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(item_nota_fiscal_url(mock_item_nota_fiscal))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested item_nota_fiscal" do
        ItemNotaFiscal.should_receive(:find).with("37").and_return(mock_item_nota_fiscal)
        mock_item_nota_fiscal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :item_nota_fiscal => {:these => 'params'}
      end

      it "assigns the item_nota_fiscal as @item_nota_fiscal" do
        ItemNotaFiscal.stub!(:find).and_return(mock_item_nota_fiscal(:update_attributes => false))
        put :update, :id => "1"
        assigns[:item_nota_fiscal].should equal(mock_item_nota_fiscal)
      end

      it "re-renders the 'edit' template" do
        ItemNotaFiscal.stub!(:find).and_return(mock_item_nota_fiscal(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested item_nota_fiscal" do
      ItemNotaFiscal.should_receive(:find).with("37").and_return(mock_item_nota_fiscal)
      mock_item_nota_fiscal.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the itens_nota_fiscal list" do
      ItemNotaFiscal.stub!(:find).and_return(mock_item_nota_fiscal(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(itens_nota_fiscal_url)
    end
  end

end
