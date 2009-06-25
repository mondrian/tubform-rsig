require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/fornecedores/show.html.erb" do
  include FornecedoresHelper
  before(:each) do
    assigns[:fornecedor] = @fornecedor = stub_model(Fornecedor,
      :nome => "value for nome",
      :endereco => "value for endereco",
      :cnpj => "value for cnpj"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nome/)
    response.should have_text(/value\ for\ endereco/)
    response.should have_text(/value\ for\ cnpj/)
  end
end

