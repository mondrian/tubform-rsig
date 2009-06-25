require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classes/new.html.erb" do
  include ClassesHelper
  
  before(:each) do
    assigns[:classe] = stub_model(Classe,
      :new_record? => true,
      :descricao => "value for descricao"
    )
  end

  it "renders new classe form" do
    render
    
    response.should have_tag("form[action=?][method=post]", classes_path) do
      with_tag("input#classe_descricao[name=?]", "classe[descricao]")
    end
  end
end


