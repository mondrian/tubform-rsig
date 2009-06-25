require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClassesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "classes", :action => "index").should == "/classes"
    end
  
    it "maps #new" do
      route_for(:controller => "classes", :action => "new").should == "/classes/new"
    end
  
    it "maps #show" do
      route_for(:controller => "classes", :action => "show", :id => "1").should == "/classes/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "classes", :action => "edit", :id => "1").should == "/classes/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "classes", :action => "create").should == {:path => "/classes", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "classes", :action => "update", :id => "1").should == {:path =>"/classes/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "classes", :action => "destroy", :id => "1").should == {:path =>"/classes/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/classes").should == {:controller => "classes", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/classes/new").should == {:controller => "classes", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/classes").should == {:controller => "classes", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/classes/1").should == {:controller => "classes", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/classes/1/edit").should == {:controller => "classes", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/classes/1").should == {:controller => "classes", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/classes/1").should == {:controller => "classes", :action => "destroy", :id => "1"}
    end
  end
end
