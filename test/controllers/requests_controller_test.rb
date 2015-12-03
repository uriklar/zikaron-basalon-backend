require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { guest_id: @request.guest_id, host_id: @request.host_id, num_of_people: @request.num_of_people }
    end

    assert_response 201
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should update request" do
    put :update, id: @request, request: { guest_id: @request.guest_id, host_id: @request.host_id, num_of_people: @request.num_of_people }
    assert_response 204
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_response 204
  end
end
