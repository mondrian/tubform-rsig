require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PedidosController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "pedidos", :action => "index").should == "/pedidos"
    end
  
    it "maps #new" do
      route_for(:controller => "pedidos", :action => "new").should == "/pedidos/new"
    end
  
    it "maps #show" do
      route_for(:controller => "pedidos", :action => "show", :id => "1").should == "/pedidos/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "pedidos", :action => "edit", :id => "1").should == "/pedidos/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "pedidos", :action => "create").should == {:path => "/pedidos", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "pedidos", :action => "update", :id => "1").should == {:path =>"/pedidos/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "pedidos", :action => "destroy", :id => "1").should == {:path =>"/pedidos/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/pedidos").should == {:controller => "pedidos", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/pedidos/new").should == {:controller => "pedidos", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/pedidos").should == {:controller => "pedidos", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/pedidos/1").should == {:controller => "pedidos", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/pedidos/1/edit").should == {:controller => "pedidos", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/pedidos/1").should == {:controller => "pedidos", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/pedidos/1").should == {:controller => "pedidos", :action => "destroy", :id => "1"}
    end
  end
end
