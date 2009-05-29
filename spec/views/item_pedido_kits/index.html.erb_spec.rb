require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_pedido_kits/index.html.erb" do
  include ItemPedidoKitsHelper
  
  before(:each) do
    assigns[:item_pedido_kits] = [
      stub_model(ItemPedidoKit,
        :pedido_id => 1,
        :quantidade => 9.99,
        :valor_tabela => 9.99,
        :valor_venda => 9.99,
        :desconto => 9.99,
        :produto_id => 1,
        :produto_kit => 1
      ),
      stub_model(ItemPedidoKit,
        :pedido_id => 1,
        :quantidade => 9.99,
        :valor_tabela => 9.99,
        :valor_venda => 9.99,
        :desconto => 9.99,
        :produto_id => 1,
        :produto_kit => 1
      )
    ]
  end

  it "renders a list of item_pedido_kits" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

