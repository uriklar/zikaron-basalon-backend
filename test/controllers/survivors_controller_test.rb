require 'test_helper'

class SurvivorsControllerTest < ActionController::TestCase
  setup do
    @survivor = survivors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survivors)
  end

  test "should create survivor" do
    assert_difference('Survivor.count') do
      post :create, survivor: { address: @survivor.address, contacted: @survivor.contacted, name: @survivor.name, phone: @survivor.phone }
    end

    assert_response 201
  end

  test "should show survivor" do
    get :show, id: @survivor
    assert_response :success
  end

  test "should update survivor" do
    put :update, id: @survivor, survivor: { address: @survivor.address, contacted: @survivor.contacted, name: @survivor.name, phone: @survivor.phone }
    assert_response 204
  end

  test "should destroy survivor" do
    assert_difference('Survivor.count', -1) do
      delete :destroy, id: @survivor
    end

    assert_response 204
  end
end
