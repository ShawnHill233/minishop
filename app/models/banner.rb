class Banner < ApplicationRecord
  belongs_to :product
  has_one :image, as: :attachable, dependent: :destroy, class_name: 'Image', inverse_of: :attachable
  accepts_nested_attributes_for :image
end
