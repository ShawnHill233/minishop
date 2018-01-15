module Entities
  class ProductProperty < Grape::Entity
    expose :name do |pp|
      pp.property.name
    end
    expose :value
  end
end
