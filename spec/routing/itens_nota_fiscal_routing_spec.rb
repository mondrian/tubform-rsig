require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItensNotaFiscalController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "itens_nota_fiscal", :action => "index").should == "/itens_nota_fiscal"
    end
  
    it "maps #new" do
      route_for(:controller => "itens_nota_fiscal", :action => "new").should == "/itens_nota_fiscal/new"
    end
  
    it "maps #show" do
      route_for(:controller => "itens_nota_fiscal", :action => "show", :id => "1").should == "/itens_nota_fiscal/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "itens_nota_fiscal", :action => "edit", :id => "1").should == "/itens_nota_fiscal/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "itens_nota_fiscal", :action => "create").should == {:path => "/itens_nota_fiscal", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "itens_nota_fiscal", :action => "update", :id => "1").should == {:path =>"/itens_nota_fiscal/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "itens_nota_fiscal", :action => "destroy", :id => "1").should == {:path =>"/itens_nota_fiscal/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/itens_nota_fiscal").should == {:controller => "itens_nota_fiscal", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/itens_nota_fiscal/new").should == {:controller => "itens_nota_fiscal", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/itens_nota_fiscal").should == {:controller => "itens_nota_fiscal", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/itens_nota_fiscal/1").should == {:controller => "itens_nota_fiscal", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/itens_nota_fiscal/1/edit").should == {:controller => "itens_nota_fiscal", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/itens_nota_fiscal/1").should == {:controller => "itens_nota_fiscal", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/itens_nota_fiscal/1").should == {:controller => "itens_nota_fiscal", :action => "destroy", :id => "1"}
    end
  end
end
