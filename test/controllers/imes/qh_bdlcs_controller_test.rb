require 'test_helper'

class Imes::QhBdlcsControllerTest < ActionController::TestCase
  setup do
    @imes_qh_bdlc = imes_qh_bdlc(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imes_qh_bdlc)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imes_qh_bdlc" do
    assert_difference('Imes::QhBdlc.count') do
      post :create, imes_qh_bdlc: {  }
    end

    assert_redirected_to imes_qh_bdlc_path(assigns(:imes_qh_bdlc))
  end

  test "should show imes_qh_bdlc" do
    get :show, id: @imes_qh_bdlc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imes_qh_bdlc
    assert_response :success
  end

  test "should update imes_qh_bdlc" do
    patch :update, id: @imes_qh_bdlc, imes_qh_bdlc: {  }
    assert_redirected_to imes_qh_bdlc_path(assigns(:imes_qh_bdlc))
  end

  test "should destroy imes_qh_bdlc" do
    assert_difference('Imes::QhBdlc.count', -1) do
      delete :destroy, id: @imes_qh_bdlc
    end

    assert_redirected_to imes_qh_bdlcs_path
  end
end
