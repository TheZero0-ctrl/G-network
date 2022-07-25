require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:testuser)
  end

  test "profile display" do
    sign_in @user
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    @user.posts.each do |post|
      assert_match post.body, response.body
    end
  end
end
