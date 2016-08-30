require 'test_helper'

class ReimbursementsControllerTest < ActionController::TestCase
  setup do
    @reimbursement = reimbursement(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reimbursement)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reimbursement" do
    assert_difference('Reimbursement.count') do
      post :create, reimbursement: { approved: @reimbursement.approved, belnr: @reimbursement.belnr, blart: @reimbursement.blart, bldat: @reimbursement.bldat, body: @reimbursement.body, budat: @reimbursement.budat, bukrs: @reimbursement.bukrs, creator_id: @reimbursement.creator_id, creator_ip: @reimbursement.creator_ip, deleted: @reimbursement.deleted, gjahr: @reimbursement.gjahr, name: @reimbursement.name, owner_id: @reimbursement.owner_id, status: @reimbursement.status, subject: @reimbursement.subject, updater_id: @reimbursement.updater_id, updater_ip: @reimbursement.updater_ip, uuid: @reimbursement.uuid, waers: @reimbursement.waers }
    end

    assert_redirected_to reimbursement_path(assigns(:reimbursement))
  end

  test "should show reimbursement" do
    get :show, id: @reimbursement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reimbursement
    assert_response :success
  end

  test "should update reimbursement" do
    patch :update, id: @reimbursement, reimbursement: { approved: @reimbursement.approved, belnr: @reimbursement.belnr, blart: @reimbursement.blart, bldat: @reimbursement.bldat, body: @reimbursement.body, budat: @reimbursement.budat, bukrs: @reimbursement.bukrs, creator_id: @reimbursement.creator_id, creator_ip: @reimbursement.creator_ip, deleted: @reimbursement.deleted, gjahr: @reimbursement.gjahr, name: @reimbursement.name, owner_id: @reimbursement.owner_id, status: @reimbursement.status, subject: @reimbursement.subject, updater_id: @reimbursement.updater_id, updater_ip: @reimbursement.updater_ip, uuid: @reimbursement.uuid, waers: @reimbursement.waers }
    assert_redirected_to reimbursement_path(assigns(:reimbursement))
  end

  test "should destroy reimbursement" do
    assert_difference('Reimbursement.count', -1) do
      delete :destroy, id: @reimbursement
    end

    assert_redirected_to reimbursements_path
  end
end
