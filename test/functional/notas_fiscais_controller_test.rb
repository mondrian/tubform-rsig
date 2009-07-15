require 'test_helper'

class NotasFiscaisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notas_fiscais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nota_fiscal" do
    assert_difference('NotaFiscal.count') do
      post :create, :nota_fiscal => { }
    end

    assert_redirected_to nota_fiscal_path(assigns(:nota_fiscal))
  end

  test "should show nota_fiscal" do
    get :show, :id => notas_fiscais(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => notas_fiscais(:one).to_param
    assert_response :success
  end

  test "should update nota_fiscal" do
    put :update, :id => notas_fiscais(:one).to_param, :nota_fiscal => { }
    assert_redirected_to nota_fiscal_path(assigns(:nota_fiscal))
  end

  test "should destroy nota_fiscal" do
    assert_difference('NotaFiscal.count', -1) do
      delete :destroy, :id => notas_fiscais(:one).to_param
    end

    assert_redirected_to notas_fiscais_path
  end
end
