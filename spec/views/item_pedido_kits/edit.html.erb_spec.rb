require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_pedido_kits/edit.html.erb" do
  include ItemPedidoKitsHelper
  
  before(:each) do
    assigns[:item_pedido_kit] = @item_pedido_kit = stub_model(ItemPedidoKit,
      :new_record? => false,
      :pedido_id => 1,
      :quantidade => 9.99,
      :valor_tabela => 9.99,
      :valor_venda => 9.99,
      :desconto => 9.99,
      :produto_id => 1,
      :produto_kit => 1
    )
  end

  it "renders the edit item_pedido_kit form" do
    render
    
    response.should have_tag("form[action=#{item_pedido_kit_path(@item_pedido_kit)}][method=post]") do
      with_tag('input#item_pedido_kit_pedido_id[name=?]', "item_pedido_kit[pedido_id]")
      with_tag('input#item_pedido_kit_quantidade[name=?]', "item_pedido_kit[quantidade]")
      with_tag('input#item_pedido_kit_valor_tabela[name=?]', "item_pedido_kit[valor_tabela]")
      with_tag('input#item_pedido_kit_valor_venda[name=?]', "item_pedido_kit[valor_venda]")
      with_tag('input#item_pedido_kit_desconto[name=?]', "item_pedido_kit[desconto]")
      with_tag('input#item_pedido_kit_produto_id[name=?]', "item_pedido_kit[produto_id]")
      with_tag('input#item_pedido_kit_produto_kit[name=?]', "item_pedido_kit[produto_kit]")
    end
  end
end


