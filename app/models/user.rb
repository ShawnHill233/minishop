class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  before_create :build_cart

end
