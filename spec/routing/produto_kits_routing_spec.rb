require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProdutoKitsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "produto_kits", :action => "index").should == "/produto_kits"
    end
  
    it "maps #new" do
      route_for(:controller => "produto_kits", :action => "new").should == "/produto_kits/new"
    end
  
    it "maps #show" do
      route_for(:controller => "produto_kits", :action => "show", :id => "1").should == "/produto_kits/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "produto_kits", :action => "edit", :id => "1").should == "/produto_kits/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "produto_kits", :action => "create").should == {:path => "/produto_kits", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "produto_kits", :action => "update", :id => "1").should == {:path =>"/produto_kits/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "produto_kits", :action => "destroy", :id => "1").should == {:path =>"/produto_kits/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/produto_kits").should == {:controller => "produto_kits", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/produto_kits/new").should == {:controller => "produto_kits", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/produto_kits").should == {:controller => "produto_kits", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/produto_kits/1").should == {:controller => "produto_kits", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/produto_kits/1/edit").should == {:controller => "produto_kits", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/produto_kits/1").should == {:controller => "produto_kits", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/produto_kits/1").should == {:controller => "produto_kits", :action => "destroy", :id => "1"}
    end
  end
end
