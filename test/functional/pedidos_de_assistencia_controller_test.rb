require 'test_helper'

class PedidosDeAssistenciaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedidos_de_assistencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedido_de_assistencia" do
    assert_difference('PedidoDeAssistencia.count') do
      post :create, :pedido_de_assistencia => { }
    end

    assert_redirected_to pedido_de_assistencia_path(assigns(:pedido_de_assistencia))
  end

  test "should show pedido_de_assistencia" do
    get :show, :id => pedidos_de_assistencia(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pedidos_de_assistencia(:one).to_param
    assert_response :success
  end

  test "should update pedido_de_assistencia" do
    put :update, :id => pedidos_de_assistencia(:one).to_param, :pedido_de_assistencia => { }
    assert_redirected_to pedido_de_assistencia_path(assigns(:pedido_de_assistencia))
  end

  test "should destroy pedido_de_assistencia" do
    assert_difference('PedidoDeAssistencia.count', -1) do
      delete :destroy, :id => pedidos_de_assistencia(:one).to_param
    end

    assert_redirected_to pedidos_de_assistencia_path
  end
end
