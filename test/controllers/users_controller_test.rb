require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:testuser)
    @base_title = "G-Network"
  end
  test "should get show when logged in" do
    sign_in @user
    get user_url(@user)
    assert_response :success
  end

  test "should redirect show when not logged in" do
    get user_url(@user)
    follow_redirect!
    assert_template "devise/sessions/new"
    assert_select "title", "Log In | #{@base_title}"
  end

  test "should get sign_up" do
    get new_user_registration_url
    assert_response :success
    assert_select "title", "Sign Up | #{@base_title}"
  end
end
