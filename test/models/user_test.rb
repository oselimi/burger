require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context "assoications" do
    should have_many(:orders).dependent(:destroy)
  end

  context "password should be secured" do
    should have_secure_password
  end

  test "attributes can not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
    assert user.errors[:phone].any?
  end
  test "should have format of email address" do
    user = User.create(name: "example", email: "test@live.com", password: "secret", password_confirmation: "secret", phone: "07722222")
    assert user.valid?
  end
end
