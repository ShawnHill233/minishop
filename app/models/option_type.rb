class OptionType < ApplicationRecord

  with_options dependent: :destroy, inverse_of: :option_type do
    has_many :option_values, -> { order(:position) }
    has_many :product_option_types
  end

  has_many :products, through: :product_option_types

  with_options presence: true do
    validates :name, uniqueness: { case_sensitive: false, allow_blank: true }
    validates :presentation
  end

  default_scope { order(:position) }

  accepts_nested_attributes_for :option_values, reject_if: ->(ov) { ov[:name].blank? || ov[:presentation].blank? }, allow_destroy: true

  after_touch :touch_all_products

  private

  def touch_all_products
    products.update_all(updated_at: Time.current)
  end
end