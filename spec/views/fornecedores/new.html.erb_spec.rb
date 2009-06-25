require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/fornecedores/new.html.erb" do
  include FornecedoresHelper
  
  before(:each) do
    assigns[:fornecedor] = stub_model(Fornecedor,
      :new_record? => true,
      :nome => "value for nome",
      :endereco => "value for endereco",
      :cnpj => "value for cnpj"
    )
  end

  it "renders new fornecedor form" do
    render
    
    response.should have_tag("form[action=?][method=post]", fornecedores_path) do
      with_tag("input#fornecedor_nome[name=?]", "fornecedor[nome]")
      with_tag("input#fornecedor_endereco[name=?]", "fornecedor[endereco]")
      with_tag("input#fornecedor_cnpj[name=?]", "fornecedor[cnpj]")
    end
  end
end


