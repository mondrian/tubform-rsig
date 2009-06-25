require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Fornecedor do
  before(:each) do
    @valid_attributes = {
      :nome => "value for nome",
      :endereco => "value for endereco",
      :cnpj => "value for cnpj"
    }
  end

  it "should create a new instance given valid attributes" do
    Fornecedor.create!(@valid_attributes)
  end
end
