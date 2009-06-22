require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Parametro do
  before(:each) do
    @valid_attributes = {
      :chave => "value for chave",
      :valor => "value for valor",
      :descricao => "value for descricao",
      :empresa_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Parametro.create!(@valid_attributes)
  end
end
