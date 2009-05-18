require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/faixas_de_desconto/new.html.erb" do
  include FaixaDeDescontosHelper
  
  before(:each) do
    assigns[:faixa_de_desconto] = stub_model(FaixaDeDesconto,
      :new_record? => true,
      :de => 1,
      :ate => 1,
      :desconto_permitido => 9.99
    )
  end

  it "renders new faixa_de_desconto form" do
    render
    
    response.should have_tag("form[action=?][method=post]", faixas_de_desconto_path) do
      with_tag("input#faixa_de_desconto_de[name=?]", "faixa_de_desconto[de]")
      with_tag("input#faixa_de_desconto_ate[name=?]", "faixa_de_desconto[ate]")
      with_tag("input#faixa_de_desconto_desconto_permitido[name=?]", "faixa_de_desconto[desconto_permitido]")
    end
  end
end


