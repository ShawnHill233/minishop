class Product < ApplicationRecord
  has_one :master,
          -> { where is_master: true },
          inverse_of: :product,
          class_name: 'Variant'

  has_many :variants,
           -> { where(is_master: false).order(:position) },
           inverse_of: :product,
           class_name: 'Variant'

  has_many :variants_including_master,
           -> { order(:position) },
           inverse_of: :product,
           class_name: 'Variant',
           dependent: :destroy

  has_many :variant_images, -> { order(:position) }, source: :images, through: :variants_including_master
  [
      :sku, :price, :currency, :weight, :height, :width, :depth, :is_master,
      :cost_currency, :price_in, :amount_in, :cost_price, :images
  ].each do |method_name|
    delegate method_name, :"#{method_name}=", to: :find_or_build_master
  end

  def find_or_build_master
    master || build_master
  end

end
