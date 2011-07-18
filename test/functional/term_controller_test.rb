require 'test_helper'

class TermControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
