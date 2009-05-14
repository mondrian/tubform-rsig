require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pedidos/new.html.erb" do
  include PedidosHelper
  
  before(:each) do
    assigns[:pedido] = stub_model(Pedido,
      :new_record? => true
    )
  end

  it "renders new pedido form" do
    render
    
    response.should have_tag("form[action=?][method=post]", pedidos_path) do
    end
  end
end


