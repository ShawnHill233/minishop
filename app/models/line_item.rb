class LineItem < ApplicationRecord

  belongs_to :cart, optional: true
  belongs_to :order, optional: true
  belongs_to :variant

  has_one :product, through: :variant
  delegate :name, :description, :sku, :should_track_inventory?, :product, :options_text, to: :variant

  before_validation :copy_price

  def copy_price
    if variant
      self.price = variant.price
    end
  end

end
