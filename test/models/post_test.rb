require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:testuser)
    @post = @user.posts.build(body: "lorem ipsummmm")
  end

  test "should be valid" do
    assert @post.valid?
  end
 
  test "user_id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end
  
  test "body should be present" do
    @post.body = ""
    assert_not @post.valid?
  end

  test "body should have atleas 12 character" do
    @post.body = "a" * 11
    assert_not @post.valid?
  end

  test "order should be recent first" do
    assert_equal posts(:most_recent), Post.first
  end
end
