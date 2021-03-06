class ProductProperty < ApplicationRecord
  belongs_to :product
  belongs_to :property
  accepts_nested_attributes_for :property
  delegate :name, to: :property, prefix: true, allow_nil: true

  def property_name=(name)
    if name.present?
      # don't use `find_by :name` to workaround globalize/globalize#423 bug
      self.property = Property.where(name: name).first_or_create(presentation: name)
    end
  end
end
