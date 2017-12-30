class Variant < ApplicationRecord
  belongs_to :product, touch: true, class_name: 'Product', inverse_of: :variants
  has_many :images, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: 'Image'
end
