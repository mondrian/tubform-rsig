require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pedidos/edit.html.erb" do
  include PedidosHelper
  
  before(:each) do
    assigns[:pedido] = @pedido = stub_model(Pedido,
      :new_record? => false
    )
  end

  it "renders the edit pedido form" do
    render
    
    response.should have_tag("form[action=#{pedido_path(@pedido)}][method=post]") do
    end
  end
end


