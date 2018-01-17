class Image < Attachment

  def full_url
    "http://pcyc.oss-cn-beijing.aliyuncs.com/" + url
  end
end
