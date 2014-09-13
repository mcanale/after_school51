require 'test_helper'

class PresencesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get modify" do
    get :modify
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
