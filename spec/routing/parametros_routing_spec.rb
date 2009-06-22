require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ParametrosController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "parametros", :action => "index").should == "/parametros"
    end
  
    it "maps #new" do
      route_for(:controller => "parametros", :action => "new").should == "/parametros/new"
    end
  
    it "maps #show" do
      route_for(:controller => "parametros", :action => "show", :id => "1").should == "/parametros/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "parametros", :action => "edit", :id => "1").should == "/parametros/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "parametros", :action => "create").should == {:path => "/parametros", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "parametros", :action => "update", :id => "1").should == {:path =>"/parametros/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "parametros", :action => "destroy", :id => "1").should == {:path =>"/parametros/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/parametros").should == {:controller => "parametros", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/parametros/new").should == {:controller => "parametros", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/parametros").should == {:controller => "parametros", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/parametros/1").should == {:controller => "parametros", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/parametros/1/edit").should == {:controller => "parametros", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/parametros/1").should == {:controller => "parametros", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/parametros/1").should == {:controller => "parametros", :action => "destroy", :id => "1"}
    end
  end
end
