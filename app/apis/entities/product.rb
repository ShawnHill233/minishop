module Entities
  class Product < Grape::Entity
    root 'products'
    expose :id
    expose :name
    expose :description
    expose :price
    expose :images do |product|
      product.images.map(&:full_url)
    end
  end
end
