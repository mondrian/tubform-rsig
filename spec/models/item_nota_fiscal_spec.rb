require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemNotaFiscal do
  before(:each) do
    @valid_attributes = {
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
    }
  end

  it "should create a new instance given valid attributes" do
    ItemNotaFiscal.create!(@valid_attributes)
  end
end
