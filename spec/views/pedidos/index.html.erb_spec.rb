require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pedidos/index.html.erb" do
  include PedidosHelper
  
  before(:each) do
    assigns[:pedidos] = [
      stub_model(Pedido),
      stub_model(Pedido)
    ]
  end

  it "renders a list of pedidos" do
    render
  end
end

