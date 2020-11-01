class Product < ApplicationRecord
 belongs_to :category
 has_many :order_items, dependent: :destroy
 has_one_attached :image


 validates :name, presence: true
 validates :price, presence: true
 def display_image
  image.variant(resize_to_limit: [200, 300])
 end
end
