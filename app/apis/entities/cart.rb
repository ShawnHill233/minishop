module Entities
  class Cart < Grape::Entity
    expose :items_count do |cart|
      cart.line_items.count
    end
    expose :checked_amount do |cart|
      cart.checked_amount
    end
    expose :checked_count do |cart|
      cart.line_items.checked.count
    end
    expose :line_items, using: Entities::LineItem
  end
end
