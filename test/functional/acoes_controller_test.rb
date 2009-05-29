require 'test_helper'

class AcoesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acao" do
    assert_difference('Acao.count') do
      post :create, :acao => { }
    end

    assert_redirected_to acao_path(assigns(:acao))
  end

  test "should show acao" do
    get :show, :id => acoes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => acoes(:one).to_param
    assert_response :success
  end

  test "should update acao" do
    put :update, :id => acoes(:one).to_param, :acao => { }
    assert_redirected_to acao_path(assigns(:acao))
  end

  test "should destroy acao" do
    assert_difference('Acao.count', -1) do
      delete :destroy, :id => acoes(:one).to_param
    end

    assert_redirected_to acoes_path
  end
end
