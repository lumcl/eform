require 'test_helper'

class Imes::D272hsControllerTest < ActionController::TestCase
  setup do
    @imes_d272h = imes_d272h(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imes_d272h)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imes_d272h" do
    assert_difference('Imes::D272h.count') do
      post :create, imes_d272h: {  }
    end

    assert_redirected_to imes_d272h_path(assigns(:imes_d272h))
  end

  test "should show imes_d272h" do
    get :show, id: @imes_d272h
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imes_d272h
    assert_response :success
  end

  test "should update imes_d272h" do
    patch :update, id: @imes_d272h, imes_d272h: {  }
    assert_redirected_to imes_d272h_path(assigns(:imes_d272h))
  end

  test "should destroy imes_d272h" do
    assert_difference('Imes::D272h.count', -1) do
      delete :destroy, id: @imes_d272h
    end

    assert_redirected_to imes_d272hs_path
  end
end
