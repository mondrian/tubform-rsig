require 'test_helper'

class DuplicatasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:duplicatas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create duplicata" do
    assert_difference('Duplicata.count') do
      post :create, :duplicata => { }
    end

    assert_redirected_to duplicata_path(assigns(:duplicata))
  end

  test "should show duplicata" do
    get :show, :id => duplicatas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => duplicatas(:one).to_param
    assert_response :success
  end

  test "should update duplicata" do
    put :update, :id => duplicatas(:one).to_param, :duplicata => { }
    assert_redirected_to duplicata_path(assigns(:duplicata))
  end

  test "should destroy duplicata" do
    assert_difference('Duplicata.count', -1) do
      delete :destroy, :id => duplicatas(:one).to_param
    end

    assert_redirected_to duplicatas_path
  end
end
