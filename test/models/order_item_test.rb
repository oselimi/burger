require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to(:product)
    should belong_to(:cart)
    should belong_to(:order).optional(true)
  end
end
