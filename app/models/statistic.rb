class Statistic < ApplicationRecord
 has_many :orders

 def total_price
  orders.to_a.sum {|item| item.total_price }
 end


 default_scope {order(created_at: :desc)}
end
