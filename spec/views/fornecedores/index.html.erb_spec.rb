require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/fornecedores/index.html.erb" do
  include FornecedoresHelper
  
  before(:each) do
    assigns[:fornecedores] = [
      stub_model(Fornecedor,
        :nome => "value for nome",
        :endereco => "value for endereco",
        :cnpj => "value for cnpj"
      ),
      stub_model(Fornecedor,
        :nome => "value for nome",
        :endereco => "value for endereco",
        :cnpj => "value for cnpj"
      )
    ]
  end

  it "renders a list of fornecedores" do
    render
    response.should have_tag("tr>td", "value for nome".to_s, 2)
    response.should have_tag("tr>td", "value for endereco".to_s, 2)
    response.should have_tag("tr>td", "value for cnpj".to_s, 2)
  end
end

