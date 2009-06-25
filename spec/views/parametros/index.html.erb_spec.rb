require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/parametros/index.html.erb" do
  include ParametrosHelper
  
  before(:each) do
    assigns[:parametros] = [
      stub_model(Parametro,
        :chave => "value for chave",
        :valor => "value for valor",
        :descricao => "value for descricao",
        :empresa_id => 1
      ),
      stub_model(Parametro,
        :chave => "value for chave",
        :valor => "value for valor",
        :descricao => "value for descricao",
        :empresa_id => 1
      )
    ]
  end

  it "renders a list of parametros" do
    render
    response.should have_tag("tr>td", "value for chave".to_s, 2)
    response.should have_tag("tr>td", "value for valor".to_s, 2)
    response.should have_tag("tr>td", "value for descricao".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

