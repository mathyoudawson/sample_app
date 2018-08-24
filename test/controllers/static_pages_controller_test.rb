require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @default_title = 'Ruby on Rails Tutorial Sample App'
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", @default_title
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@default_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@default_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@default_title}"
  end

end
