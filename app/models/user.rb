class User < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :phone, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  def total_price
    orders.to_a.sum {|item| item.total_price }
  end
end
