class CheckoutAPI < Grape::API

  namespace :checkout do

    desc '立即购买方式确认订单'
    params do
      requires :variant_id, type: Integer, desc: '版本ID'
      requires :quantity, type: Integer, desc: '数量'
    end
    post do
      line_item = LineItem.new(variant_id: params[:variant_id], quantity: params[:quantity])
      line_item.copy_price
      amount = line_item.price * line_item.quantity
      status 200
      present :line_item, line_item, with: Entities::LineItem
      present :checked_amount, amount
    end

  end
end
