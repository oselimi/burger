class Cart < ApplicationRecord
 has_many :order_items, dependent: :destroy

 def add_product(product)
  current_item = order_items.find_by(product_id: product.id)
  if current_item.present?
   current_item.quantity += 1
  else
   current_item = order_items.build(product_id: product.id)
  end
  current_item
 end

 def reduction_product(product)
  current = order_items.find_by(product_id: product.id)
  if current.quantity > 1
    current.quantity -= 1
    current.save
  elsif current.quantity == 1
    current.destroy
  else
    redirect_to root_path
  end
  current
 end

 def total_price
  order_items.to_a.sum {|item| item.total_price }
 end
end
