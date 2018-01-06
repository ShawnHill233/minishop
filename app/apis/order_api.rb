class OrderAPI < Grape::API
  include Grape::Kaminari

  resources :orders do

    desc '获取我的订单列表'
    get do
      present current_user.orders, with: Entities::Order
    end

    desc '创建订单, 去付款'

    post do
      order = current_user.cart.submit!
      order.start_pay!
      success_response
    end

    route_param :id do
      desc '获取订单详情'
      get do
        order = current_user.orders.find(params[:id])
        status 200
        present order, with: Entities::Order
      end

      desc '取消订单'
      post :cancel do
        order = current_user.orders.find(params[:id])
        order.cancel!
        status 200
        present order, with: Entities::Order
      end

    end

  end
end
