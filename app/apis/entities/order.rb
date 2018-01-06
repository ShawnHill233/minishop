module Entities
  class Order < Grape::Entity
    root 'orders'
    expose :id
    expose :number
    expose :state
    expose :line_items, using: Entities::LineItem
    expose :total do |order|
      order.total_amount
    end
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
