module Entities
  class Order < Grape::Entity
    root 'orders'
    expose :number
    expose :state
    expose :line_items, using: Entities::LineItem
    expose :payment_total
    expose :payment_state
    expose :created_at

    expose :may_cancel do |order|
      order.may_cancel?
    end
    expose :may_payment do |order|
      order.pending? || order.payment?
    end
  end
end
