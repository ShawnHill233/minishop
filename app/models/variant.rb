class Variant < ApplicationRecord
  belongs_to :product, touch: true, class_name: 'Product', inverse_of: :variants
end
