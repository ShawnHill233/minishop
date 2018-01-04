class Cart < ApplicationRecord

  belongs_to :user
  has_many :line_items, -> { order(:created_at) }, inverse_of: :cart, dependent: :destroy

  def add(variant, quantity)
    line_items.create(variant: variant, quantity: quantity)
  end

  def remove(line_item)
    line_item.destroy
  end
end
