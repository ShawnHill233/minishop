class OrderAPI < Grape::API
  include Grape::Kaminari

  resources :orders do

    desc '获取我的订单列表'
    get do
      orders = current_user.orders.order(created_at: :desc)
      present orders, with: Entities::Order
    end

    desc '创建订单, 去付款'

    post do
      order = current_user.cart.submit!
      order.start_pay!
      status 200
      present order, with: Entities::Order
    end

    route_param :number do
      desc '获取订单详情'
      get do
        order = current_user.orders.find_by(number: params[:number])
        status 200
        present order, with: Entities::Order
      end

      desc '取消订单'
      post :cancel do
        order = current_user.orders.find_by(number: params[:number])
        order.cancel!
        status 200
        present order, with: Entities::Order
      end

      desc '到店支付'
      post :delay_pay do
        order = current_user.orders.find_by(number: params[:number])
        order.delay_pay!
        success_response
      end

      desc '获取小程序支付参数'
      get :mp_pay_params do
        order = current_user.orders.find_by(number: params[:number])
        pay_params = WxPay.mp_pay_params(current_user.openid, order)
        present pay_params: pay_params
      end


    end

  end
end
