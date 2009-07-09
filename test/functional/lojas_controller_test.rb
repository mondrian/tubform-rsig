require 'test_helper'

class LojasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lojas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loja" do
    assert_difference('Loja.count') do
      post :create, :loja => { }
    end

    assert_redirected_to loja_path(assigns(:loja))
  end

  test "should show loja" do
    get :show, :id => lojas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lojas(:one).to_param
    assert_response :success
  end

  test "should update loja" do
    put :update, :id => lojas(:one).to_param, :loja => { }
    assert_redirected_to loja_path(assigns(:loja))
  end

  test "should destroy loja" do
    assert_difference('Loja.count', -1) do
      delete :destroy, :id => lojas(:one).to_param
    end

    assert_redirected_to lojas_path
  end
end
