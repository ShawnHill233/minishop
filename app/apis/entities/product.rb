module Entities
  class Product < Grape::Entity
    root 'products'
    expose :id
    expose :images do |product|
      product.images.map(&:url)
    end
  end
end
