require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/faixas_de_desconto/show.html.erb" do
  include FaixaDeDescontosHelper
  before(:each) do
    assigns[:faixa_de_desconto] = @faixa_de_desconto = stub_model(FaixaDeDesconto,
      :de => 1,
      :ate => 1,
      :desconto_permitido => 9.99
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
  end
end

