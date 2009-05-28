require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_pedido_kits/show.html.erb" do
  include ItemPedidoKitsHelper
  before(:each) do
    assigns[:item_pedido_kit] = @item_pedido_kit = stub_model(ItemPedidoKit,
      :pedido_id => 1,
      :quantidade => 9.99,
      :valor_tabela => 9.99,
      :valor_venda => 9.99,
      :desconto => 9.99,
      :produto_id => 1,
      :produto_kit => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

