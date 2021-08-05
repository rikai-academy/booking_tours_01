require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  
  def setup
    @user = users(:michael)
  end
  
  test "profile display" do
    log_in_as(@user)
    get user_path(:en, @user)
    assert_template "users/show"
    assert_select "title", full_title(@user.name)
    assert_select "h4", text: @user.name
    assert_select "img.gravatar"
    assert_select "div.text-secondary", count: 4
  end
end
