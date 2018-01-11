class PropertiesPrototype < ApplicationRecord
  belongs_to :prototype
  belongs_to :property

  validates :prototype, :property, presence: true
  validates :prototype_id, uniqueness: { scope: :property_id }
end
