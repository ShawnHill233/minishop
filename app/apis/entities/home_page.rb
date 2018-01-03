module Entities
  class HomePage < Grape::Entity
    expose :banners, using: Entities::Banner
    expose :products, using: Entities::Product
  end
end
