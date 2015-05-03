require 'test_helper'

class AvailablesControllerTest < ActionController::TestCase
  setup do
    @available = availables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:availables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create available" do
    assert_difference('Available.count') do
      post :create, available: { item_id: @available.item_id, store_id: @available.store_id }
    end

    assert_redirected_to available_path(assigns(:available))
  end

  test "should show available" do
    get :show, id: @available
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @available
    assert_response :success
  end

  test "should update available" do
    patch :update, id: @available, available: { item_id: @available.item_id, store_id: @available.store_id }
    assert_redirected_to available_path(assigns(:available))
  end

  test "should destroy available" do
    assert_difference('Available.count', -1) do
      delete :destroy, id: @available
    end

    assert_redirected_to availables_path
  end
end
