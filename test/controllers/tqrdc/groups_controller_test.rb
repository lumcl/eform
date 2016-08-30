require 'test_helper'

class Tqrdc::GroupsControllerTest < ActionController::TestCase
  setup do
    @tqrdc_group = tqrdc_group(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tqrdc_group)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tqrdc_group" do
    assert_difference('Tqrdc::Group.count') do
      post :create, tqrdc_group: { creator_id: @tqrdc_group.creator_id, description: @tqrdc_group.description, id: @tqrdc_group.id, name: @tqrdc_group.name, owner_id: @tqrdc_group.owner_id, score: @tqrdc_group.score, updater_id: @tqrdc_group.updater_id }
    end

    assert_redirected_to tqrdc_group_path(assigns(:tqrdc_group))
  end

  test "should show tqrdc_group" do
    get :show, id: @tqrdc_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tqrdc_group
    assert_response :success
  end

  test "should update tqrdc_group" do
    patch :update, id: @tqrdc_group, tqrdc_group: { creator_id: @tqrdc_group.creator_id, description: @tqrdc_group.description, id: @tqrdc_group.id, name: @tqrdc_group.name, owner_id: @tqrdc_group.owner_id, score: @tqrdc_group.score, updater_id: @tqrdc_group.updater_id }
    assert_redirected_to tqrdc_group_path(assigns(:tqrdc_group))
  end

  test "should destroy tqrdc_group" do
    assert_difference('Tqrdc::Group.count', -1) do
      delete :destroy, id: @tqrdc_group
    end

    assert_redirected_to tqrdc_groups_path
  end
end
