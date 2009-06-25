require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classes/index.html.erb" do
  include ClassesHelper
  
  before(:each) do
    assigns[:classes] = [
      stub_model(Classe,
        :descricao => "value for descricao"
      ),
      stub_model(Classe,
        :descricao => "value for descricao"
      )
    ]
  end

  it "renders a list of classes" do
    render
    response.should have_tag("tr>td", "value for descricao".to_s, 2)
  end
end

