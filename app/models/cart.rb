class Cart < ApplicationRecord

  belongs_to :user
  has_many :line_items, -> { order(:created_at) }, as: :line_itemable

  def add(variant_id, quantity)
    line_item = line_items.find_by(variant_id: variant_id)
    if line_item
      line_item.quantity += quantity
    else
      line_item = line_items.new(variant_id: variant_id, quantity: quantity)
    end
    line_item.save!
  end

  def remove!(line_items)
    line_items.destroy_all
  end

  def checked_amount
    line_items.checked.inject(0){ |sum, item| sum + item.newest_price * item.quantity }
  end

  def submit!
    line_items = self.line_items.checked
    line_items = LineItem.update_price(line_items)
    order = Order.create_order(self.user, line_items)
    return order
  end
end
