require 'test_helper'

class ItensPedidoDeAssistenciaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itens_pedido_de_assistencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_pedido_de_assistencia" do
    assert_difference('ItemPedidoDeAssistencia.count') do
      post :create, :item_pedido_de_assistencia => { }
    end

    assert_redirected_to item_pedido_de_assistencia_path(assigns(:item_pedido_de_assistencia))
  end

  test "should show item_pedido_de_assistencia" do
    get :show, :id => itens_pedido_de_assistencia(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => itens_pedido_de_assistencia(:one).to_param
    assert_response :success
  end

  test "should update item_pedido_de_assistencia" do
    put :update, :id => itens_pedido_de_assistencia(:one).to_param, :item_pedido_de_assistencia => { }
    assert_redirected_to item_pedido_de_assistencia_path(assigns(:item_pedido_de_assistencia))
  end

  test "should destroy item_pedido_de_assistencia" do
    assert_difference('ItemPedidoDeAssistencia.count', -1) do
      delete :destroy, :id => itens_pedido_de_assistencia(:one).to_param
    end

    assert_redirected_to itens_pedido_de_assistencia_path
  end
end
