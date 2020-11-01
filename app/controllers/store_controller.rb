class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

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
    redirect_to store_index_path(category_id: params[:category_id])
  end

  def all
    @user = User.first
  end

  def contact; end
  def home; end

  def balance
    @order = Order.count
    @orders = Order.where(date: Time.zone.now.all_day)
  end

  def week
    @orders = Order.where(date: Time.zone.now.all_week)
  end

  def month
    @orders = Order.where(date: Time.zone.now.all_month)
  end

  def year
    @orders = Order.where(date: Time.zone.now.all_year)
  end

  def order_food
    @order = Order.new(no: count)
  end

  def staff
    @users = User.all
    @user = User.find_by(params[:user_id])
  end

  def costumer
    @product = Product.new
    @category = Category.new
    @usr = User.new
    @user = User.find_by(params[:user_id])
    @orders = Order.where(date: Time.zone.now.all_day).count
  end

  private
  def count 
    Order.all.count + 1
  end
end
