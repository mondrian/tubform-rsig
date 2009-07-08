require 'test_helper'

class MotivosAssistenciaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivos_assistencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivo_assistencia" do
    assert_difference('MotivoAssistencia.count') do
      post :create, :motivo_assistencia => { }
    end

    assert_redirected_to motivo_assistencia_path(assigns(:motivo_assistencia))
  end

  test "should show motivo_assistencia" do
    get :show, :id => motivos_assistencia(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => motivos_assistencia(:one).to_param
    assert_response :success
  end

  test "should update motivo_assistencia" do
    put :update, :id => motivos_assistencia(:one).to_param, :motivo_assistencia => { }
    assert_redirected_to motivo_assistencia_path(assigns(:motivo_assistencia))
  end

  test "should destroy motivo_assistencia" do
    assert_difference('MotivoAssistencia.count', -1) do
      delete :destroy, :id => motivos_assistencia(:one).to_param
    end

    assert_redirected_to motivos_assistencia_path
  end
end
