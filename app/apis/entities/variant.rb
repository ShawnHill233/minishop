module Entities
  class Variant < Grape::Entity
    root 'variants'
    expose :id
    expose :price
    expose :option_values, using: Entities::OptionValue
  end
end
