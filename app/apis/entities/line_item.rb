module Entities
  class LineItem < Grape::Entity
    root 'line_items'
    expose :id
    expose :quantity
    expose :price
    expose :checked
    expose :name do |line_item|
      line_item.product.name
    end
    expose :image do |line_item|
      line_item.product.images[0].try(:full_url)
    end
  end
end
