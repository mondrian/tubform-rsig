require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/itens_nota_fiscal/new.html.erb" do
  include ItensNotaFiscalHelper
  
  before(:each) do
    assigns[:item_nota_fiscal] = stub_model(ItemNotaFiscal,
      :new_record? => true,
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

  it "renders new item_nota_fiscal form" do
    render
    
    response.should have_tag("form[action=?][method=post]", itens_nota_fiscal_path) do
      with_tag("input#item_nota_fiscal_nota_fiscal_id[name=?]", "item_nota_fiscal[nota_fiscal_id]")
      with_tag("input#item_nota_fiscal_produto_id[name=?]", "item_nota_fiscal[produto_id]")
      with_tag("input#item_nota_fiscal_unidade[name=?]", "item_nota_fiscal[unidade]")
      with_tag("input#item_nota_fiscal_quantidade[name=?]", "item_nota_fiscal[quantidade]")
      with_tag("input#item_nota_fiscal_valor_item[name=?]", "item_nota_fiscal[valor_item]")
      with_tag("input#item_nota_fiscal_valor_original[name=?]", "item_nota_fiscal[valor_original]")
      with_tag("input#item_nota_fiscal_situacao_tributaria[name=?]", "item_nota_fiscal[situacao_tributaria]")
      with_tag("input#item_nota_fiscal_perc_icms[name=?]", "item_nota_fiscal[perc_icms]")
      with_tag("input#item_nota_fiscal_perc_ipi[name=?]", "item_nota_fiscal[perc_ipi]")
      with_tag("input#item_nota_fiscal_peso_liquido[name=?]", "item_nota_fiscal[peso_liquido]")
      with_tag("input#item_nota_fiscal_codigo_emissao[name=?]", "item_nota_fiscal[codigo_emissao]")
    end
  end
end


