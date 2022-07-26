require "test_helper"

class PostsInterfaceTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:testuser)
  end
  test "post interface" do
    sign_in @user
    get root_path
    assert_select "nav"
    assert_select 'input[type=file]'
    # invalid submission
    assert_no_difference 'Post.count' do
      post posts_path, params: {post: {content:""}}
    end
    # valid submission
    content = "This micropost really ties the room together"
    image = fixture_file_upload('test/fixtures/kitten.jpg', 'image/jpeg')
    assert_difference 'Post.count', 1 do
      post posts_path, params:{post: {body:content, image:image}}
    end
    post = assigns(:post)
    assert post.image.attached?
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    first_post = @user.posts.first
    assert_difference "Post.count", -1 do
      delete post_path(first_post)
    end
  end
end
