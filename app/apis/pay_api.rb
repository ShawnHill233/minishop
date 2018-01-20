class PayAPI < Grape::API
  content_type :xml, 'text/xml'
  formatter :xml, Proc.new { |object|
    "#{object.to_xml(:skip_instruct => true, root: 'xml', :dasherize => false)}"
  }
  format :xml

  namespace :pay do
    desc '接收支付结果通知'
    post :notify do
      body = Nokogiri::XML(request.body)
      params = {}
      body.xpath('//*[not(sign)]').each do |node|
        params[node.name.to_sym] = node.text if node.name != 'sign'
      end
      params_str = params.sort.map { |p| p.join('=') }.join('&')
      sign_str_temp = params_str + "&key=#{Settings.merchant_secret}"
      sign = Digest::MD5.hexdigest(sign_str_temp).upcase

      order_number = body.xpath('//out_trade_no').text
      notify_sign = body.xpath('//sign').text
      total_fee = params[:total_fee]
      order = Order.find_by(number: order_number)
      puts "sign...#{sign}"
      puts "notify_sign...#{notify_sign}"
      puts "payment_total..#{(order.payment_total*100).to_i}"
      puts "total_fee...#{total_fee}"
      puts "e1: #{(order.payment_total*100).to_i == total_fee.to_i}"
      puts "e2: #{sign == notify_sign}"

      if sign == notify_sign && (order.payment_total*100).to_i == total_fee.to_i
        if order.may_complete_pay?
          order.complete_pay!
          order.complete!
        end

        status 200
        present return_code: 'SUCCESS', return_msg: 'OK'
      else
        puts "sign or fee not matching."

        status 200
        present return_code: 'FAIL', return_msg: 'FAIL'
      end

    end
  end
end
