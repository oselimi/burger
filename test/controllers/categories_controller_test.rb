require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    login_as(users(:three))
    get categories_url
    assert_response :success
  end

  test "should get new" do
    login_as(users(:three))
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    login_as(users(:three))
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: @category.name } }
    end

    assert_redirected_to store_index_path
  end

  test "should show category" do
    login_as(users(:three))
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:three))
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    login_as(users(:three))
    patch category_url(@category), params: { category: { name: @category.name } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    login_as(users(:three))
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
