class Image < Attachment

  def full_url(style = nil)
    origin_url = "http://pcyc.oss-cn-beijing.aliyuncs.com/" + url
    case style
      when 'small'
        origin_url + '?x-oss-process=image/resize,w_100,h_100'
      when 'product'
        origin_url + '?x-oss-process=image/resize,w_240,h_240'
      when 'large'
        origin_url + '?x-oss-process=image/resize,w_600,h_600'
      else
        origin_url
    end
  end
end
