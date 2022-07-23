require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:testuser)
    @base_title = "G-Network"
  end
  test "should get index" do
    sign_in @user
    get posts_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should redirect index when not sign in" do
    get posts_url
    follow_redirect!
    assert_template "devise/sessions/new"
    assert_select "title", "Log In | #{@base_title}"
  end
end
