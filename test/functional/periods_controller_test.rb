require 'test_helper'

class PeriodsControllerTest < ActionController::TestCase
  setup do
    @period = periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create period" do
    assert_difference('Period.count') do
      post :create, :period => @period.attributes
    end

    assert_redirected_to period_path(assigns(:period))
  end

  test "should show period" do
    get :show, :id => @period.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @period.to_param
    assert_response :success
  end

  test "should update period" do
    put :update, :id => @period.to_param, :period => @period.attributes
    assert_redirected_to period_path(assigns(:period))
  end

  test "should destroy period" do
    assert_difference('Period.count', -1) do
      delete :destroy, :id => @period.to_param
    end

    assert_redirected_to periods_path
  end
end
