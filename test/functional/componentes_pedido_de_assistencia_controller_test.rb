require 'test_helper'

class ComponentesPedidoDeAssistenciaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:componentes_pedido_de_assistencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create componente_pedido_de_assistencia" do
    assert_difference('ComponentePedidoDeAssistencia.count') do
      post :create, :componente_pedido_de_assistencia => { }
    end

    assert_redirected_to componente_pedido_de_assistencia_path(assigns(:componente_pedido_de_assistencia))
  end

  test "should show componente_pedido_de_assistencia" do
    get :show, :id => componentes_pedido_de_assistencia(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => componentes_pedido_de_assistencia(:one).to_param
    assert_response :success
  end

  test "should update componente_pedido_de_assistencia" do
    put :update, :id => componentes_pedido_de_assistencia(:one).to_param, :componente_pedido_de_assistencia => { }
    assert_redirected_to componente_pedido_de_assistencia_path(assigns(:componente_pedido_de_assistencia))
  end

  test "should destroy componente_pedido_de_assistencia" do
    assert_difference('ComponentePedidoDeAssistencia.count', -1) do
      delete :destroy, :id => componentes_pedido_de_assistencia(:one).to_param
    end

    assert_redirected_to componentes_pedido_de_assistencia_path
  end
end
