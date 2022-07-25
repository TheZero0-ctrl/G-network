require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:testuser)
    @base_title = "G-Network"
    @post = posts(:orange)
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

  test "should redirect create when not sign in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: {post: {body: "lorem ipsummmmm"}}
    end
    assert_redirected_to new_user_session_url
  end

  test "should redirect destroy when not sign in" do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to new_user_session_url
  end
end
