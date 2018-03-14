class Variant < ApplicationRecord
  belongs_to :product, touch: true, class_name: 'Product', inverse_of: :variants
  has_many :images, as: :attachable, dependent: :destroy, class_name: 'Image', inverse_of: :attachable

  has_many :option_value_variants
  has_many :option_values, through: :option_value_variants
  # validates :option_values, presence: true, unless: :is_master?

end
