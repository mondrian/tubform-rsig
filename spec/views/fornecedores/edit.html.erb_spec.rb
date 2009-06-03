require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/fornecedores/edit.html.erb" do
  include FornecedoresHelper
  
  before(:each) do
    assigns[:fornecedor] = @fornecedor = stub_model(Fornecedor,
      :new_record? => false,
      :nome => "value for nome",
      :endereco => "value for endereco",
      :cnpj => "value for cnpj"
    )
  end

  it "renders the edit fornecedor form" do
    render
    
    response.should have_tag("form[action=#{fornecedor_path(@fornecedor)}][method=post]") do
      with_tag('input#fornecedor_nome[name=?]', "fornecedor[nome]")
      with_tag('input#fornecedor_endereco[name=?]', "fornecedor[endereco]")
      with_tag('input#fornecedor_cnpj[name=?]', "fornecedor[cnpj]")
    end
  end
end


