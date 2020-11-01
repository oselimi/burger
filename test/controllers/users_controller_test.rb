require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:three)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    post login_url, params:  {session: { email: @user.email, password: 'secret' }}
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    post login_url, params:  {session: { email: @user.email, password: 'secret' }}
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, name: @user.name, password: 'secret', password_confirmation: 'secret', phone: @user.phone } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
   login_as(users(:three))
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
   login_as(users(:three))
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
   login_as(users(:three))
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password: 'secret', password_confirmation: 'secret', phone: @user.phone } }
    assert_redirected_to costumer_path(@user)
  end

  test "should destroy user" do
   login_as(users(:three))
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
