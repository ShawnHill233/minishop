class WxPay
  require 'digest'
  require 'net/http'
  require 'net/https'

  UNIFIED_ORDER_URL = 'https://api.mch.weixin.qq.com/pay/unifiedorder'

  class << self

    # 统一下单
    def unifiedorder(openid, order)
      nonce_str = SecureRandom.hex
      total_fee = (order.payment_total * 100).to_i
      sign_string="appid=#{Settings.wx_appid}&attach=平昌养车&body=购买商品&mch_id=#{Settings.merchant_id}&nonce_str=#{nonce_str}&notify_url=#{Settings.pay_notify_url}&openid=#{openid}&out_trade_no=#{order.number}&spbill_create_ip=127.0.0.1&total_fee=#{total_fee}&trade_type=JSAPI&key=#{Settings.merchant_secret}"
      sign = Digest::MD5.hexdigest(sign_string).upcase
      xml_str = <<-EOF
        <xml>
           <appid>#{Settings.wx_appid}</appid>
           <attach>平昌养车</attach>
           <body>购买商品</body>
           <mch_id>#{Settings.merchant_id}</mch_id>
           <nonce_str>#{nonce_str}</nonce_str>
           <notify_url>#{Settings.pay_notify_url}</notify_url>
           <openid>#{openid}</openid>
           <out_trade_no>#{order.number}</out_trade_no>
           <spbill_create_ip>127.0.0.1</spbill_create_ip>
           <total_fee>#{total_fee}</total_fee>
           <trade_type>JSAPI</trade_type>
           <sign>#{sign}</sign>
        </xml>
      EOF

      response = post_xml(UNIFIED_ORDER_URL, xml_str)
      puts "response body is... #{response.body}"
      prepay_id = Nokogiri::XML(response.body).xpath('//prepay_id').text
      puts "prepay_id: #{prepay_id}"
      prepay_id
    end

    def mp_pay_params(openid, order)
      prepay_id = unifiedorder(openid, order)

      time_stamp = Time.now.to_i.to_s
      nonce_str = SecureRandom.hex
      package = "prepay_id=#{prepay_id}"
      sign_type = 'MD5'
      sign_string="appId=#{Settings.wx_appid}&nonceStr=#{nonce_str}&package=#{package}&signType=#{sign_type}&timeStamp=#{time_stamp}&key=#{Settings.wx_secret}"
      pay_sign = Digest::MD5.hexdigest(sign_string).upcase

      params = {
          timeStamp: time_stamp,
          nonceStr: nonce_str,
          package: package,
          signType: sign_type,
          paySign: pay_sign
      }
    end

    private
    def post_xml(url_string, xml_string)
      uri = URI.parse url_string
      puts "uri: #{uri}, uri.path: #{uri.path}, uri.host: #{uri.host}, uri.port: #{uri.port}"

      https = Net::HTTP.new(uri.host,uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new uri.path
      request.body = xml_string
      request.content_type = 'text/xml'
      response = https.request request

      response
    end
  end
end