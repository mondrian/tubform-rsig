require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/produto_kits/new.html.erb" do
  include ProdutoKitsHelper
  
  before(:each) do
    assigns[:produto_kit] = stub_model(ProdutoKit,
      :new_record? => true,
      :produto_id => 1,
      :empresa_id => 1,
      :fator_conversao => 9.99,
      :status => false,
      :preco_normal => 9.99,
      :preco_especial => 9.99
    )
  end

  it "renders new produto_kit form" do
    render
    
    response.should have_tag("form[action=?][method=post]", produto_kits_path) do
      with_tag("input#produto_kit_produto_id[name=?]", "produto_kit[produto_id]")
      with_tag("input#produto_kit_empresa_id[name=?]", "produto_kit[empresa_id]")
      with_tag("input#produto_kit_fator_conversao[name=?]", "produto_kit[fator_conversao]")
      with_tag("input#produto_kit_status[name=?]", "produto_kit[status]")
      with_tag("input#produto_kit_preco_normal[name=?]", "produto_kit[preco_normal]")
      with_tag("input#produto_kit_preco_especial[name=?]", "produto_kit[preco_especial]")
    end
  end
end


