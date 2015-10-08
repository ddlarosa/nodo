require 'test_helper'

class NodeResultsControllerTest < ActionController::TestCase
  setup do
    @node_result = node_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:node_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create node_result" do
    assert_difference('NodeResult.count') do
      post :create, node_result: { firsttime: @node_result.firsttime, lasttime: @node_result.lasttime, mac: @node_result.mac, node_id: @node_result.node_id, singal_db: @node_result.singal_db }
    end

    assert_redirected_to node_result_path(assigns(:node_result))
  end

  test "should show node_result" do
    get :show, id: @node_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @node_result
    assert_response :success
  end

  test "should update node_result" do
    patch :update, id: @node_result, node_result: { firsttime: @node_result.firsttime, lasttime: @node_result.lasttime, mac: @node_result.mac, node_id: @node_result.node_id, singal_db: @node_result.singal_db }
    assert_redirected_to node_result_path(assigns(:node_result))
  end

  test "should destroy node_result" do
    assert_difference('NodeResult.count', -1) do
      delete :destroy, id: @node_result
    end

    assert_redirected_to node_results_path
  end
end
