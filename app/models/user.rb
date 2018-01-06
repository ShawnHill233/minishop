class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  before_create :build_cart

end
