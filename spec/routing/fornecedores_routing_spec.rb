require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FornecedoresController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "fornecedores", :action => "index").should == "/fornecedores"
    end
  
    it "maps #new" do
      route_for(:controller => "fornecedores", :action => "new").should == "/fornecedores/new"
    end
  
    it "maps #show" do
      route_for(:controller => "fornecedores", :action => "show", :id => "1").should == "/fornecedores/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "fornecedores", :action => "edit", :id => "1").should == "/fornecedores/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "fornecedores", :action => "create").should == {:path => "/fornecedores", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "fornecedores", :action => "update", :id => "1").should == {:path =>"/fornecedores/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "fornecedores", :action => "destroy", :id => "1").should == {:path =>"/fornecedores/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/fornecedores").should == {:controller => "fornecedores", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/fornecedores/new").should == {:controller => "fornecedores", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/fornecedores").should == {:controller => "fornecedores", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/fornecedores/1").should == {:controller => "fornecedores", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/fornecedores/1/edit").should == {:controller => "fornecedores", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/fornecedores/1").should == {:controller => "fornecedores", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/fornecedores/1").should == {:controller => "fornecedores", :action => "destroy", :id => "1"}
    end
  end
end
