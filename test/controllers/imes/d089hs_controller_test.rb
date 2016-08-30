require 'test_helper'

class Imes::D089hsControllerTest < ActionController::TestCase
  setup do
    @imes_d089h = imes_d089h(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imes_d089h)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imes_d089h" do
    assert_difference('Imes::D089h.count') do
      post :create, imes_d089h: {  }
    end

    assert_redirected_to imes_d089h_path(assigns(:imes_d089h))
  end

  test "should show imes_d089h" do
    get :show, id: @imes_d089h
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imes_d089h
    assert_response :success
  end

  test "should update imes_d089h" do
    patch :update, id: @imes_d089h, imes_d089h: {  }
    assert_redirected_to imes_d089h_path(assigns(:imes_d089h))
  end

  test "should destroy imes_d089h" do
    assert_difference('Imes::D089h.count', -1) do
      delete :destroy, id: @imes_d089h
    end

    assert_redirected_to imes_d089hs_path
  end
end
