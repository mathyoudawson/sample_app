require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(:name => 'Matthew', :email => 'matthew@test.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'should not be valid' do
    @user.name = nil
    @user.email = nil

    assert_not @user.valid?
  end

  test 'name should be present' do
    @user.name = '    '

    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '    '
    
    assert_not @user.valid?
  end

  test 'name should not be long' do
    @user.name = 'a' * 51

    assert_not @user.valid?
  end

  test 'email should not be long' do
    @user.email = 'a' * 244 + '@example.com'

    assert_not @user.valid?
  end
end
