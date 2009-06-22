require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classes/edit.html.erb" do
  include ClassesHelper
  
  before(:each) do
    assigns[:classe] = @classe = stub_model(Classe,
      :new_record? => false,
      :descricao => "value for descricao"
    )
  end

  it "renders the edit classe form" do
    render
    
    response.should have_tag("form[action=#{classe_path(@classe)}][method=post]") do
      with_tag('input#classe_descricao[name=?]', "classe[descricao]")
    end
  end
end


