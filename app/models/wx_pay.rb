class WxPay
  require 'digest'
  require 'net/http'
  require 'net/https'

  UNIFIED_ORDER_URL = 'https://api.mch.weixin.qq.com/pay/unifiedorder'

  class << self

    # 统一下单
    def unifiedorder(openid, order, client_ip)
      nonce_str = SecureRandom.hex
      total_fee = (order.payment_total * 100).to_i
      params = {
          appid: Settings.wx_appid,
          attach: '平昌养车',
          body: order.line_items.map { |item| item.product.name }.join(","),
          mch_id: Settings.merchant_id,
          nonce_str: nonce_str,
          notify_url: Settings.pay_notify_url,
          openid: openid,
          out_trade_no: order.number,
          spbill_create_ip: client_ip,
          total_fee: total_fee,
          trade_type: 'JSAPI',
      }
      params_str = params.sort.map { |p| p.join('=') }.join('&')
      sign_str_temp = params_str + "&key=#{Settings.merchant_secret}"
      sign = Digest::MD5.hexdigest(sign_str_temp).upcase
      params[:sign] = sign
      xml_str = params.to_xml(:skip_instruct => true, root: 'xml', :dasherize => false)

      puts "request xml string: #{xml_str}"
      response = post_xml(UNIFIED_ORDER_URL, xml_str)
      puts "response body is... #{response.body}"
      prepay_id = Nokogiri::XML(response.body).xpath('//prepay_id').text
      puts "prepay_id: #{prepay_id}"
      return prepay_id
    end

    def mp_pay_params(openid, order, client_ip)
      prepay_id = unifiedorder(openid, order, client_ip)
      nonce_str = SecureRandom.hex
      time_stamp = Time.now.to_i.to_s
      package = "prepay_id=#{prepay_id}"
      sign_type = 'MD5'
      sign_string="appId=#{Settings.wx_appid}&nonceStr=#{nonce_str}&package=#{package}&signType=#{sign_type}&timeStamp=#{time_stamp}&key=#{Settings.merchant_secret}"
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