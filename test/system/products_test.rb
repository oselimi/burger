require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:three)
  end

  test "visiting the index" do
    visit products_url
  end

  test "creating a Product" do
    log_in_as(users(:three))
    visit products_url
    click_on "New Product"

    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    select "Category", from: 'Select Box'
    click_on "Create"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    log_in_as(users(:three))
    visit products_url
    click_on "Edit", match: :first

    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    select "Category", from: @product.category_id
    click_on "Create"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    log_in_as(users(:three))
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
