module Entities
  class HomePage < Grape::Entity
    expose :banners, using: Entities::Banner
    expose :tire_brands, using: Entities::Brand
    expose :clear_brands, using: Entities::Brand
  end
end
