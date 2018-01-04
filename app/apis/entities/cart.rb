module Entities
  class Cart < Grape::Entity
    expose :items_count do |cart|
      cart.line_items.count
    end
  end
end
