require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    log_in_as(users(:three))
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    
    visit index_store_path
    click_on "Checkout"

    fill_in "Address", with: @order.address
    fill_in "Date", with: @order.date
    fill_in "Name", with: @order.name
    fill_in "No", with: @order.no
    fill_in "Pay type", with: @order.pay_type
    fill_in "Telephone", with: @order.telephone
    click_on "Order Products"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    log_in_as(users(:three))
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.address
    fill_in "Name", with: @order.name
    fill_in "No", with: @order.no

    fill_in "Telephone", with: @order.telephone
    click_on "Order Products"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    log_in_as(users(:three))
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
