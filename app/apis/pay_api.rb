class PayAPI < Grape::API
  content_type :xml, 'text/xml'
  formatter :xml, Proc.new { |object|
    "#{object.to_xml(:skip_instruct => true, root: 'xml', :dasherize => false)}"
  }
  format :xml

  namespace :pay do
    desc '接收支付结果通知'
    post :notify do
      puts "get notify *************************"
      body = Nokogiri::XML(request.body)
      order_number = body.xpath('//out_trade_no').text
      puts "=========================="
      puts "order_number: #{order_number}"
      puts "=========================="
      order = Order.find_by(number: order_number)
      order.complete_pay!
      order.complete!

      status 200
      present return_code: 'SUCCESS', return_msg: 'OK'
    end
  end
end
