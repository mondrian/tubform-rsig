require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/produto_kits/index.html.erb" do
  include ProdutoKitsHelper
  
  before(:each) do
    assigns[:produto_kits] = [
      stub_model(ProdutoKit,
        :produto_id => 1,
        :empresa_id => 1,
        :fator_conversao => 9.99,
        :status => false,
        :preco_normal => 9.99,
        :preco_especial => 9.99
      ),
      stub_model(ProdutoKit,
        :produto_id => 1,
        :empresa_id => 1,
        :fator_conversao => 9.99,
        :status => false,
        :preco_normal => 9.99,
        :preco_especial => 9.99
      )
    ]
  end

  it "renders a list of produto_kits" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end

