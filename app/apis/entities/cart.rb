module Entities
  class Cart < Grape::Entity
    expose :items_count do |cart|
      cart.line_items.inject(0){ |sum, item| sum + item.quantity }
    end
    expose :checked_amount do |cart|
      cart.checked_amount
    end
    expose :checked_count do |cart|
      cart.line_items.checked.inject(0){ |sum, item| sum + item.quantity }
    end
    expose :line_items, using: Entities::LineItem
  end
end
