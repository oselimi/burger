class Order < ApplicationRecord
 has_many :order_items, dependent: :destroy
 belongs_to :user
 belongs_to :statistic


 def add_order_item(cart)
  cart.order_items.each do |item|
   item.cart_id = nil
   order_items << item
  end
 end
 
 def total_price
  order_items.to_a.sum {|item| item.total_price }
 end

 default_scope {order(date: :desc)}
end
