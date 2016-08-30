require 'test_helper'

class Imes::D400hsControllerTest < ActionController::TestCase
  setup do
    @imes_d400h = imes_d400h(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imes_d400h)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imes_d400h" do
    assert_difference('Imes::D400h.count') do
      post :create, imes_d400h: {  }
    end

    assert_redirected_to imes_d400h_path(assigns(:imes_d400h))
  end

  test "should show imes_d400h" do
    get :show, id: @imes_d400h
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imes_d400h
    assert_response :success
  end

  test "should update imes_d400h" do
    patch :update, id: @imes_d400h, imes_d400h: {  }
    assert_redirected_to imes_d400h_path(assigns(:imes_d400h))
  end

  test "should destroy imes_d400h" do
    assert_difference('Imes::D400h.count', -1) do
      delete :destroy, id: @imes_d400h
    end

    assert_redirected_to imes_d400hs_path
  end
end
