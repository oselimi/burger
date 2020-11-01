require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:three)
  end

  test "should get index" do
    login_as(users(:three))
    get products_url
    assert_response :success
  end

  test "should get new" do
    login_as(users(:three))
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    login_as(users(:three))
    assert_difference('Product.count') do
      post products_url, params: { product: { name: @product.name, price: @product.price, category_id: @product.category_id } }
    end

    assert_redirected_to store_index_path
  end

  test "should show product" do
    login_as(users(:three))
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:three))
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    login_as(users(:three))
    patch product_url(@product), params: { product: { name: @product.name, price: @product.price } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    login_as(users(:three))
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
