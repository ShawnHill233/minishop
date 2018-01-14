module Entities
  class Order < Grape::Entity
    root 'orders'
    expose :number
    expose :state
    expose :line_items, using: Entities::LineItem
    expose :payment_total
    expose :created_at do |order|
      order.created_at.strftime("%Y-%m-%d %H:%M")
    end
    expose :may_cancel do |order|
      order.may_cancel?
    end
    expose :may_payment do |order|
      order.state == 'payment'
    end
  end
end
