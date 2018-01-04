class Cart < ApplicationRecord

  belongs_to :user
  has_many :line_items, -> { order(:created_at) }, inverse_of: :cart, dependent: :destroy

  def add(variant_id, quantity)
    line_item = line_items.find_by(variant_id: variant_id)
    if line_item
      line_item.quantity += quantity
    else
      line_item = line_items.new(variant_id: variant_id, quantity: quantity)
    end
    line_item.save!
  end

  def remove(line_item)
    line_item.destroy
  end

  def total_amount
    line_items.inject(0){ |sum, item| sum + item.price * item.quantity }
  end
end
