require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid sign up information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "",
                                         email: "user@invalid",
                                         address: "",
                                         phone_number: "",
                                         date_of_birth: "",
                                         password: "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template "users/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
  end
  
  test "valid sign up information" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name: "Valid user",
                                         email: "validuser@valid.com",
                                         address: "KTX Bach Khoa",
                                         phone_number: "1234567890",
                                         date_of_birth: "1999/01/01",
                                         password: "foobar",
                                         password_confirmation: "foobar" } }
    end
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
    assert is_logged_in?
  end
end