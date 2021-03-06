class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:new, :create ]
  before_action :logged_in_user
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_order_item(@cart)
    @order.user = current_user
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to balance_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        puts @order.errors.full_messages
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to delivery_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        puts @order.errors.full_messages
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to delivery_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def count 
      Order.all.count + 1
    end
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:no, :date, :name, :address, :telephone, :finish, :user_id, :comment, :pay_type, :statistic_id)
    end
end
