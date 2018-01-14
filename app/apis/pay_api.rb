class PayAPI < Grape::API

  formatter :xml, Proc.new { |object|
    "#{object.to_xml(:skip_instruct => true, root: 'xml')}"
  }
  format :xml

  namespace :pay do
    desc '接收支付结果通知'
    post :notify do
      puts "=========================="
      puts Nokogiri::XML(request.body)
      puts "=========================="
      body = Nokogiri::XML(request.body)
      order_number = body.xpath('//out_trade_no').text
      order = Order.find_by(number: order_number)
      order.complete_pay!
      order.complete!
      status 200
      present return_code: 'SUCCESS', return_msg: 'OK'
    end
  end
end
