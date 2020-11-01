require 'test_helper'

class CartTest < ActiveSupport::TestCase
  context "assocciations" do
    should have_many(:order_items).dependent(:destroy)
  end
end
