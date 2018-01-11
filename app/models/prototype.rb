class Prototype < ApplicationRecord
  has_many :property_prototypes
  has_many :properties, through: :property_prototypes
end
