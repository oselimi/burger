require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    login_as(users(:three))
    get carts_url
    assert_response :success
  end

  test "should get new" do
    login_as(users(:three))
    get new_cart_url
    assert_response :success
  end

  test "should create cart" do
    login_as(users(:three))
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {  } }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    login_as(users(:three))
    get cart_url(@cart)
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:three))
    get edit_cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    login_as(users(:three))
    patch cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart)
  end

  test "should destroy cart" do
    login_as(users(:three))
  post order_items_url, params: { product_id: products(:three).id }
  @cart = Cart.find(session[:cart_id])
      
  assert_difference('Cart.count', -1) do
    delete cart_url(@cart)
  end
    assert_redirected_to store_index_url
  end
end
