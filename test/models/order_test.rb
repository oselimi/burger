require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  context "associations" do
    should have_many(:order_items).dependent(:destroy)
    should belong_to(:user)
  end
end
