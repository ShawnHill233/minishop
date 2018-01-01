class Order < ApplicationRecord

  has_many :line_items, -> { order(:created_at) }, inverse_of: :order, dependent: :destroy

  accepts_nested_attributes_for :line_items

end
