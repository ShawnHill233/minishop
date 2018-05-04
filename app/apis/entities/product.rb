module Entities
  class Product < Grape::Entity
    root 'products'
    expose :id
    expose :name
    expose :description
    expose :price
    expose :images do |product, options|
      if options[:image_style] == 'product'
        product.images.map { |image| image.full_url('product') }
      elsif options[:image_style] == 'large'
        product.images.map { |image| image.full_url('large') }
      else
        product.images.map { |image| image.full_url }
      end
    end
    expose :product_properties, using: Entities::ProductProperty
    expose :details
    expose :option_types, using: Entities::OptionType
    expose :master, using: Entities::Variant
    expose :variants, using: Entities::Variant
  end
end
