require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FaixaDeDesconto do
  before(:each) do
    @valid_attributes = {
      :de => 1,
      :ate => 1,
      :desconto_permitido => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    FaixaDeDesconto.create!(@valid_attributes)
  end
end
