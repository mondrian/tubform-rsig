require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/itens_nota_fiscal/index.html.erb" do
  include ItensNotaFiscalHelper
  
  before(:each) do
    assigns[:itens_nota_fiscal] = [
      stub_model(ItemNotaFiscal,
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
      ),
      stub_model(ItemNotaFiscal,
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
    ]
  end

  it "renders a list of itens_nota_fiscal" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for unidade".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", "value for situacao_tributaria".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", "value for codigo_emissao".to_s, 2)
  end
end

