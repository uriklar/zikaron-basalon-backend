require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    @guest = guests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guests)
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post :create, guest: { email: @guest.email, first_name: @guest.first_name, last_name: @guest.last_name, phone: @guest.phone }
    end

    assert_response 201
  end

  test "should show guest" do
    get :show, id: @guest
    assert_response :success
  end

  test "should update guest" do
    put :update, id: @guest, guest: { email: @guest.email, first_name: @guest.first_name, last_name: @guest.last_name, phone: @guest.phone }
    assert_response 204
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete :destroy, id: @guest
    end

    assert_response 204
  end
end
