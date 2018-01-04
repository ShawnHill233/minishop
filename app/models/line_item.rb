class LineItem < ApplicationRecord

  with_options inverse_of: :line_items do
    belongs_to :cart
    belongs_to :order
    belongs_to :variant
  end

  has_one :product, through: :variant
  delegate :name, :description, :sku, :should_track_inventory?, :product, :options_text, to: :variant

end
