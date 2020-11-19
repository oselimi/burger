class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :logged_in_user
  def index
    if params[:category_id].present?
      @products = Product.where(category_id: params[:category_id])
    else
      @products = Product.all
    end
    @categories = Category.all

  end

  def delivery
    @orders = Order.all
  end

  def view
    @order = Order.find(params[:order_id])
  end

  def reduction
    product = Product.find(params[:product_id])
    @cart.reduction_product(product)
    redirect_to root_path(category_id: params[:category_id])
  end

  def balance
    @order = Order.count
    @orders = Order.all
    @statistics = Statistic.all
    @statistic = Statistic.first
    @sts = Statistic.new
    @user = User.find_by(params[:user_id])
  end

  def order_food
    @order = Order.new(no: count, date: DateTime.current)
  end

  def costumer
    @product = Product.new
    @category = Category.new
    @usr = User.new
    @user = User.find_by(params[:user_id])
    @orders = Order.all.count
  end

  private
  def count 
    Order.all.count + 1
  end
end
