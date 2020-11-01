class OrderItemsController < ApplicationController
  include CurrentCart
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create, :reduction]
  before_action :logged_in_user, except: [:new, :create]
  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    product = Product.find(params[:product_id])
    @order_item = @cart.add_product(product)

    respond_to do |format|
      if @order_item.save
        if params[:category_id].present?
          format.html { redirect_to store_index_path(category_id: params[:category_id]), notice: 'Order item was successfully created.' }
          format.json { render :show, status: :created, location: @order_item }
        else
          format.html { redirect_to store_index_path, notice: 'Order item was successfully created.' }
          format.json { render :show, status: :created, location: @order_item }
        end
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:total, :quantity, :product_id, :cart_id)
    end
end
