require 'test_helper'

class ContraPartidasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contra_partidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contra_partida" do
    assert_difference('ContraPartida.count') do
      post :create, :contra_partida => { }
    end

    assert_redirected_to contra_partida_path(assigns(:contra_partida))
  end

  test "should show contra_partida" do
    get :show, :id => contra_partidas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contra_partidas(:one).to_param
    assert_response :success
  end

  test "should update contra_partida" do
    put :update, :id => contra_partidas(:one).to_param, :contra_partida => { }
    assert_redirected_to contra_partida_path(assigns(:contra_partida))
  end

  test "should destroy contra_partida" do
    assert_difference('ContraPartida.count', -1) do
      delete :destroy, :id => contra_partidas(:one).to_param
    end

    assert_redirected_to contra_partidas_path
  end
end
