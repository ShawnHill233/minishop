module Entities
  class Brand < Grape::Entity
    root 'brands'
    expose :id
    expose :name
    expose :icon do |brand|
      brand.icon.url
    end
  end
end
