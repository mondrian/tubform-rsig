require 'test_helper'

class ComponentesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:componentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create componente" do
    assert_difference('Componente.count') do
      post :create, :componente => { }
    end

    assert_redirected_to componente_path(assigns(:componente))
  end

  test "should show componente" do
    get :show, :id => componentes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => componentes(:one).to_param
    assert_response :success
  end

  test "should update componente" do
    put :update, :id => componentes(:one).to_param, :componente => { }
    assert_redirected_to componente_path(assigns(:componente))
  end

  test "should destroy componente" do
    assert_difference('Componente.count', -1) do
      delete :destroy, :id => componentes(:one).to_param
    end

    assert_redirected_to componentes_path
  end
end
