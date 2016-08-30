require 'test_helper'

class Imes::D034hsControllerTest < ActionController::TestCase
  setup do
    @imes_d034h = imes_d034h(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imes_d034h)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imes_d034h" do
    assert_difference('Imes::D034h.count') do
      post :create, imes_d034h: { addr1: @imes_d034h.addr1, auart: @imes_d034h.auart, auartx: @imes_d034h.auartx, audat: @imes_d034h.audat, bdbh: @imes_d034h.bdbh, bddm: @imes_d034h.bddm, bdjg: @imes_d034h.bdjg, bdzt: @imes_d034h.bdzt, bstkd: @imes_d034h.bstkd, exrate: @imes_d034h.exrate, gsdm: @imes_d034h.gsdm, inco1: @imes_d034h.inco1, inco2: @imes_d034h.inco2, kdmat: @imes_d034h.kdmat, kunnr: @imes_d034h.kunnr, lab: @imes_d034h.lab, mark1: @imes_d034h.mark1, mark2: @imes_d034h.mark2, mat: @imes_d034h.mat, matnr: @imes_d034h.matnr, mch: @imes_d034h.mch, name1: @imes_d034h.name1, netpr: @imes_d034h.netpr, ovh: @imes_d034h.ovh, profit: @imes_d034h.profit, pwerk: @imes_d034h.pwerk, qhsj: @imes_d034h.qhsj, qhyh: @imes_d034h.qhyh, quote: @imes_d034h.quote, sqsj: @imes_d034h.sqsj, sqyh: @imes_d034h.sqyh, vbeln: @imes_d034h.vbeln, vbsed: @imes_d034h.vbsed, waerk: @imes_d034h.waerk, werks: @imes_d034h.werks }
    end

    assert_redirected_to imes_d034h_path(assigns(:imes_d034h))
  end

  test "should show imes_d034h" do
    get :show, id: @imes_d034h
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imes_d034h
    assert_response :success
  end

  test "should update imes_d034h" do
    patch :update, id: @imes_d034h, imes_d034h: { addr1: @imes_d034h.addr1, auart: @imes_d034h.auart, auartx: @imes_d034h.auartx, audat: @imes_d034h.audat, bdbh: @imes_d034h.bdbh, bddm: @imes_d034h.bddm, bdjg: @imes_d034h.bdjg, bdzt: @imes_d034h.bdzt, bstkd: @imes_d034h.bstkd, exrate: @imes_d034h.exrate, gsdm: @imes_d034h.gsdm, inco1: @imes_d034h.inco1, inco2: @imes_d034h.inco2, kdmat: @imes_d034h.kdmat, kunnr: @imes_d034h.kunnr, lab: @imes_d034h.lab, mark1: @imes_d034h.mark1, mark2: @imes_d034h.mark2, mat: @imes_d034h.mat, matnr: @imes_d034h.matnr, mch: @imes_d034h.mch, name1: @imes_d034h.name1, netpr: @imes_d034h.netpr, ovh: @imes_d034h.ovh, profit: @imes_d034h.profit, pwerk: @imes_d034h.pwerk, qhsj: @imes_d034h.qhsj, qhyh: @imes_d034h.qhyh, quote: @imes_d034h.quote, sqsj: @imes_d034h.sqsj, sqyh: @imes_d034h.sqyh, vbeln: @imes_d034h.vbeln, vbsed: @imes_d034h.vbsed, waerk: @imes_d034h.waerk, werks: @imes_d034h.werks }
    assert_redirected_to imes_d034h_path(assigns(:imes_d034h))
  end

  test "should destroy imes_d034h" do
    assert_difference('Imes::D034h.count', -1) do
      delete :destroy, id: @imes_d034h
    end

    assert_redirected_to imes_d034hs_path
  end
end
