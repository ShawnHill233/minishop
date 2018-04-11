class Variant < ApplicationRecord
  belongs_to :product, touch: true, class_name: 'Product', inverse_of: :variants
  delegate :name, :name=, :description, to: :product

  before_destroy :ensure_no_line_items

  has_many :images, as: :attachable, dependent: :destroy, class_name: 'Image', inverse_of: :attachable

  has_many :option_value_variants
  has_many :option_values, through: :option_value_variants
  # validates :option_values, presence: true, unless: :is_master?

  def product
    Product.unscoped { super }
  end

  def options=(options = {})
    options.each do |option|
      set_option_value(option[:name], option[:value])
    end
  end

  def set_option_value(opt_name, opt_value)
    # no option values on master
    return if is_master

    option_type = OptionType.where(name: opt_name).first_or_initialize do |o|
      o.presentation = opt_name
      o.save!
    end

    current_value = option_values.detect { |o| o.option_type.name == opt_name }

    if current_value.nil?
      # then we have to check to make sure that the product has the option type
      unless product.option_types.include? option_type
        product.option_types << option_type
      end
    else
      return if current_value.name == opt_value
      option_values.delete(current_value)
    end

    option_value = OptionValue.where(option_type_id: option_type.id, name: opt_value).first_or_initialize do |o|
      o.presentation = opt_value
      o.save!
    end

    option_values << option_value
    save
  end

  def option_value(opt_name)
    option_values.detect { |o| o.option_type.name == opt_name }.try(:presentation)
  end

  private
  def ensure_no_line_items
    if line_items.any?
      errors.add(:base, :cannot_destroy_if_attached_to_line_items)
      throw(:abort)
    end
  end
end
