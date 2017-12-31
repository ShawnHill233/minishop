class Category < ApplicationRecord
  acts_as_nested_set
  has_many :product_categories
  has_many :products, through: :products

  has_one :icon, as: :attachable, dependent: :destroy, class_name: 'Image', inverse_of: :attachable

end
