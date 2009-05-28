require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/produto_kits/show.html.erb" do
  include ProdutoKitsHelper
  before(:each) do
    assigns[:produto_kit] = @produto_kit = stub_model(ProdutoKit,
      :produto_id => 1,
      :empresa_id => 1,
      :fator_conversao => 9.99,
      :status => false,
      :preco_normal => 9.99,
      :preco_especial => 9.99
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/false/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
  end
end

