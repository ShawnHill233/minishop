class Brand < ApplicationRecord
  has_one :icon, as: :attachable, dependent: :destroy, class_name: 'Image', inverse_of: :attachable

end
