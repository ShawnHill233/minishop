module Entities
  class Product < Grape::Entity
    root 'products'
    expose :id
    expose :name
    expose :description
    expose :price
    expose :images do
      expose :product do |product|
        product.images.map { |image| image.full_url('product') }
      end
      expose :large do |product|
        product.images.map { |image| image.full_url('large') }
      end
      expose :small do |product|
        product.images.map { |image| image.full_url('small') }
      end
    end
    expose :product_properties, using: Entities::ProductProperty
    expose :details
    expose :option_types, using: Entities::OptionType
    expose :master, using: Entities::Variant
    expose :variants, using: Entities::Variant
  end
end
