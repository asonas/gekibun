require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get created" do
    get :created
    assert_response :success
  end

  test "should get card" do
    get :card
    assert_response :success
  end

end
