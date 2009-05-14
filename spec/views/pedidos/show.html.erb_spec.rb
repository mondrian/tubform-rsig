require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pedidos/show.html.erb" do
  include PedidosHelper
  before(:each) do
    assigns[:pedido] = @pedido = stub_model(Pedido)
  end

  it "renders attributes in <p>" do
    render
  end
end

