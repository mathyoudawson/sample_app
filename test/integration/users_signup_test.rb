require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def post_invalid_user
    post users_path, params: { user: { name:  "",
                                       email: "user@invalid",
                                       password:              "foo",
                                       password_confirmation: "bar" } }
  end

  test "invalid signup information doesn't create a user" do
    get signup_path
    assert_no_difference 'User.count' do
      post_invalid_user
    end
    assert_template 'users/new'
  end

  test "invalid signup information produces errors" do
    post_invalid_user
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
end
