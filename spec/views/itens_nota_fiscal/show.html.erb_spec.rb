require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/itens_nota_fiscal/show.html.erb" do
  include ItensNotaFiscalHelper
  before(:each) do
    assigns[:item_nota_fiscal] = @item_nota_fiscal = stub_model(ItemNotaFiscal,
      :nota_fiscal_id => 1,
      :produto_id => 1,
      :unidade => "value for unidade",
      :quantidade => 1,
      :valor_item => 9.99,
      :valor_original => 9.99,
      :situacao_tributaria => "value for situacao_tributaria",
      :perc_icms => 9.99,
      :perc_ipi => 9.99,
      :peso_liquido => 9.99,
      :codigo_emissao => "value for codigo_emissao"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ unidade/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/value\ for\ situacao_tributaria/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/value\ for\ codigo_emissao/)
  end
end

