module Entities
  class LineItem < Grape::Entity
    root 'line_items'
    expose :id
    expose :quantity
    expose :price do |line_item|
      line_item.line_itemable_type == 'Cart' ? line_item.newest_price : line_item.price
    end
    expose :checked
    expose :name do |line_item|
      line_item.product.name
    end
    expose :image do |line_item|
      line_item.product.images[0].try(:full_url, 'small')
    end
    expose :options_text
  end
end
