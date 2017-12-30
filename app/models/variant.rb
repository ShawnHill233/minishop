class Variant < ApplicationRecord
  belongs_to :product, touch: true, class_name: 'Product', inverse_of: :variants
  has_many :images, as: :attachable, dependent: :destroy, class_name: 'Image'
end
