require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  context "associations" do
    should have_many(:products).dependent(:destroy)
  end
end
