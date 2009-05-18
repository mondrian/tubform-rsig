require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FaixaDeDescontosController do

  def mock_faixa_de_desconto(stubs={})
    @mock_faixa_de_desconto ||= mock_model(FaixaDeDesconto, stubs)
  end
  
  describe "GET index" do
    it "assigns all faixas_de_descontos as @faixas_de_descontos" do
      FaixaDeDesconto.stub!(:find).with(:all).and_return([mock_faixa_de_desconto])
      get :index
      assigns[:faixas_de_desconto].should == [mock_faixa_de_desconto]
    end
  end

  describe "GET show" do
    it "assigns the requested faixa_de_desconto as @faixa_de_desconto" do
      FaixaDeDesconto.stub!(:find).with("37").and_return(mock_faixa_de_desconto)
      get :show, :id => "37"
      assigns[:faixa_de_desconto].should equal(mock_faixa_de_desconto)
    end
  end

  describe "GET new" do
    it "assigns a new faixa_de_desconto as @faixa_de_desconto" do
      FaixaDeDesconto.stub!(:new).and_return(mock_faixa_de_desconto)
      get :new
      assigns[:faixa_de_desconto].should equal(mock_faixa_de_desconto)
    end
  end

  describe "GET edit" do
    it "assigns the requested faixa_de_desconto as @faixa_de_desconto" do
      FaixaDeDesconto.stub!(:find).with("37").and_return(mock_faixa_de_desconto)
      get :edit, :id => "37"
      assigns[:faixa_de_desconto].should equal(mock_faixa_de_desconto)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created faixa_de_desconto as @faixa_de_desconto" do
        FaixaDeDesconto.stub!(:new).with({'these' => 'params'}).and_return(mock_faixa_de_desconto(:save => true))
        post :create, :faixa_de_desconto => {:these => 'params'}
        assigns[:faixa_de_desconto].should equal(mock_faixa_de_desconto)
      end

      it "redirects to the created faixa_de_desconto" do
        FaixaDeDesconto.stub!(:new).and_return(mock_faixa_de_desconto(:save => true))
        post :create, :faixa_de_desconto => {}
        response.should redirect_to(faixa_de_desconto_url(mock_faixa_de_desconto))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved faixa_de_desconto as @faixa_de_desconto" do
        FaixaDeDesconto.stub!(:new).with({'these' => 'params'}).and_return(mock_faixa_de_desconto(:save => false))
        post :create, :faixa_de_desconto => {:these => 'params'}
        assigns[:faixa_de_desconto].should equal(mock_faixa_de_desconto)
      end

      it "re-renders the 'new' template" do
        FaixaDeDesconto.stub!(:new).and_return(mock_faixa_de_desconto(:save => false))
        post :create, :faixa_de_desconto => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested faixa_de_desconto" do
        FaixaDeDesconto.should_receive(:find).with("37").and_return(mock_faixa_de_desconto)
        mock_faixa_de_desconto.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :faixa_de_desconto => {:these => 'params'}
      end

      it "assigns the requested faixa_de_desconto as @faixa_de_desconto" do
        FaixaDeDesconto.stub!(:find).and_return(mock_faixa_de_desconto(:update_attributes => true))
        put :update, :id => "1"
        assigns[:faixa_de_desconto].should equal(mock_faixa_de_desconto)
      end

      it "redirects to the faixa_de_desconto" do
        FaixaDeDesconto.stub!(:find).and_return(mock_faixa_de_desconto(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(faixa_de_desconto_url(mock_faixa_de_desconto))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested faixa_de_desconto" do
        FaixaDeDesconto.should_receive(:find).with("37").and_return(mock_faixa_de_desconto)
        mock_faixa_de_desconto.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :faixa_de_desconto => {:these => 'params'}
      end

      it "assigns the faixa_de_desconto as @faixa_de_desconto" do
        FaixaDeDesconto.stub!(:find).and_return(mock_faixa_de_desconto(:update_attributes => false))
        put :update, :id => "1"
        assigns[:faixa_de_desconto].should equal(mock_faixa_de_desconto)
      end

      it "re-renders the 'edit' template" do
        FaixaDeDesconto.stub!(:find).and_return(mock_faixa_de_desconto(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested faixa_de_desconto" do
      FaixaDeDesconto.should_receive(:find).with("37").and_return(mock_faixa_de_desconto)
      mock_faixa_de_desconto.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the faixas_de_desconto list" do
      FaixaDeDesconto.stub!(:find).and_return(mock_faixa_de_desconto(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(faixas_de_desconto_url)
    end
  end

end
