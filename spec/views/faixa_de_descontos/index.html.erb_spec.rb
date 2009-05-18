require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/faixas_de_desconto/index.html.erb" do
  include FaixaDeDescontosHelper
  
  before(:each) do
    assigns[:faixas_de_desconto] = [
      stub_model(FaixaDeDesconto,
        :de => 1,
        :ate => 1,
        :desconto_permitido => 9.99
      ),
      stub_model(FaixaDeDesconto,
        :de => 1,
        :ate => 1,
        :desconto_permitido => 9.99
      )
    ]
  end

  it "renders a list of faixas_de_desconto" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end

