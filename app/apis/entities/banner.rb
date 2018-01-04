module Entities
  class Banner < Grape::Entity
    root 'banners'
    expose :id
    expose :product_id
    expose :image do |banner|
      banner.image.full_url
    end
  end
end
