require 'test_helper'

class CommunityLeadersControllerTest < ActionController::TestCase
  setup do
    @community_leader = community_leaders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:community_leaders)
  end

  test "should create community_leader" do
    assert_difference('CommunityLeader.count') do
      post :create, community_leader: { city_id: @community_leader.city_id }
    end

    assert_response 201
  end

  test "should show community_leader" do
    get :show, id: @community_leader
    assert_response :success
  end

  test "should update community_leader" do
    put :update, id: @community_leader, community_leader: { city_id: @community_leader.city_id }
    assert_response 204
  end

  test "should destroy community_leader" do
    assert_difference('CommunityLeader.count', -1) do
      delete :destroy, id: @community_leader
    end

    assert_response 204
  end
end
