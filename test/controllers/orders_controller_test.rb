require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:three)
  end

  test "should get index" do
    login_as(users(:three))
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address: @order.address, date: @order.date, name: @order.name, no: @order.no, pay_type: @order.pay_type, telephone: @order.telephone } }
    end

    assert_redirected_to store_index_url
  end

  test "should show order" do
    login_as(users(:three))
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:three))
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    login_as(users(:three))
    patch order_url(@order), params: { order: { address: @order.address, date: @order.date, name: @order.name, no: @order.no, pay_type: @order.pay_type, telephone: @order.telephone } }
    assert_redirected_to delivery_path
  end

  test "should destroy order" do
    login_as(users(:three))
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to delivery_path
  end
end
