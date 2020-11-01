require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:three)
  end

  test "visiting the index" do
    visit staff_url
    assert_selector "h1", text: "Staff"
  end

  test "creating a User" do
    log_in_as(@user)

    click_on "Staff"

    click_on "New User"

    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    fill_in "Phone", with: @user.phone
    click_on "Create"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    log_in_as(@user)

    visit users_url
    click_on "Edit", match: :first

    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    fill_in "Phone", with: @user.phone
    click_on "Create"

  end

  test "destroying a User" do
    log_in_as(@user)
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
