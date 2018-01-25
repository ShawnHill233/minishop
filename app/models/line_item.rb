class LineItem < ApplicationRecord

  belongs_to :line_itemable, polymorphic: true
  belongs_to :variant

  has_one :product, through: :variant
  delegate :name, :description, :sku, :should_track_inventory?, :product, :options_text, to: :variant

  before_validation :copy_price

  scope :checked, -> { where(checked: true) }

  def copy_price
    if variant
      self.price = variant.price
    end
  end

  def newest_price
    variant.price
  end

  class << self

    def update_price(line_items)
      line_items.each do |line_item|
        line_item.price = line_item.newest_price
      end
      line_items
    end
  end

end
