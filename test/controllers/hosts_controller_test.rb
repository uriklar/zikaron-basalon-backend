require 'test_helper'

class HostsControllerTest < ActionController::TestCase
  setup do
    @host = hosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hosts)
  end

  test "should create host" do
    assert_difference('Host.count') do
      post :create, host: { address: @host.address, email: @host.email, event_date: @host.event_date, first_name: @host.first_name, free_text: @host.free_text, last_name: @host.last_name, max_guests: @host.max_guests, phone: @host.phone, strangers_allowed: @host.strangers_allowed, survivor_needed: @host.survivor_needed }
    end

    assert_response 201
  end

  test "should show host" do
    get :show, id: @host
    assert_response :success
  end

  test "should update host" do
    put :update, id: @host, host: { address: @host.address, email: @host.email, event_date: @host.event_date, first_name: @host.first_name, free_text: @host.free_text, last_name: @host.last_name, max_guests: @host.max_guests, phone: @host.phone, strangers_allowed: @host.strangers_allowed, survivor_needed: @host.survivor_needed }
    assert_response 204
  end

  test "should destroy host" do
    assert_difference('Host.count', -1) do
      delete :destroy, id: @host
    end

    assert_response 204
  end
end
