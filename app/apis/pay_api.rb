class PayAPI < Grape::API

  namespace :pay do

    desc '接收支付结果通知'
    post :notify do

    end
  end
end
