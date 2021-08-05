require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), params: { user: { name: "",
                                              email: "foo@invalid",
                                              address: "",
                                              phone_number: "",
                                              date_of_birth: "",
                                              password:              "foo",
                                              password_confirmation: "bar" } }
    assert_template "users/edit"
    assert_select "div.alert", text: "The form contains 10 errors."
  end
  
  test "successful edit with friendly forwarding" do
    get edit_user_path(:en, @user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
    date_of_birth = "01-01-2000"
    address = "New York, NY, USA"
    phone_number = "0123456789"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              address: address,
                                              phone_number: phone_number,
                                              date_of_birth: date_of_birth,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload 
    assert_equal name, @user.name
    assert_equal email, @user.email
    assert session[:forwarding_url].blank?
  end
end
