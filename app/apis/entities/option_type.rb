module Entities
  class OptionType < Grape::Entity
    expose :id
    expose :name
    expose :option_values, using: Entities::OptionValue
  end
end
