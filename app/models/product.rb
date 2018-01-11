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

  has_many :product_properties, dependent: :destroy, inverse_of: :product
  has_many :properties, through: :product_properties
  accepts_nested_attributes_for :product_properties, :allow_destroy => true

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_one :product_brand, dependent: :destroy
  has_one :brand, through: :product_brand


  after_create :add_associations_from_prototype
  after_save :save_master

  def find_or_build_master
    master || build_master
  end

  # there's a weird quirk with the delegate stuff that does not automatically save the delegate object
  # when saving so we force a save using a hook
  # Fix for issue #5306
  def save_master
    master.save!
  end

  # Adding properties and option types on creation based on a chosen prototype
  attr_reader :prototype_id
  def prototype_id=(value)
    @prototype_id = value.to_i
  end

  private
  def add_associations_from_prototype
    if prototype_id && prototype = Prototype.find_by(id: prototype_id)
      prototype.properties.each do |property|
        product_properties.create(property: property)
      end
    end
  end

end
