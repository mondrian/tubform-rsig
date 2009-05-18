require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/faixas_de_desconto/edit.html.erb" do
  include FaixaDeDescontosHelper
  
  before(:each) do
    assigns[:faixa_de_desconto] = @faixa_de_desconto = stub_model(FaixaDeDesconto,
      :new_record? => false,
      :de => 1,
      :ate => 1,
      :desconto_permitido => 9.99
    )
  end

  it "renders the edit faixa_de_desconto form" do
    render
    
    response.should have_tag("form[action=#{faixa_de_desconto_path(@faixa_de_desconto)}][method=post]") do
      with_tag('input#faixa_de_desconto_de[name=?]', "faixa_de_desconto[de]")
      with_tag('input#faixa_de_desconto_ate[name=?]', "faixa_de_desconto[ate]")
      with_tag('input#faixa_de_desconto_desconto_permitido[name=?]', "faixa_de_desconto[desconto_permitido]")
    end
  end
end


