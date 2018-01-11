class Prototype < ApplicationRecord
  has_many :property_prototypes
  has_many :properties, through: :property_prototypes

  accepts_nested_attributes_for :property_prototypes
end
