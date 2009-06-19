require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Classe do
  before(:each) do
    @valid_attributes = {
      :descricao => "value for descricao"
    }
  end

  it "should create a new instance given valid attributes" do
    Classe.create!(@valid_attributes)
  end
end
