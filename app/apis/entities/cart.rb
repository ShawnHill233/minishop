module Entities
  class Cart < Grape::Entity
    expose :items_count do |cart|
      cart.line_items.count
    end
    expose :total do |cart|
      cart.total_amount
    end
    expose :line_items, using: Entities::LineItem
  end
end
