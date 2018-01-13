class WxPay
  require 'digest'
  require 'net/http'

  UNIFIED_ORDER_URL = 'https://api.mch.weixin.qq.com/pay/unifiedorder'

  private
  def post_xml(url_string, xml_string)
    uri = URI.parse url_string
    request = Net::HTTP::Post.new uri.path
    request.body = xml_string
    request.content_type = 'text/xml'
    response = Net::HTTP.new(uri.host, uri.port).start { |http| http.request request }
    response.body
  end

  class << self

    # 统一下单
    def unifiedorder(openid, order)
      sign_string="appid=#{Settings.wx_appid}&attach=平昌养车&body=购买商品&mch_id=#{Settings.merchant_id}&nonceStr=#{nonce_str}&notify_url=#{Settings.pay_notify_url}&openid=#{openid}&out_trade_no=#{order.number}&spbill_create_ip=127.0.0.1&total_fee=#{order.payment_total}&trade_type=JSAPI&key=#{Settings.wx_secret}"
      sign = Digest::MD5.hexdigest(sign_string).upcase
      xml_str = <<-EOF
        <xml>
           <appid>#{Settings.wx_appid}</appid>
           <attach>平昌养车</attach>
           <body>购买商品</body>
           <mch_id>#{Settings.merchant_id}</mch_id>
           <detail><![CDATA[{ "goods_detail":[ { "goods_id":"iphone6s_16G", "wxpay_goods_id":"1001", "goods_name":"iPhone6s 16G", "quantity":1, "price":528800, "goods_category":"123456", "body":"苹果手机" }, { "goods_id":"iphone6s_32G", "wxpay_goods_id":"1002", "goods_name":"iPhone6s 32G", "quantity":1, "price":608800, "goods_category":"123789", "body":"苹果手机" } ] }]]></detail>
           <nonce_str>#{SecureRandom.hex}</nonce_str>
           <notify_url>#{Settings.pay_notify_url}</notify_url>
           <openid>#{openid}</openid>
           <out_trade_no>#{order.number}</out_trade_no>
           <spbill_create_ip>127.0.0.1</spbill_create_ip>
           <total_fee>#{order.payment_total}</total_fee>
           <trade_type>JSAPI</trade_type>
           <sign>#{sign}</sign>
        </xml>
      EOF

      response = post_xml(UNIFIED_ORDER_URL, xml_str)
      prepay_id = Nokogiri::XML(response.body.read).xpath('//prepay_id').text
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
  end
end