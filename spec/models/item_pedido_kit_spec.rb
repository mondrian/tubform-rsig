require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemPedidoKit do
  before(:each) do
    @valid_attributes = {
      :pedido_id => 1,
      :quantidade => 9.99,
      :valor_tabela => 9.99,
      :valor_venda => 9.99,
      :desconto => 9.99,
      :produto_id => 1,
      :produto_kit => 1
    }
  end

  it "should create a new instance given valid attributes" do
    ItemPedidoKit.create!(@valid_attributes)
  end
end
