require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProdutoKit do
  before(:each) do
    @valid_attributes = {
      :produto_id => 1,
      :empresa_id => 1,
      :fator_conversao => 9.99,
      :status => false,
      :preco_normal => 9.99,
      :preco_especial => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    ProdutoKit.create!(@valid_attributes)
  end
end
