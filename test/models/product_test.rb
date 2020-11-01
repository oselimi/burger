require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to(:category)
    should have_many(:order_items).dependent(:destroy)
  end
  
  context "present image in products" do
    have_one_attached :image
  end

  test "attributes can not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:name].any?
    assert product.errors[:price].any?
  end
end
