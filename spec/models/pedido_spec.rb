require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Pedido do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "ele precisa criar uma nova instância dado os atributos válidos" do
    Pedido.create!(@valid_attributes)
  end

end

