require 'test_helper'

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_item = order_items(:one)
  end

  test "should get index" do
    login_as(users(:three))
    get order_items_url
    assert_response :success
  end

  test "should get new" do
    login_as(users(:three))
    get new_order_item_url
    assert_response :success
  end

  test "should create order_item" do
    login_as(users(:three))
    assert_difference('OrderItem.count') do
      post order_items_url, params: { cart_id: @order_item.cart_id, product_id: products(:three).id, quantity: @order_item.quantity, total: @order_item.total }
    end

    assert_redirected_to store_index_path
  end

  test "should show order_item" do
    login_as(users(:three))
    get order_item_url(@order_item)
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:three))
    get edit_order_item_url(@order_item)
    assert_response :success
  end

  test "should update order_item" do
    login_as(users(:three))
    patch order_item_url(@order_item), params: { order_item: { cart_id: @order_item.cart_id, product_id: @order_item.product_id, quantity: @order_item.quantity, total: @order_item.total } }
    assert_redirected_to order_item_url(@order_item)
  end

  test "should destroy order_item" do
    login_as(users(:three))
    assert_difference('OrderItem.count', -1) do
      delete order_item_url(@order_item)
    end

    assert_redirected_to order_items_url
  end
end
